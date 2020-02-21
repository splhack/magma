module coreir_sle #(
    parameter width = 1
) (
    input [width-1:0] in0,
    input [width-1:0] in1,
    output out
);
  assign out = $signed(in0) <= $signed(in1);
endmodule

module TestBinary (
    input [2:0] I0,
    input [2:0] I1,
    output O
);
wire magma_Bits_3_sle_inst0_out;
coreir_sle #(
    .width(3)
) magma_Bits_3_sle_inst0 (
    .in0(I0),
    .in1(I1),
    .out(magma_Bits_3_sle_inst0_out)
);
assign O = magma_Bits_3_sle_inst0_out;
endmodule

