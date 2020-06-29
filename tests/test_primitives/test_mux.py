import os

import magma as m
from magma.testing import check_files_equal
from magma.primitives import Mux

import fault


def test_basic_mux():
    class test_basic_mux(m.Circuit):
        io = m.IO(I=m.In(m.Bits[2]), S=m.In(m.Bit), O=m.Out(m.Bit))
        io.O @= Mux(2, m.Bit)()(io.I[0], io.I[1], io.S)

    m.compile("build/test_basic_mux", test_basic_mux)

    assert check_files_equal(__file__, f"build/test_basic_mux.v",
                             f"gold/test_basic_mux.v")

    tester = fault.Tester(test_basic_mux)
    tester.circuit.I = 1
    tester.circuit.S = 0
    tester.eval()
    tester.circuit.O.expect(1)
    tester.circuit.S = 1
    tester.eval()
    tester.circuit.O.expect(0)
    tester.compile_and_run("verilator", skip_compile=True,
                           directory=os.path.join(os.path.dirname(__file__),
                                                  "build"))


def test_basic_mux_bits():
    class test_basic_mux_bits(m.Circuit):
        io = m.IO(I=m.In(m.Array[2, m.Bits[2]]), S=m.In(m.Bit), O=m.Out(m.Bits[2]))
        io.O @= Mux(2, m.Bits[2])()(io.I[0], io.I[1], io.S)

    m.compile("build/test_basic_mux_bits", test_basic_mux_bits)

    assert check_files_equal(__file__, f"build/test_basic_mux_bits.v",
                             f"gold/test_basic_mux_bits.v")

    tester = fault.Tester(test_basic_mux_bits)
    tester.circuit.I = [1, 2]
    tester.circuit.S = 0
    tester.eval()
    tester.circuit.O.expect(1)
    tester.circuit.S = 1
    tester.eval()
    tester.circuit.O.expect(2)
    tester.compile_and_run("verilator", skip_compile=True,
                           directory=os.path.join(os.path.dirname(__file__),
                                                  "build"))


def test_basic_mux_arr():
    T = m.Array[2, m.Bits[2]]

    class test_basic_mux_arr(m.Circuit):
        io = m.IO(I=m.In(m.Array[2, T]), S=m.In(m.Bit), O=m.Out(T))
        io.O @= Mux(2, T)()(io.I[0], io.I[1], io.S)

    m.compile("build/test_basic_mux_arr", test_basic_mux_arr)

    assert check_files_equal(__file__, f"build/test_basic_mux_arr.v",
                             f"gold/test_basic_mux_arr.v")

    tester = fault.Tester(test_basic_mux_arr)
    tester.circuit.I = [[0, 1], [2, 3]]
    tester.circuit.S = 0
    tester.eval()
    tester.circuit.O.expect([0, 1])
    tester.circuit.S = 1
    tester.eval()
    tester.circuit.O.expect([2, 3])
    tester.compile_and_run("verilator", skip_compile=True,
                           directory=os.path.join(os.path.dirname(__file__),
                                                  "build"))


def test_basic_mux_tuple():
    T = m.Tuple[m.Bit, m.Bits[2]]

    class test_basic_mux_tuple(m.Circuit):
        io = m.IO(I=m.In(m.Array[2, T]), S=m.In(m.Bit), O=m.Out(T))
        io.O @= Mux(2, T)()(io.I[0], io.I[1], io.S)

    m.compile("build/test_basic_mux_tuple", test_basic_mux_tuple)

    assert check_files_equal(__file__, f"build/test_basic_mux_tuple.v",
                             f"gold/test_basic_mux_tuple.v")

    tester = fault.Tester(test_basic_mux_tuple)
    tester.circuit.I = [(True, 1), (False, 3)]
    tester.circuit.S = 0
    tester.eval()
    tester.circuit.O.expect((True, 1))
    tester.circuit.S = 1
    tester.eval()
    tester.circuit.O.expect((False, 3))
    tester.compile_and_run("verilator", skip_compile=True,
                           directory=os.path.join(os.path.dirname(__file__),
                                                  "build"))


def test_basic_mux_product():
    class T(m.Product):
        X = m.Bits[2]
        Y = m.Bits[4]

    class test_basic_mux_product(m.Circuit):
        io = m.IO(I=m.In(m.Array[2, T]), S=m.In(m.Bit), O=m.Out(T))
        io.O @= Mux(2, T)()(io.I[0], io.I[1], io.S)

    m.compile("build/test_basic_mux_product", test_basic_mux_product)

    assert check_files_equal(__file__, f"build/test_basic_mux_product.v",
                             f"gold/test_basic_mux_product.v")

    tester = fault.Tester(test_basic_mux_product)
    tester.circuit.I = [{"X": 2, "Y": 5}, {"X": 0, "Y": 7}]
    tester.circuit.S = 0
    tester.eval()
    tester.circuit.O.expect({"X": 2, "Y": 5})
    tester.circuit.S = 1
    tester.eval()
    tester.circuit.O.expect({"X": 0, "Y": 7})
    tester.compile_and_run("verilator", skip_compile=True,
                           directory=os.path.join(os.path.dirname(__file__),
                                                  "build"))