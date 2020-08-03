// Module `Inst` defined externally
module coreir_wrap (
    input in,
    output out
);
  assign out = in;
endmodule

module AsyncResetTest (
    output [3:0] Bit_Arr_out,
    output Bit_out,
    input I,
    input [2:0] I_Arr,
    output O,
    output [1:0] O_Arr,
    output O_Tuple_B,
    output O_Tuple_R,
    input [1:0] T_Arr_in,
    input T_Tuple_in_T,
    input T_in
);
wire Inst_inst0_O;
wire Inst_inst0_I;
wire coreir_wrapInAsyncResetN_inst0_in;
wire coreir_wrapInAsyncResetN_inst0_out;
wire coreir_wrapInAsyncResetN_inst1_in;
wire coreir_wrapInAsyncResetN_inst1_out;
wire coreir_wrapInAsyncResetN_inst2_in;
wire coreir_wrapInAsyncResetN_inst2_out;
wire coreir_wrapInAsyncResetN_inst3_in;
wire coreir_wrapInAsyncResetN_inst3_out;
wire coreir_wrapInAsyncResetN_inst4_in;
wire coreir_wrapInAsyncResetN_inst4_out;
wire coreir_wrapInAsyncResetN_inst5_in;
wire coreir_wrapInAsyncResetN_inst5_out;
wire coreir_wrapOutAsyncResetN_inst0_in;
wire coreir_wrapOutAsyncResetN_inst0_out;
wire coreir_wrapOutAsyncResetN_inst1_in;
wire coreir_wrapOutAsyncResetN_inst1_out;
wire coreir_wrapOutAsyncResetN_inst2_in;
wire coreir_wrapOutAsyncResetN_inst2_out;
wire coreir_wrapOutAsyncResetN_inst3_in;
wire coreir_wrapOutAsyncResetN_inst3_out;
wire coreir_wrapOutAsyncResetN_inst4_in;
wire coreir_wrapOutAsyncResetN_inst4_out;
assign Inst_inst0_I = coreir_wrapOutAsyncResetN_inst0_out;
Inst Inst_inst0 (
    .O(Inst_inst0_O),
    .I(Inst_inst0_I)
);
assign coreir_wrapInAsyncResetN_inst0_in = T_Tuple_in_T;
coreir_wrap coreir_wrapInAsyncResetN_inst0 (
    .in(coreir_wrapInAsyncResetN_inst0_in),
    .out(coreir_wrapInAsyncResetN_inst0_out)
);
assign coreir_wrapInAsyncResetN_inst1_in = T_in;
coreir_wrap coreir_wrapInAsyncResetN_inst1 (
    .in(coreir_wrapInAsyncResetN_inst1_in),
    .out(coreir_wrapInAsyncResetN_inst1_out)
);
assign coreir_wrapInAsyncResetN_inst2_in = T_Arr_in[0];
coreir_wrap coreir_wrapInAsyncResetN_inst2 (
    .in(coreir_wrapInAsyncResetN_inst2_in),
    .out(coreir_wrapInAsyncResetN_inst2_out)
);
assign coreir_wrapInAsyncResetN_inst3_in = T_Arr_in[1];
coreir_wrap coreir_wrapInAsyncResetN_inst3 (
    .in(coreir_wrapInAsyncResetN_inst3_in),
    .out(coreir_wrapInAsyncResetN_inst3_out)
);
assign coreir_wrapInAsyncResetN_inst4_in = T_Arr_in[0];
coreir_wrap coreir_wrapInAsyncResetN_inst4 (
    .in(coreir_wrapInAsyncResetN_inst4_in),
    .out(coreir_wrapInAsyncResetN_inst4_out)
);
assign coreir_wrapInAsyncResetN_inst5_in = Inst_inst0_O;
coreir_wrap coreir_wrapInAsyncResetN_inst5 (
    .in(coreir_wrapInAsyncResetN_inst5_in),
    .out(coreir_wrapInAsyncResetN_inst5_out)
);
assign coreir_wrapOutAsyncResetN_inst0_in = I_Arr[2];
coreir_wrap coreir_wrapOutAsyncResetN_inst0 (
    .in(coreir_wrapOutAsyncResetN_inst0_in),
    .out(coreir_wrapOutAsyncResetN_inst0_out)
);
assign coreir_wrapOutAsyncResetN_inst1_in = I;
coreir_wrap coreir_wrapOutAsyncResetN_inst1 (
    .in(coreir_wrapOutAsyncResetN_inst1_in),
    .out(coreir_wrapOutAsyncResetN_inst1_out)
);
assign coreir_wrapOutAsyncResetN_inst2_in = I_Arr[0];
coreir_wrap coreir_wrapOutAsyncResetN_inst2 (
    .in(coreir_wrapOutAsyncResetN_inst2_in),
    .out(coreir_wrapOutAsyncResetN_inst2_out)
);
assign coreir_wrapOutAsyncResetN_inst3_in = I_Arr[1];
coreir_wrap coreir_wrapOutAsyncResetN_inst3 (
    .in(coreir_wrapOutAsyncResetN_inst3_in),
    .out(coreir_wrapOutAsyncResetN_inst3_out)
);
assign coreir_wrapOutAsyncResetN_inst4_in = I_Arr[2];
coreir_wrap coreir_wrapOutAsyncResetN_inst4 (
    .in(coreir_wrapOutAsyncResetN_inst4_in),
    .out(coreir_wrapOutAsyncResetN_inst4_out)
);
assign Bit_Arr_out = {coreir_wrapInAsyncResetN_inst5_out,coreir_wrapInAsyncResetN_inst4_out,coreir_wrapInAsyncResetN_inst3_out,coreir_wrapInAsyncResetN_inst2_out};
assign Bit_out = coreir_wrapInAsyncResetN_inst1_out;
assign O = coreir_wrapOutAsyncResetN_inst1_out;
assign O_Arr = {coreir_wrapOutAsyncResetN_inst4_out,coreir_wrapOutAsyncResetN_inst3_out};
assign O_Tuple_B = coreir_wrapInAsyncResetN_inst0_out;
assign O_Tuple_R = coreir_wrapOutAsyncResetN_inst2_out;
endmodule

