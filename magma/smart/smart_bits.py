import abc
import copy
import enum
import inspect
import operator

from magma.bits import Bits, BitsMeta, SInt
from magma.conversions import uint, bits, concat, sint
from magma.debug import debug_wire
from magma.primitives.reduce import reduce
from magma.protocol_type import MagmaProtocolMeta, MagmaProtocol


def _is_int(value):
    try:
        int(value)
    except (ValueError, TypeError):
        return False
    return True


class Context:
    def __init__(self, assignee, root):
        self.assignee = assignee
        self.root = root

    def max_width(self):

        def _visit(node):
            if hasattr(node, "_width_"):
                return node._width_
            if isinstance(node, _SmartBitsExpr):
                return len(node.bits)
            return max(_visit(arg) for arg in node.args)

        max_width = _visit(self.root)
        if self.assignee is not None:
            max_width = max(max_width, len(self.assignee.bits))
        return max_width


class _SmartExprMeta(MagmaProtocolMeta):
    pass


class _SmartExpr(MagmaProtocol, metaclass=_SmartExprMeta):
    @abc.abstractmethod
    def resolve(self, context):
        raise NotImplementedError()

    # Binary arithmetic operators.
    def __add__(self, other: '_SmartExpr'):
        if not isinstance(other, _SmartExpr):
            return NotImplemented
        return _SmartBinaryOpExpr(operator.add, self, other)

    def __sub__(self, other: '_SmartExpr'):
        if not isinstance(other, _SmartExpr):
            return NotImplemented
        return _SmartBinaryOpExpr(operator.sub, self, other)

    def __mul__(self, other: '_SmartExpr'):
        if not isinstance(other, _SmartExpr):
            return NotImplemented
        return _SmartBinaryOpExpr(operator.mul, self, other)

    def __floordiv__(self, other: '_SmartExpr'):
        if not isinstance(other, _SmartExpr):
            return NotImplemented
        return _SmartBinaryOpExpr(operator.floordiv, self, other)

    def __truediv__(self, other: '_SmartExpr'):
        if not isinstance(other, _SmartExpr):
            return NotImplemented
        return _SmartBinaryOpExpr(operator.truediv, self, other)

    def __mod__(self, other: '_SmartExpr'):
        if not isinstance(other, _SmartExpr):
            return NotImplemented
        return _SmartBinaryOpExpr(operator.mod, self, other)

    # Binary logic operators.
    def __and__(self, other: '_SmartExpr'):
        if not isinstance(other, _SmartExpr):
            return NotImplemented
        return _SmartBinaryOpExpr(operator.and_, self, other)

    def __or__(self, other: '_SmartExpr'):
        if not isinstance(other, _SmartExpr):
            return NotImplemented
        return _SmartBinaryOpExpr(operator.or_, self, other)

    def __xor__(self, other: '_SmartExpr'):
        if not isinstance(other, _SmartExpr):
            return NotImplemented
        return _SmartBinaryOpExpr(operator.xor_, self, other)

    # Comparison operators.
    def __eq__(self, other: '_SmartExpr'):
        if not isinstance(other, _SmartExpr):
            return NotImplemented
        return _SmartComparisonOpExpr(operator.eq, self, other)

    def __ne__(self, other: '_SmartExpr'):
        if not isinstance(other, _SmartExpr):
            return NotImplemented
        return _SmartComparisonOpExpr(operator.ne, self, other)

    def __ge__(self, other: '_SmartExpr'):
        if not isinstance(other, _SmartExpr):
            return NotImplemented
        return _SmartComparisonOpExpr(operator.ge, self, other)

    def __gt__(self, other: '_SmartExpr'):
        if not isinstance(other, _SmartExpr):
            return NotImplemented
        return _SmartComparisonOpExpr(operator.gt, self, other)

    def __le__(self, other: '_SmartExpr'):
        if not isinstance(other, _SmartExpr):
            return NotImplemented
        return _SmartComparisonOpExpr(operator.le, self, other)

    def __lt__(self, other: '_SmartExpr'):
        if not isinstance(other, _SmartExpr):
            return NotImplemented
        return _SmartComparisonOpExpr(operator.lt, self, other)

    # Shift operators.
    def __lshift__(self, other: '_SmartExpr'):
        if not isinstance(other, _SmartExpr):
            return NotImplemented
        return _SmartShiftOpExpr(operator.lshift, self, other)

    def __rshift__(self, other: '_SmartExpr'):
        if not isinstance(other, _SmartExpr):
            return NotImplemented
        return _SmartShiftOpExpr(operator.rshift, self, other)

    # Unary operators.
    def __invert__(self):
        return _SmartUnaryOpExpr(operator.invert, self)

    def __neg__(self):
        return _SmartUnaryOpExpr(operator.neg, self)

    # Reduction operators.
    def reduce(self, op):
        return _SmartReductionOpExpr(op, self)


class _SmartOpExpr(_SmartExpr, metaclass=_SmartExprMeta):
    def __init__(self, op, *args):
        self._op = op
        self._args = args

    @property
    def args(self):
        return self._args

    @property
    def op(self):
        return self._op

    def _update(self, *args):
        self._args = args

    def _resolve_args(self, context):
        for arg in self._args:
            arg.resolve(context)

    def __str__(self):
        if inspect.isbuiltin(self._op):
            op_str = self._op.__name__
        else:
            op_str = str(self._op)
        args = ", ".join(str(arg) for arg in self._args)
        return f"{op_str}({args})"


class _SmartExtendOpExpr(_SmartOpExpr):

    class _ExtendOp:
        def __init__(self, width):
            self._width = width

        def __call__(self, operand):
            return operand.zext(self._width)

        def __str__(self):
            return f"Extend[{self._width}]"

    def __init__(self, width, operand):
        extend = _SmartExtendOpExpr._ExtendOp(width)
        super().__init__(extend, operand)


def _extend_if_needed(expr, to_width):
    diff = expr._width_ - to_width
    assert diff <= 0
    if diff == 0:
        return expr
    expr = _SmartExtendOpExpr(-diff, expr)
    expr._width_ = to_width
    return expr


class _SmartReductionOpExpr(_SmartOpExpr):

    class _ReductionOp:
        _OP_TO_NAME = {
            operator.and_: "And",
            operator.or_: "Or",
            operator.xor: "Xor",
        }

        def __init__(self, op):
            cls = _SmartReductionOpExpr._ReductionOp
            if op not in cls._OP_TO_NAME:
                raise ValueError(f"Reduction operator {op} not supported")
            self._op = op

        def __call__(self, operand):
            return reduce(self._op, operand)

        def __str__(self):
            cls = _SmartReductionOpExpr._ReductionOp
            op_name = cls._OP_TO_NAME[self._op]
            return f"{op_name}Reduce"

    def __init__(self, op, operand):
        reduction = _SmartReductionOpExpr._ReductionOp(op)
        super().__init__(reduction, operand)

    def resolve(self, context):
        context = Context(None, self)
        self._resolve_args(context)
        self._width_ = 1


class _SmartNAryContextualOpExr(_SmartOpExpr):
    def __init__(self, op, *args):
        super().__init__(op, *args)

    def resolve(self, context):
        self._resolve_args(context)
        to_width = context.max_width()
        args = (_extend_if_needed(arg, to_width) for arg in self._args)
        self._update(*args)
        self._width_ = to_width


class _SmartBinaryOpExpr(_SmartNAryContextualOpExr):
    def __init__(self, op, loperand, roperand):
        super().__init__(op, loperand, roperand)


class _SmartUnaryOpExpr(_SmartNAryContextualOpExr):
    def __init__(self, op, operand):
        super().__init__(op, operand)


class _SmartComparisonOpExpr(_SmartOpExpr):
    def __init__(self, op, loperand, roperand):
        super().__init__(op, loperand, roperand)

    def resolve(self, context):
        context = Context(None, self)
        self._resolve_args(context)
        to_width = max(arg._width_ for arg in self._args)
        args = (_extend_if_needed(arg, to_width) for arg in self._args)
        self._update(*args)
        self._width_ = 1


class _SmartShiftOpExpr(_SmartOpExpr):
    def __init__(self, op, loperand, roperand):
        super().__init__(op, loperand, roperand)

    def resolve(self, context):
        loperand, roperand = self._args
        loperand.resolve(context)
        self_context = Context(None, self)
        roperand.resolve(self_context)
        to_width = max(arg._width_ for arg in self._args)
        args = (_extend_if_needed(arg, to_width) for arg in self._args)
        self._update(*args)
        self._width_ = to_width


class _SmartConcatOpExpr(_SmartOpExpr):

    class _ConcatOp:
        def __call__(self, *args):
            return concat(*args)

        def __str__(self):
            return "Concat"

    def __init__(self, op, *args):
        concat = _SmartConcatOpExpr._ConcatOp()
        super().__init__(concat, *args)

    def resolve(self, context):
        context = Context(None, self)
        self._resolve_args(context)
        self._width_ = sum(arg._width_ for arg in self._args)


def concat(*args):
    if not isinstance(other, _SmartExpr):
        return NotImplemented


class _SmartBitsExpr(_SmartExpr, metaclass=_SmartExprMeta):
    def __init__(self, bits):
        self._bits = bits

    @property
    def bits(self):
        return self._bits

    def __str__(self):
        return str(self._bits)

    def resolve(self, context):
        self._width_ = len(self._bits)


class _SmartBitsMeta(_SmartExprMeta):
    def __getitem__(cls, key):
        assert cls is SmartBits
        signed = False
        if isinstance(key, tuple):
            if len(key) == 1:
                pass
            elif len(key) == 2:
                key, signed = key
            else:
                raise ValueError(f"{key} unsupported")
        if _is_int(key):
            T = Bits[key]
        else:
            assert isinstance(key, BitsMeta)
            T = key
        name = f"SmartBits[{len(T)}, {signed}]"
        dct = {"_T": T, "_signed": signed}
        return type(cls)(name, (cls,), dct)

    def _to_magma_(cls):
        return cls._T

    def _qualify_magma_(cls, d):
        return SmartBits[cls._T.qualify(d), cls._signed]

    def _flip_magma_(cls):
        return SmartBits[cls._T.flip(), cls._signed]

    def _from_magma_value_(cls, value):
        return cls(value)

    def __repr__(cls):
        return f"SmartBits[{len(cls._T)}, {cls._signed}]"


class SmartBits(_SmartBitsExpr, metaclass=_SmartBitsMeta):
    def __init__(self, value=None):
        super().__init__(self)
        if value is None:
            value = type(self)._to_magma_()()
        self._value = bits(value)

    def typed_value(self):
        if type(self)._signed:
            return sint(self._value)
        return uint(self._value)

    def untyped_value(self):
        return self._value

    def __hash__(self):
        return hash(self._value)

    def _get_magma_value_(self):
        return self.untyped_value()

    def __deepcopy__(self, memo):
        return type(self)(self._value)

    @debug_wire
    def wire(self, other, debug_info):
        if not isinstance(other, _SmartExpr):
            raise ValueError(f"Can not wire {type(self)} to {type(other)}")
        evaluated = _eval(self, other)
        evaluated = evaluated.force_width(len(self))
        MagmaProtocol.wire(self, evaluated)

    def __len__(self):
        return len(type(self)._T)

    def force_width(self, width):
        diff = len(self) - width
        if diff == 0:
            return copy.deepcopy(self)
        value = self.typed_value()
        value = value.ext(-diff) if diff < 0 else value[:-diff]
        return SmartBits.make(value)

    @staticmethod
    def make(value):
        assert isinstance(value, Bits)
        signed = isinstance(value, SInt)
        return SmartBits[len(value), signed](value)

    def __str__(self):
        signed = type(self)._signed
        return f"SmartBits[{len(self)}, {signed}]({str(self._value)})"


class SmartBit(SmartBits[1]):
    pass


def _eval(lhs, rhs):
    # Internal debugging asserts.
    assert isinstance(lhs, SmartBits)
    assert isinstance(rhs, _SmartExpr)

    rhs = copy.deepcopy(rhs)
    rhs.resolve(Context(lhs, rhs))

    def __eval(node):
        if isinstance(node, _SmartBitsExpr):
            return node
        if isinstance(node, _SmartOpExpr):
            args = (__eval(arg) for arg in node.args)
            args = (arg.bits.typed_value() for arg in args)
            raw = node.op(*args)
            return SmartBits.make(bits(raw))
        raise NotImplementedError(node)

    return __eval(rhs)
