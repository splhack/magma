from magma import *

def test():
    And2 = DeclareCircuit('And2', "I0", In(Bit), "I1", In(Bit), "O", Out(Bit))

    and0 = And2(name='and0')
    and1 = And2(name='and1')

    a = join(and0, and1)
    assert repr(a) == 'AnonymousCircuitType("I0", array([and0.I0, and1.I0]), "I1", array([and0.I1, and1.I1]), "O", array([and0.O, and1.O]))'

test()
