import functools
from collections import OrderedDict
from collections.abc import Sequence, Mapping
from .compatibility import IntegerTypes
from .t import Type, In, Out, InOut, Direction
from .digital import Digital
from .bit import Bit, VCC, GND
from .bits import Bits
from .digital import DigitalMeta
from .clock import Clock, Reset, AsyncReset, AsyncResetN, Enable
from .array import Array
from .bits import Bits, UInt, SInt
from .bfloat import BFloat
from .digital import Digital
from .tuple import Tuple, Product
from .bitutils import int2seq
import hwtypes

__all__ = ['bit']
__all__ += ['clock', 'reset', 'enable', 'asyncreset', 'asyncresetn']

__all__ += ['array']
__all__ += ['bits', 'uint', 'sint']

__all__ += ['tuple_', 'namedtuple']

__all__ += ['concat', 'repeat']
__all__ += ['sext', 'zext']
__all__ += ['replace']

def can_convert_to_bit(value):
    return isinstance(value, (Digital, Array, Tuple, IntegerTypes))


def can_convert_to_bit_type(value):
    return issubclass(value, (Digital, Array, Tuple))


def convertbit(value, totype):
    if isinstance(value, totype):
        return value

    if not can_convert_to_bit(value):
        raise ValueError(
            "bit can only be used on a Bit, an Array, or an int"
            f"; not {type(value)}")

    if isinstance(value, (Array, Tuple)):
        if len(value) != 1:
            raise ValueError(
                "bit can only be used on arrays and tuples of length 1"
                f"; not {type(value)}")
        value = value[0]
        if not isinstance(value, Digital):
            raise ValueError(
                "bit can only be used on arrays and tuples of bits"
                f"; not {type(value)}")

    assert isinstance(value, (IntegerTypes, Digital))

    if isinstance(value, IntegerTypes):
        value = VCC if value else GND

    if value.is_input():
        b = In(totype)(name=value.name)
    elif value.is_output():
        b = Out(totype)(name=value.name)
    else:
        b = totype()
    b._wire = value._wire
    return b


def bit(value):
    return convertbit(value, Bit)


def clock(value):
    return convertbit(value, Clock)


def reset(value):
    return convertbit(value, Reset)


def asyncreset(value):
    return convertbit(value, AsyncReset)


def asyncresetn(value):
    return convertbit(value, AsyncResetN)


def enable(value):
    return convertbit(value, Enable)


def convertbits(value, n, totype, checkbit):
    if isinstance(value, totype):
        if n is not None and n != len(value):
            raise ValueError("converting a value should not change the size, use concat, zext, or sext instead.")
        return value

    convertible_types = (Digital, Tuple, Array, IntegerTypes,
                         Sequence)
    if not isinstance(value, convertible_types):
        raise ValueError(
            "bits can only be used on a Bit, an Array, a Tuple, an int, or a"
            f" Sequence; not : {type(value)}"
        )

    if isinstance(value, IntegerTypes):
        if n is None:
            n = max(value.bit_length(), 1)
        ts = int2seq(value, n)
    elif isinstance(value, Sequence):
        ts = list(value)
    elif isinstance(value, Digital):
        if n is None:
            ts = [value]
        elif issubclass(totype, SInt):
            # sext
            ts = n * [value]
        else:
            # zext
            ts = [GND for _ in range(n - 1)] + [value]
    else:
        ts = [value[i] for i in range(len(value))]

    # create list of types
    Ts = []
    for t in ts:
        T = type(t)
        if T in IntegerTypes:
            T = Out(Bit)
        Ts.append(T)

    convert_to_bit = False
    # check that they are all the same
    for t in Ts:
        if checkbit:
            if not isinstance(t, DigitalMeta):
                raise ValueError(
                    "bits can only be used on Arrays or Tuples containing bits"
                    f", not : {t}")
        if t != T:
            if can_convert_to_bit_type(t) and can_convert_to_bit_type(T):
                # If they can all be converted to Bit, then that's okay
                convert_to_bit = True
            else:
                raise ValueError(
                    "All fields in a Array or a Tuple must be the same type"
                    f"got {t} expected {T}")

    assert len(Ts)

    if convert_to_bit is True:
        ts = [bit(t) for t in ts]
        T = {
            Direction.In: In,
            Direction.Out: Out,
            Direction.InOut: InOut
        }[T.direction](Bit)

    return totype[len(Ts), T](*ts)


def array(value, n=None):
    return convertbits(value, n, Array, False)


def bits(value, n=None):
    return convertbits(value, n, Bits, True)


def uint(value, n=None):
    return convertbits(value, n, UInt, True)


def sint(value, n=None):
    return convertbits(value, n, SInt, True)


def bfloat(value, n=None):
    return convertbits(value, n, BFloat, True)


def concat(*arrays):
    ts = []
    for a in arrays:
        if isinstance(a, hwtypes.BitVector):
            ts.extend(a.bits())
        else:
            ts.extend(a.ts)
    return array(ts)


def repeat(value, n):
    if isinstance(value, Bit):
        repeats = bits(n * [value])
    else:
        repeats = array(n * [value])
    return repeats


def check_value_is_not_input(fn):
    @functools.wraps(fn)
    def wrapped(value, n):
        if isinstance(value, Type) and not value.is_output():
            raise Exception(f"{fn.__name__} only works with non input values")
        return fn(value, n)
    return wrapped


# @check_value_is_not_input
def zext(value, n):
    assert isinstance(value, (UInt, SInt, Bits)) or \
        isinstance(value, Array) and issubclass(value.T, Digital)
    if isinstance(value, UInt):
        zeros = uint(0, n)
    elif isinstance(value, SInt):
        zeros = sint(0, n)
    elif isinstance(value, Bits):
        zeros = bits(0, n)
    elif isinstance(value, Array):
        zeros = array(0, n)
    result = concat(value, zeros)
    if isinstance(value, UInt):
        return uint(result)
    elif isinstance(value, SInt):
        return sint(result)
    elif isinstance(value, Bits):
        return bits(result)
    return result


# @check_value_is_not_input
def sext(value, n):
    assert isinstance(value, SInt)
    return sint(concat(array(value), array([value[-1]] * n)))


from .bitutils import int2seq
from .array import Array
from .bit import Digital, Bit, VCC, GND


#
# convert value to a tuple
#   *value = tuple from positional arguments
#   **kwargs = tuple from keyword arguments
#
def _tuple(value, n=None, t=Tuple):
    if isinstance(value, t):
        return value

    if not isinstance(value, (Digital, Array, IntegerTypes, Sequence, Mapping)):
        raise ValueError(
            "bit can only be used on a Bit, an Array, or an int; not {}".format(type(value)))

    decl = OrderedDict()
    args = []

    if isinstance(value, IntegerTypes):
        if n is None:
            n = max(value.bit_length(),1)
        value = int2seq(value, n)
    elif isinstance(value, Digital):
        value = [value]
    elif isinstance(value, Array):
        value = [value[i] for i in range(len(value))]

    if isinstance(value, Sequence):
        ts = list(value)
        for i in range(len(ts)):
            args.append(ts[i])
            decl[i] = type(ts[i])
    elif isinstance(value, Mapping):
        for k, v in value.items():
            args.append(v)
            decl[k] = type(v)
    for a, d in zip(args, decl):
        # bool types to Bit
        if decl[d] is bool:
            decl[d] = Digital
        # Promote integer types to Bits
        elif decl[d] in IntegerTypes:
            decl[d] = Bits[max(a.bit_length(), 1)]

    if t == Tuple:
        return t[tuple(decl.values())](*args)
    assert t == Product
    return t.from_fields("anon", decl)(*args)


def namedtuple(**kwargs):
    return _tuple(kwargs, t=Product)


def product(**kwargs):
    return _tuple(kwargs, t=Product)


def tuple_(value, n=None):
    return _tuple(value, n)


def replace(value, others: dict):
    if isinstance(value, Product):
        d = dict(value.items())
        d.update(others)
        return namedtuple(**d)
    elif isinstance(value, Tuple):
        a = value.values()
        for idx, v in others.items():
            a[int(idx)] = v
        return tuple_(a)
    elif isinstance(value, Array):
        l = value.as_list()
        for idx, v in others.items():
            l[int(idx)] = v
        return array(l)
    else:
        raise ValueError("replace can only be used with an Array, a Tuple, or Product")


def _dispatch(cls, dispatch, *args, **kwargs):
    mro = cls.mro()
    for dispatch_cls in mro:
        fn = dispatch.registry.get(dispatch_cls, None)
        if fn is not None:
            return fn(*args, **kwargs)
    raise NotImplementedError()


@functools.singledispatch
def _as_bits(value):
    """
    Convert value to "flat" representation as an instance of m.Bits

    For example, flatten a multi-dimensional array `m.Array[4,
    m.Bits[5]]` into `m.Bits[20]`.

    This is the inverse of `from_bits`
    """
    raise NotImplementedError()


@_as_bits.register
def _(value: Digital):
    result = Bits[1]()
    result[0] @= value
    return result


@_as_bits.register
def _(value: Array):
    if isinstance(value.T, Digital):
        return Bits[len(value)](value.ts)
    return functools.reduce(lambda x, y: x.concat(y),
                            map(lambda x: as_bits(x), value.ts))


@_as_bits.register
def _(value: Bits):
    return value


@_as_bits.register
def _(value: Tuple):
    return functools.reduce(lambda x, y: x.concat(y),
                            map(lambda x: as_bits(x), value.values()))


def as_bits(value):
    return _dispatch(type(value), _as_bits, value)


@functools.singledispatch
def _from_bits(cls, value):
    """
    Create value from a "flat" representation as an instance of m.Bits.

    For example, pack an `m.Bits[20]` into an `m.Array[4, m.Bits[5]]`.

    This is the inverse of `as_bits`
    """
    raise NotImplementedError()


@_from_bits.register(Digital)
def _(cls, value):
    if not isinstance(value, Bits) and not len(value) == 1:
        raise TypeError("Can only convert from Bits[1] to Bit")
    return value[0]


@_from_bits.register(Bits)
def _(cls, value):
    return value


@_from_bits.register(Array)
def _(cls, value):
    if issubclass(cls.T, Digital):
        if not len(cls) == len(value):
            raise TypeError("Width mismatch")
        return cls(value.ts)
    child_length = cls.T.flat_length()
    children = [
        from_bits(cls.T,
            value[i * child_length:(i + 1) * child_length]
        )
        for i in range(child_length)
    ]
    return cls(children)


@_from_bits.register(Tuple)
def _(cls, value):
    children = []
    offset = 0
    for child in cls.fields:
        child_length = child.flat_length()
        children.append(
            from_bits(child, value[offset:offset + child_length])
        )
        offset += child_length
    return cls(*children)


def from_bits(cls, value):
    return _dispatch(cls, _from_bits, cls, value)
