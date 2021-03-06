from magma import *

def test_braid():
    And2 = DeclareCircuit('And2', "I0", In(Bit), "I1", In(Bit), "O", Out(Bit))

    lut0 = And2(name='lut0')
    lut1 = And2(name='lut1')

    lut = braid([lut0,lut1])
    assert repr(lut) == 'AnonymousCircuitType("I0", array([lut0.I0, lut1.I0]), "I1", array([lut0.I1, lut1.I1]), "O", array([lut0.O, lut1.O]))'

    lut = braid([lut0,lut1], foldargs={'I1':'O'})
    assert repr(lut) == 'AnonymousCircuitType("I0", array([lut0.I0, lut1.I0]), "I1", lut0.I1, "O", lut1.O)'

    lut = braid([lut0,lut1], scanargs={'I1':'O'})
    assert repr(lut) == 'AnonymousCircuitType("I0", array([lut0.I0, lut1.I0]), "I1", lut0.I1, "O", array([lut0.O, lut1.O]))'


def test_compose():
    Buf = DeclareCircuit('Buf', "I", In(Bit), "O", Out(Bit))

    lut1 = Buf(name='lut1')
    lut2 = Buf(name='lut2')
    lut3 = compose(lut1, lut2)

    assert repr(lut1) == 'lut1 = Buf(name="lut1")'
    assert repr(lut2) == 'lut2 = Buf(name="lut2")'
    assert repr(lut3) == 'AnonymousCircuitType("I", lut2.I, "O", lut1.O)'


