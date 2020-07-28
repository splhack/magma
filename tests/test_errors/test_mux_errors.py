import pytest

import magma as m


def test_mux_of_ints():
    # We can't infer type of if all inputs are ints
    class Foo(m.Circuit):
        io = m.IO(S=m.In(m.Bit))
        with pytest.raises(TypeError) as e:
            m.mux([1, 2], io.S)
        assert str(e.value) == f"""\
Cannot use m.mux with non-magma types (need at least one to infer type)\
"""


def test_mux_of_mismatch_widths():
    # We can't infer type of if all inputs are ints
    class Foo(m.Circuit):
        io = m.IO(I0=m.In(m.Bits[2]), I1=m.In(m.Bits[3]), S=m.In(m.Bit))
        with pytest.raises(TypeError) as e:
            m.mux([io.I0, io.I1], io.S)
        assert str(e.value) == f"""\
mux arg I[1] (I1: Out(Bits[3])) does not match inferred input port type Out(Bits[2])\
"""