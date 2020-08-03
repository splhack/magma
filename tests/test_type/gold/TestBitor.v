module corebit_or (
    input in0,
    input in1,
    output out
);
  assign out = in0 | in1;
endmodule

module TestBinary (
    input I0,
    input I1,
    output O
);
wire magma_Bit_or_inst0_in0;
wire magma_Bit_or_inst0_in1;
wire magma_Bit_or_inst0_out;
assign magma_Bit_or_inst0_in0 = I0;
assign magma_Bit_or_inst0_in1 = I1;
corebit_or magma_Bit_or_inst0 (
    .in0(magma_Bit_or_inst0_in0),
    .in1(magma_Bit_or_inst0_in1),
    .out(magma_Bit_or_inst0_out)
);
assign O = magma_Bit_or_inst0_out;
endmodule

