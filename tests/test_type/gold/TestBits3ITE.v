module coreir_mux #(
    parameter width = 1
) (
    input [width-1:0] in0,
    input [width-1:0] in1,
    input sel,
    output [width-1:0] out
);
  assign out = sel ? in1 : in0;
endmodule

module coreir_eq #(
    parameter width = 1
) (
    input [width-1:0] in0,
    input [width-1:0] in1,
    output out
);
  assign out = in0 == in1;
endmodule

module coreir_const #(
    parameter width = 1,
    parameter value = 1
) (
    output [width-1:0] out
);
  assign out = value;
endmodule

module corebit_not (
    input in,
    output out
);
  assign out = ~in;
endmodule

module TestITE (
    input [2:0] I0,
    input [2:0] I1,
    input [2:0] S,
    output [2:0] O
);
wire [2:0] const_0_3_out;
wire magma_Bit_not_inst0_in;
wire magma_Bit_not_inst0_out;
wire [2:0] magma_Bits_3_eq_inst0_in0;
wire [2:0] magma_Bits_3_eq_inst0_in1;
wire magma_Bits_3_eq_inst0_out;
wire [2:0] magma_Bits_3_ite_Out_Bits_3_inst0_in0;
wire [2:0] magma_Bits_3_ite_Out_Bits_3_inst0_in1;
wire magma_Bits_3_ite_Out_Bits_3_inst0_sel;
wire [2:0] magma_Bits_3_ite_Out_Bits_3_inst0_out;
coreir_const #(
    .value(3'h0),
    .width(3)
) const_0_3 (
    .out(const_0_3_out)
);
assign magma_Bit_not_inst0_in = magma_Bits_3_eq_inst0_out;
corebit_not magma_Bit_not_inst0 (
    .in(magma_Bit_not_inst0_in),
    .out(magma_Bit_not_inst0_out)
);
assign magma_Bits_3_eq_inst0_in0 = S;
assign magma_Bits_3_eq_inst0_in1 = const_0_3_out;
coreir_eq #(
    .width(3)
) magma_Bits_3_eq_inst0 (
    .in0(magma_Bits_3_eq_inst0_in0),
    .in1(magma_Bits_3_eq_inst0_in1),
    .out(magma_Bits_3_eq_inst0_out)
);
assign magma_Bits_3_ite_Out_Bits_3_inst0_in0 = I0;
assign magma_Bits_3_ite_Out_Bits_3_inst0_in1 = I1;
assign magma_Bits_3_ite_Out_Bits_3_inst0_sel = magma_Bit_not_inst0_out;
coreir_mux #(
    .width(3)
) magma_Bits_3_ite_Out_Bits_3_inst0 (
    .in0(magma_Bits_3_ite_Out_Bits_3_inst0_in0),
    .in1(magma_Bits_3_ite_Out_Bits_3_inst0_in1),
    .sel(magma_Bits_3_ite_Out_Bits_3_inst0_sel),
    .out(magma_Bits_3_ite_Out_Bits_3_inst0_out)
);
assign O = magma_Bits_3_ite_Out_Bits_3_inst0_out;
endmodule

