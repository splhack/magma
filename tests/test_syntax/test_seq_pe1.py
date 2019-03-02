import magma as m


class Cond(Enum):
    Z = 0    # EQ
    Z_n = 1  # NE
    C = 2    # UGE
    C_n = 3  # ULT
    N = 4    # <  0
    N_n = 5  # >= 0
    V = 6    # Overflow
    V_n = 7  # No overflow
    EQ = 0
    NE = 1
    UGE = 2
    ULT = 3
    UGT = 8
    ULE = 9
    SGE = 10
    SLT = 11
    SGT = 12
    SLE = 13
    LUT = 14
    ALU = 15


#
# Implement condition code logic
#
# Inputs are the condition code field, the alu result, the lut result,
# and the flags Z, N, C, V
#
def cond(code: Cond, alu: Bit, lut: Bit, Z: Bit, N: Bit, C: Bit,
         V: Bit) -> Bit:
    if code == Cond.Z:
        return Z
    elif code == Cond.Z_n:
        return not Z
    elif code == Cond.C or code == Cond.UGE:
        return C
    elif code == Cond.C_n or code == Cond.ULT:
        return not C
    elif code == Cond.N:
        return N
    elif code == Cond.N_n:
        return not N
    elif code == Cond.V:
        return V
    elif code == Cond.V_n:
        return not V
    elif code == Cond.UGT:
        return C and not Z
    elif code == Cond.ULE:
        return not C or Z
    elif code == Cond.SGE:
        return N == V
    elif code == Cond.SLT:
        return N != V
    elif code == Cond.SGT:
        return not Z and (N == V)
    elif code == Cond.SLE:
        return Z or (N != V)
    elif code == Cond.ALU:
        return alu
    elif code == Cond.LUT:
        return lut
    raise NotImplementedError(code)


Bit = Bits(1)
LUT = Bits(8)


# Implement a 3-bit LUT
def lut(lut: LUT, bit0: Bit, bit1: Bit, bit2: Bit) -> Bit:
    i = (int(bit2) << 2) | (int(bit1) << 1) | int(bit0)
    return Bit(lut & (1 << i))


class Mode(m.Enum):
    CONST = 0   # Register returns constant in constant field
    VALID = 1   # Register written with clock enable, previous value returned
    BYPASS = 2  # Register is bypassed and input value is returned
    DELAY = 3   # Register written with input value, previous value returned


class RegisterMode(Peak):
    def __init__(self, init=0):
        self.register = bits(init)

    def reset(self):
        self.register.reset()

    def __call__(self, mode: Mode, const, value, clk_en: Bit):
        if mode == Mode.CONST:
            return const
        elif mode == Mode.BYPASS:
            return value
        elif mode == Mode.DELAY:
            return self.register(value, True)
        elif mode == Mode.VALID:
            return self.register(value, clk_en)
        else:
            raise NotImplementedError()


@m.circuit.sequential
class PE:
    def __init__(self):
        # Declare PE state

        # Data registers
        self.rega = RegisterMode(Data)
        self.regb = RegisterMode(Data)

        # Bit Registers
        self.regd = RegisterMode(Bit)
        self.rege = RegisterMode(Bit)
        self.regf = RegisterMode(Bit)

    @name_outputs(alu_res=Data, res_p=Bit, irq=Bit)
    def __call__(self, inst: Inst,
                 data0: Data, data1: Data = Data(0),
                 bit0: Bit = Bit(0), bit1: Bit = Bit(0), bit2: Bit = Bit(0),
                 clk_en: Bit = Bit(1)):

        # Simulate one clock cycle

        ra = self.rega(inst.rega, inst.data0, data0, clk_en)
        rb = self.regb(inst.regb, inst.data1, data1, clk_en)

        rd = self.regd(inst.regd, inst.bit0, bit0, clk_en)
        re = self.rege(inst.rege, inst.bit1, bit1, clk_en)
        rf = self.regf(inst.regf, inst.bit2, bit2, clk_en)

        # calculate alu results
        alu_res, alu_res_p, Z, N, C, V = alu(inst.alu, inst.signed, ra, rb, rd)

        # calculate lut results
        lut_res = lut(inst.lut, rd, re, rf)

        # calculate 1-bit result
        res_p = cond(inst.cond, alu_res, lut_res, Z, N, C, V)

        # calculate interrupt request
        irq = Bit(0)  # NYI

        # return 16-bit result, 1-bit result, irq
        return alu_res, res_p, irq
