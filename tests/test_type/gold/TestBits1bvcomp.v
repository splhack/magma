module coreir_eq #(
    parameter width = 1
) (
    input [width-1:0] in0,
    input [width-1:0] in1,
    output out
);
  assign out = in0 == in1;
endmodule

module TestBinary (
    input [0:0] I0,
    input [0:0] I1,
    output [0:0] O
);
wire magma_Bits_1_eq_inst0_out;
coreir_eq #(
    .width(1)
) magma_Bits_1_eq_inst0 (
    .in0(I0),
    .in1(I1),
    .out(magma_Bits_1_eq_inst0_out)
);
assign O[0] = magma_Bits_1_eq_inst0_out;
endmodule

