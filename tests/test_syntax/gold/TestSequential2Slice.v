module coreir_reg #(
    parameter width = 1,
    parameter clk_posedge = 1,
    parameter init = 1
) (
    input clk,
    input [width-1:0] in,
    output [width-1:0] out
);
  reg [width-1:0] outReg=init;
  wire real_clk;
  assign real_clk = clk_posedge ? clk : ~clk;
  always @(posedge real_clk) begin
    outReg <= in;
  end
  assign out = outReg;
endmodule

module Register (
    input [63:0] I,
    output [63:0] O,
    input CLK
);
coreir_reg #(
    .clk_posedge(1'b1),
    .init(64'h0000000000000000),
    .width(64)
) reg_P_inst0 (
    .clk(CLK),
    .in(I),
    .out(O)
);
endmodule

module Mux56xOutBits8 (
    input [7:0] I0,
    input [7:0] I1,
    input [7:0] I2,
    input [7:0] I3,
    input [7:0] I4,
    input [7:0] I5,
    input [7:0] I6,
    input [7:0] I7,
    input [7:0] I8,
    input [7:0] I9,
    input [7:0] I10,
    input [7:0] I11,
    input [7:0] I12,
    input [7:0] I13,
    input [7:0] I14,
    input [7:0] I15,
    input [7:0] I16,
    input [7:0] I17,
    input [7:0] I18,
    input [7:0] I19,
    input [7:0] I20,
    input [7:0] I21,
    input [7:0] I22,
    input [7:0] I23,
    input [7:0] I24,
    input [7:0] I25,
    input [7:0] I26,
    input [7:0] I27,
    input [7:0] I28,
    input [7:0] I29,
    input [7:0] I30,
    input [7:0] I31,
    input [7:0] I32,
    input [7:0] I33,
    input [7:0] I34,
    input [7:0] I35,
    input [7:0] I36,
    input [7:0] I37,
    input [7:0] I38,
    input [7:0] I39,
    input [7:0] I40,
    input [7:0] I41,
    input [7:0] I42,
    input [7:0] I43,
    input [7:0] I44,
    input [7:0] I45,
    input [7:0] I46,
    input [7:0] I47,
    input [7:0] I48,
    input [7:0] I49,
    input [7:0] I50,
    input [7:0] I51,
    input [7:0] I52,
    input [7:0] I53,
    input [7:0] I54,
    input [7:0] I55,
    input [5:0] S,
    output [7:0] O
);
reg [7:0] coreir_commonlib_mux56x8_inst0_out;
always @(*) begin
if (S == 0) begin
    coreir_commonlib_mux56x8_inst0_out = I0;
end else if (S == 1) begin
    coreir_commonlib_mux56x8_inst0_out = I1;
end else if (S == 2) begin
    coreir_commonlib_mux56x8_inst0_out = I2;
end else if (S == 3) begin
    coreir_commonlib_mux56x8_inst0_out = I3;
end else if (S == 4) begin
    coreir_commonlib_mux56x8_inst0_out = I4;
end else if (S == 5) begin
    coreir_commonlib_mux56x8_inst0_out = I5;
end else if (S == 6) begin
    coreir_commonlib_mux56x8_inst0_out = I6;
end else if (S == 7) begin
    coreir_commonlib_mux56x8_inst0_out = I7;
end else if (S == 8) begin
    coreir_commonlib_mux56x8_inst0_out = I8;
end else if (S == 9) begin
    coreir_commonlib_mux56x8_inst0_out = I9;
end else if (S == 10) begin
    coreir_commonlib_mux56x8_inst0_out = I10;
end else if (S == 11) begin
    coreir_commonlib_mux56x8_inst0_out = I11;
end else if (S == 12) begin
    coreir_commonlib_mux56x8_inst0_out = I12;
end else if (S == 13) begin
    coreir_commonlib_mux56x8_inst0_out = I13;
end else if (S == 14) begin
    coreir_commonlib_mux56x8_inst0_out = I14;
end else if (S == 15) begin
    coreir_commonlib_mux56x8_inst0_out = I15;
end else if (S == 16) begin
    coreir_commonlib_mux56x8_inst0_out = I16;
end else if (S == 17) begin
    coreir_commonlib_mux56x8_inst0_out = I17;
end else if (S == 18) begin
    coreir_commonlib_mux56x8_inst0_out = I18;
end else if (S == 19) begin
    coreir_commonlib_mux56x8_inst0_out = I19;
end else if (S == 20) begin
    coreir_commonlib_mux56x8_inst0_out = I20;
end else if (S == 21) begin
    coreir_commonlib_mux56x8_inst0_out = I21;
end else if (S == 22) begin
    coreir_commonlib_mux56x8_inst0_out = I22;
end else if (S == 23) begin
    coreir_commonlib_mux56x8_inst0_out = I23;
end else if (S == 24) begin
    coreir_commonlib_mux56x8_inst0_out = I24;
end else if (S == 25) begin
    coreir_commonlib_mux56x8_inst0_out = I25;
end else if (S == 26) begin
    coreir_commonlib_mux56x8_inst0_out = I26;
end else if (S == 27) begin
    coreir_commonlib_mux56x8_inst0_out = I27;
end else if (S == 28) begin
    coreir_commonlib_mux56x8_inst0_out = I28;
end else if (S == 29) begin
    coreir_commonlib_mux56x8_inst0_out = I29;
end else if (S == 30) begin
    coreir_commonlib_mux56x8_inst0_out = I30;
end else if (S == 31) begin
    coreir_commonlib_mux56x8_inst0_out = I31;
end else if (S == 32) begin
    coreir_commonlib_mux56x8_inst0_out = I32;
end else if (S == 33) begin
    coreir_commonlib_mux56x8_inst0_out = I33;
end else if (S == 34) begin
    coreir_commonlib_mux56x8_inst0_out = I34;
end else if (S == 35) begin
    coreir_commonlib_mux56x8_inst0_out = I35;
end else if (S == 36) begin
    coreir_commonlib_mux56x8_inst0_out = I36;
end else if (S == 37) begin
    coreir_commonlib_mux56x8_inst0_out = I37;
end else if (S == 38) begin
    coreir_commonlib_mux56x8_inst0_out = I38;
end else if (S == 39) begin
    coreir_commonlib_mux56x8_inst0_out = I39;
end else if (S == 40) begin
    coreir_commonlib_mux56x8_inst0_out = I40;
end else if (S == 41) begin
    coreir_commonlib_mux56x8_inst0_out = I41;
end else if (S == 42) begin
    coreir_commonlib_mux56x8_inst0_out = I42;
end else if (S == 43) begin
    coreir_commonlib_mux56x8_inst0_out = I43;
end else if (S == 44) begin
    coreir_commonlib_mux56x8_inst0_out = I44;
end else if (S == 45) begin
    coreir_commonlib_mux56x8_inst0_out = I45;
end else if (S == 46) begin
    coreir_commonlib_mux56x8_inst0_out = I46;
end else if (S == 47) begin
    coreir_commonlib_mux56x8_inst0_out = I47;
end else if (S == 48) begin
    coreir_commonlib_mux56x8_inst0_out = I48;
end else if (S == 49) begin
    coreir_commonlib_mux56x8_inst0_out = I49;
end else if (S == 50) begin
    coreir_commonlib_mux56x8_inst0_out = I50;
end else if (S == 51) begin
    coreir_commonlib_mux56x8_inst0_out = I51;
end else if (S == 52) begin
    coreir_commonlib_mux56x8_inst0_out = I52;
end else if (S == 53) begin
    coreir_commonlib_mux56x8_inst0_out = I53;
end else if (S == 54) begin
    coreir_commonlib_mux56x8_inst0_out = I54;
end else begin
    coreir_commonlib_mux56x8_inst0_out = I55;
end
end

assign O = coreir_commonlib_mux56x8_inst0_out;
endmodule

module Mux2xOutBit (
    input I0,
    input I1,
    input S,
    output O
);
reg [0:0] coreir_commonlib_mux2x1_inst0_out;
always @(*) begin
if (S == 0) begin
    coreir_commonlib_mux2x1_inst0_out = I0;
end else begin
    coreir_commonlib_mux2x1_inst0_out = I1;
end
end

assign O = coreir_commonlib_mux2x1_inst0_out[0];
endmodule

module TestSequential2Slice (
    input [2:0] write_addr,
    input [7:0] write_data,
    input [2:0] read_addr,
    output [7:0] O,
    input CLK
);
wire Mux2xOutBit_inst0_O;
wire Mux2xOutBit_inst1_O;
wire Mux2xOutBit_inst10_O;
wire Mux2xOutBit_inst11_O;
wire Mux2xOutBit_inst12_O;
wire Mux2xOutBit_inst13_O;
wire Mux2xOutBit_inst14_O;
wire Mux2xOutBit_inst15_O;
wire Mux2xOutBit_inst16_O;
wire Mux2xOutBit_inst17_O;
wire Mux2xOutBit_inst18_O;
wire Mux2xOutBit_inst19_O;
wire Mux2xOutBit_inst2_O;
wire Mux2xOutBit_inst20_O;
wire Mux2xOutBit_inst21_O;
wire Mux2xOutBit_inst22_O;
wire Mux2xOutBit_inst23_O;
wire Mux2xOutBit_inst24_O;
wire Mux2xOutBit_inst25_O;
wire Mux2xOutBit_inst26_O;
wire Mux2xOutBit_inst27_O;
wire Mux2xOutBit_inst28_O;
wire Mux2xOutBit_inst29_O;
wire Mux2xOutBit_inst3_O;
wire Mux2xOutBit_inst30_O;
wire Mux2xOutBit_inst31_O;
wire Mux2xOutBit_inst32_O;
wire Mux2xOutBit_inst33_O;
wire Mux2xOutBit_inst34_O;
wire Mux2xOutBit_inst35_O;
wire Mux2xOutBit_inst36_O;
wire Mux2xOutBit_inst37_O;
wire Mux2xOutBit_inst38_O;
wire Mux2xOutBit_inst39_O;
wire Mux2xOutBit_inst4_O;
wire Mux2xOutBit_inst40_O;
wire Mux2xOutBit_inst41_O;
wire Mux2xOutBit_inst42_O;
wire Mux2xOutBit_inst43_O;
wire Mux2xOutBit_inst44_O;
wire Mux2xOutBit_inst45_O;
wire Mux2xOutBit_inst46_O;
wire Mux2xOutBit_inst47_O;
wire Mux2xOutBit_inst48_O;
wire Mux2xOutBit_inst49_O;
wire Mux2xOutBit_inst5_O;
wire Mux2xOutBit_inst50_O;
wire Mux2xOutBit_inst51_O;
wire Mux2xOutBit_inst52_O;
wire Mux2xOutBit_inst53_O;
wire Mux2xOutBit_inst54_O;
wire Mux2xOutBit_inst55_O;
wire Mux2xOutBit_inst56_O;
wire Mux2xOutBit_inst57_O;
wire Mux2xOutBit_inst58_O;
wire Mux2xOutBit_inst59_O;
wire Mux2xOutBit_inst6_O;
wire Mux2xOutBit_inst60_O;
wire Mux2xOutBit_inst61_O;
wire Mux2xOutBit_inst62_O;
wire Mux2xOutBit_inst63_O;
wire Mux2xOutBit_inst7_O;
wire Mux2xOutBit_inst8_O;
wire Mux2xOutBit_inst9_O;
wire [63:0] Register_inst0_O;
wire [5:0] magma_Bits_6_mul_inst1_out;
wire [5:0] magma_Bits_6_sub_inst0_out;
wire [5:0] magma_Bits_6_sub_inst10_out;
wire [5:0] magma_Bits_6_sub_inst100_out;
wire [5:0] magma_Bits_6_sub_inst102_out;
wire [5:0] magma_Bits_6_sub_inst104_out;
wire [5:0] magma_Bits_6_sub_inst106_out;
wire [5:0] magma_Bits_6_sub_inst108_out;
wire [5:0] magma_Bits_6_sub_inst110_out;
wire [5:0] magma_Bits_6_sub_inst112_out;
wire [5:0] magma_Bits_6_sub_inst114_out;
wire [5:0] magma_Bits_6_sub_inst116_out;
wire [5:0] magma_Bits_6_sub_inst118_out;
wire [5:0] magma_Bits_6_sub_inst12_out;
wire [5:0] magma_Bits_6_sub_inst120_out;
wire [5:0] magma_Bits_6_sub_inst122_out;
wire [5:0] magma_Bits_6_sub_inst124_out;
wire [5:0] magma_Bits_6_sub_inst126_out;
wire [5:0] magma_Bits_6_sub_inst14_out;
wire [5:0] magma_Bits_6_sub_inst16_out;
wire [5:0] magma_Bits_6_sub_inst18_out;
wire [5:0] magma_Bits_6_sub_inst2_out;
wire [5:0] magma_Bits_6_sub_inst20_out;
wire [5:0] magma_Bits_6_sub_inst22_out;
wire [5:0] magma_Bits_6_sub_inst24_out;
wire [5:0] magma_Bits_6_sub_inst26_out;
wire [5:0] magma_Bits_6_sub_inst28_out;
wire [5:0] magma_Bits_6_sub_inst30_out;
wire [5:0] magma_Bits_6_sub_inst32_out;
wire [5:0] magma_Bits_6_sub_inst34_out;
wire [5:0] magma_Bits_6_sub_inst36_out;
wire [5:0] magma_Bits_6_sub_inst38_out;
wire [5:0] magma_Bits_6_sub_inst4_out;
wire [5:0] magma_Bits_6_sub_inst40_out;
wire [5:0] magma_Bits_6_sub_inst42_out;
wire [5:0] magma_Bits_6_sub_inst44_out;
wire [5:0] magma_Bits_6_sub_inst46_out;
wire [5:0] magma_Bits_6_sub_inst48_out;
wire [5:0] magma_Bits_6_sub_inst50_out;
wire [5:0] magma_Bits_6_sub_inst52_out;
wire [5:0] magma_Bits_6_sub_inst54_out;
wire [5:0] magma_Bits_6_sub_inst56_out;
wire [5:0] magma_Bits_6_sub_inst58_out;
wire [5:0] magma_Bits_6_sub_inst6_out;
wire [5:0] magma_Bits_6_sub_inst60_out;
wire [5:0] magma_Bits_6_sub_inst62_out;
wire [5:0] magma_Bits_6_sub_inst64_out;
wire [5:0] magma_Bits_6_sub_inst66_out;
wire [5:0] magma_Bits_6_sub_inst68_out;
wire [5:0] magma_Bits_6_sub_inst70_out;
wire [5:0] magma_Bits_6_sub_inst72_out;
wire [5:0] magma_Bits_6_sub_inst74_out;
wire [5:0] magma_Bits_6_sub_inst76_out;
wire [5:0] magma_Bits_6_sub_inst78_out;
wire [5:0] magma_Bits_6_sub_inst8_out;
wire [5:0] magma_Bits_6_sub_inst80_out;
wire [5:0] magma_Bits_6_sub_inst82_out;
wire [5:0] magma_Bits_6_sub_inst84_out;
wire [5:0] magma_Bits_6_sub_inst86_out;
wire [5:0] magma_Bits_6_sub_inst88_out;
wire [5:0] magma_Bits_6_sub_inst90_out;
wire [5:0] magma_Bits_6_sub_inst92_out;
wire [5:0] magma_Bits_6_sub_inst94_out;
wire [5:0] magma_Bits_6_sub_inst96_out;
wire [5:0] magma_Bits_6_sub_inst98_out;
wire [7:0] magma_Bits_8_lshr_inst0_out;
wire [7:0] magma_Bits_8_lshr_inst1_out;
wire [7:0] magma_Bits_8_lshr_inst10_out;
wire [7:0] magma_Bits_8_lshr_inst11_out;
wire [7:0] magma_Bits_8_lshr_inst12_out;
wire [7:0] magma_Bits_8_lshr_inst13_out;
wire [7:0] magma_Bits_8_lshr_inst14_out;
wire [7:0] magma_Bits_8_lshr_inst15_out;
wire [7:0] magma_Bits_8_lshr_inst16_out;
wire [7:0] magma_Bits_8_lshr_inst17_out;
wire [7:0] magma_Bits_8_lshr_inst18_out;
wire [7:0] magma_Bits_8_lshr_inst19_out;
wire [7:0] magma_Bits_8_lshr_inst2_out;
wire [7:0] magma_Bits_8_lshr_inst20_out;
wire [7:0] magma_Bits_8_lshr_inst21_out;
wire [7:0] magma_Bits_8_lshr_inst22_out;
wire [7:0] magma_Bits_8_lshr_inst23_out;
wire [7:0] magma_Bits_8_lshr_inst24_out;
wire [7:0] magma_Bits_8_lshr_inst25_out;
wire [7:0] magma_Bits_8_lshr_inst26_out;
wire [7:0] magma_Bits_8_lshr_inst27_out;
wire [7:0] magma_Bits_8_lshr_inst28_out;
wire [7:0] magma_Bits_8_lshr_inst29_out;
wire [7:0] magma_Bits_8_lshr_inst3_out;
wire [7:0] magma_Bits_8_lshr_inst30_out;
wire [7:0] magma_Bits_8_lshr_inst31_out;
wire [7:0] magma_Bits_8_lshr_inst32_out;
wire [7:0] magma_Bits_8_lshr_inst33_out;
wire [7:0] magma_Bits_8_lshr_inst34_out;
wire [7:0] magma_Bits_8_lshr_inst35_out;
wire [7:0] magma_Bits_8_lshr_inst36_out;
wire [7:0] magma_Bits_8_lshr_inst37_out;
wire [7:0] magma_Bits_8_lshr_inst38_out;
wire [7:0] magma_Bits_8_lshr_inst39_out;
wire [7:0] magma_Bits_8_lshr_inst4_out;
wire [7:0] magma_Bits_8_lshr_inst40_out;
wire [7:0] magma_Bits_8_lshr_inst41_out;
wire [7:0] magma_Bits_8_lshr_inst42_out;
wire [7:0] magma_Bits_8_lshr_inst43_out;
wire [7:0] magma_Bits_8_lshr_inst44_out;
wire [7:0] magma_Bits_8_lshr_inst45_out;
wire [7:0] magma_Bits_8_lshr_inst46_out;
wire [7:0] magma_Bits_8_lshr_inst47_out;
wire [7:0] magma_Bits_8_lshr_inst48_out;
wire [7:0] magma_Bits_8_lshr_inst49_out;
wire [7:0] magma_Bits_8_lshr_inst5_out;
wire [7:0] magma_Bits_8_lshr_inst50_out;
wire [7:0] magma_Bits_8_lshr_inst51_out;
wire [7:0] magma_Bits_8_lshr_inst52_out;
wire [7:0] magma_Bits_8_lshr_inst53_out;
wire [7:0] magma_Bits_8_lshr_inst54_out;
wire [7:0] magma_Bits_8_lshr_inst55_out;
wire [7:0] magma_Bits_8_lshr_inst56_out;
wire [7:0] magma_Bits_8_lshr_inst57_out;
wire [7:0] magma_Bits_8_lshr_inst58_out;
wire [7:0] magma_Bits_8_lshr_inst59_out;
wire [7:0] magma_Bits_8_lshr_inst6_out;
wire [7:0] magma_Bits_8_lshr_inst60_out;
wire [7:0] magma_Bits_8_lshr_inst61_out;
wire [7:0] magma_Bits_8_lshr_inst62_out;
wire [7:0] magma_Bits_8_lshr_inst63_out;
wire [7:0] magma_Bits_8_lshr_inst7_out;
wire [7:0] magma_Bits_8_lshr_inst8_out;
wire [7:0] magma_Bits_8_lshr_inst9_out;
Mux2xOutBit Mux2xOutBit_inst0 (
    .I0(Register_inst0_O[0]),
    .I1(magma_Bits_8_lshr_inst0_out[0]),
    .S(1'b1 & (magma_Bits_6_mul_inst1_out <= 6'h00)),
    .O(Mux2xOutBit_inst0_O)
);
Mux2xOutBit Mux2xOutBit_inst1 (
    .I0(Register_inst0_O[1]),
    .I1(magma_Bits_8_lshr_inst1_out[0]),
    .S((1'b1 & (magma_Bits_6_mul_inst1_out <= 6'h01)) & ((6'((6'(magma_Bits_6_mul_inst1_out + 6'h08)) - 6'h01)) >= 6'h01)),
    .O(Mux2xOutBit_inst1_O)
);
Mux2xOutBit Mux2xOutBit_inst10 (
    .I0(Register_inst0_O[10]),
    .I1(magma_Bits_8_lshr_inst10_out[0]),
    .S((1'b1 & (magma_Bits_6_mul_inst1_out <= 6'h0a)) & ((6'((6'(magma_Bits_6_mul_inst1_out + 6'h08)) - 6'h01)) >= 6'h0a)),
    .O(Mux2xOutBit_inst10_O)
);
Mux2xOutBit Mux2xOutBit_inst11 (
    .I0(Register_inst0_O[11]),
    .I1(magma_Bits_8_lshr_inst11_out[0]),
    .S((1'b1 & (magma_Bits_6_mul_inst1_out <= 6'h0b)) & ((6'((6'(magma_Bits_6_mul_inst1_out + 6'h08)) - 6'h01)) >= 6'h0b)),
    .O(Mux2xOutBit_inst11_O)
);
Mux2xOutBit Mux2xOutBit_inst12 (
    .I0(Register_inst0_O[12]),
    .I1(magma_Bits_8_lshr_inst12_out[0]),
    .S((1'b1 & (magma_Bits_6_mul_inst1_out <= 6'h0c)) & ((6'((6'(magma_Bits_6_mul_inst1_out + 6'h08)) - 6'h01)) >= 6'h0c)),
    .O(Mux2xOutBit_inst12_O)
);
Mux2xOutBit Mux2xOutBit_inst13 (
    .I0(Register_inst0_O[13]),
    .I1(magma_Bits_8_lshr_inst13_out[0]),
    .S((1'b1 & (magma_Bits_6_mul_inst1_out <= 6'h0d)) & ((6'((6'(magma_Bits_6_mul_inst1_out + 6'h08)) - 6'h01)) >= 6'h0d)),
    .O(Mux2xOutBit_inst13_O)
);
Mux2xOutBit Mux2xOutBit_inst14 (
    .I0(Register_inst0_O[14]),
    .I1(magma_Bits_8_lshr_inst14_out[0]),
    .S((1'b1 & (magma_Bits_6_mul_inst1_out <= 6'h0e)) & ((6'((6'(magma_Bits_6_mul_inst1_out + 6'h08)) - 6'h01)) >= 6'h0e)),
    .O(Mux2xOutBit_inst14_O)
);
Mux2xOutBit Mux2xOutBit_inst15 (
    .I0(Register_inst0_O[15]),
    .I1(magma_Bits_8_lshr_inst15_out[0]),
    .S((1'b1 & (magma_Bits_6_mul_inst1_out <= 6'h0f)) & ((6'((6'(magma_Bits_6_mul_inst1_out + 6'h08)) - 6'h01)) >= 6'h0f)),
    .O(Mux2xOutBit_inst15_O)
);
Mux2xOutBit Mux2xOutBit_inst16 (
    .I0(Register_inst0_O[16]),
    .I1(magma_Bits_8_lshr_inst16_out[0]),
    .S((1'b1 & (magma_Bits_6_mul_inst1_out <= 6'h10)) & ((6'((6'(magma_Bits_6_mul_inst1_out + 6'h08)) - 6'h01)) >= 6'h10)),
    .O(Mux2xOutBit_inst16_O)
);
Mux2xOutBit Mux2xOutBit_inst17 (
    .I0(Register_inst0_O[17]),
    .I1(magma_Bits_8_lshr_inst17_out[0]),
    .S((1'b1 & (magma_Bits_6_mul_inst1_out <= 6'h11)) & ((6'((6'(magma_Bits_6_mul_inst1_out + 6'h08)) - 6'h01)) >= 6'h11)),
    .O(Mux2xOutBit_inst17_O)
);
Mux2xOutBit Mux2xOutBit_inst18 (
    .I0(Register_inst0_O[18]),
    .I1(magma_Bits_8_lshr_inst18_out[0]),
    .S((1'b1 & (magma_Bits_6_mul_inst1_out <= 6'h12)) & ((6'((6'(magma_Bits_6_mul_inst1_out + 6'h08)) - 6'h01)) >= 6'h12)),
    .O(Mux2xOutBit_inst18_O)
);
Mux2xOutBit Mux2xOutBit_inst19 (
    .I0(Register_inst0_O[19]),
    .I1(magma_Bits_8_lshr_inst19_out[0]),
    .S((1'b1 & (magma_Bits_6_mul_inst1_out <= 6'h13)) & ((6'((6'(magma_Bits_6_mul_inst1_out + 6'h08)) - 6'h01)) >= 6'h13)),
    .O(Mux2xOutBit_inst19_O)
);
Mux2xOutBit Mux2xOutBit_inst2 (
    .I0(Register_inst0_O[2]),
    .I1(magma_Bits_8_lshr_inst2_out[0]),
    .S((1'b1 & (magma_Bits_6_mul_inst1_out <= 6'h02)) & ((6'((6'(magma_Bits_6_mul_inst1_out + 6'h08)) - 6'h01)) >= 6'h02)),
    .O(Mux2xOutBit_inst2_O)
);
Mux2xOutBit Mux2xOutBit_inst20 (
    .I0(Register_inst0_O[20]),
    .I1(magma_Bits_8_lshr_inst20_out[0]),
    .S((1'b1 & (magma_Bits_6_mul_inst1_out <= 6'h14)) & ((6'((6'(magma_Bits_6_mul_inst1_out + 6'h08)) - 6'h01)) >= 6'h14)),
    .O(Mux2xOutBit_inst20_O)
);
Mux2xOutBit Mux2xOutBit_inst21 (
    .I0(Register_inst0_O[21]),
    .I1(magma_Bits_8_lshr_inst21_out[0]),
    .S((1'b1 & (magma_Bits_6_mul_inst1_out <= 6'h15)) & ((6'((6'(magma_Bits_6_mul_inst1_out + 6'h08)) - 6'h01)) >= 6'h15)),
    .O(Mux2xOutBit_inst21_O)
);
Mux2xOutBit Mux2xOutBit_inst22 (
    .I0(Register_inst0_O[22]),
    .I1(magma_Bits_8_lshr_inst22_out[0]),
    .S((1'b1 & (magma_Bits_6_mul_inst1_out <= 6'h16)) & ((6'((6'(magma_Bits_6_mul_inst1_out + 6'h08)) - 6'h01)) >= 6'h16)),
    .O(Mux2xOutBit_inst22_O)
);
Mux2xOutBit Mux2xOutBit_inst23 (
    .I0(Register_inst0_O[23]),
    .I1(magma_Bits_8_lshr_inst23_out[0]),
    .S((1'b1 & (magma_Bits_6_mul_inst1_out <= 6'h17)) & ((6'((6'(magma_Bits_6_mul_inst1_out + 6'h08)) - 6'h01)) >= 6'h17)),
    .O(Mux2xOutBit_inst23_O)
);
Mux2xOutBit Mux2xOutBit_inst24 (
    .I0(Register_inst0_O[24]),
    .I1(magma_Bits_8_lshr_inst24_out[0]),
    .S((1'b1 & (magma_Bits_6_mul_inst1_out <= 6'h18)) & ((6'((6'(magma_Bits_6_mul_inst1_out + 6'h08)) - 6'h01)) >= 6'h18)),
    .O(Mux2xOutBit_inst24_O)
);
Mux2xOutBit Mux2xOutBit_inst25 (
    .I0(Register_inst0_O[25]),
    .I1(magma_Bits_8_lshr_inst25_out[0]),
    .S((1'b1 & (magma_Bits_6_mul_inst1_out <= 6'h19)) & ((6'((6'(magma_Bits_6_mul_inst1_out + 6'h08)) - 6'h01)) >= 6'h19)),
    .O(Mux2xOutBit_inst25_O)
);
Mux2xOutBit Mux2xOutBit_inst26 (
    .I0(Register_inst0_O[26]),
    .I1(magma_Bits_8_lshr_inst26_out[0]),
    .S((1'b1 & (magma_Bits_6_mul_inst1_out <= 6'h1a)) & ((6'((6'(magma_Bits_6_mul_inst1_out + 6'h08)) - 6'h01)) >= 6'h1a)),
    .O(Mux2xOutBit_inst26_O)
);
Mux2xOutBit Mux2xOutBit_inst27 (
    .I0(Register_inst0_O[27]),
    .I1(magma_Bits_8_lshr_inst27_out[0]),
    .S((1'b1 & (magma_Bits_6_mul_inst1_out <= 6'h1b)) & ((6'((6'(magma_Bits_6_mul_inst1_out + 6'h08)) - 6'h01)) >= 6'h1b)),
    .O(Mux2xOutBit_inst27_O)
);
Mux2xOutBit Mux2xOutBit_inst28 (
    .I0(Register_inst0_O[28]),
    .I1(magma_Bits_8_lshr_inst28_out[0]),
    .S((1'b1 & (magma_Bits_6_mul_inst1_out <= 6'h1c)) & ((6'((6'(magma_Bits_6_mul_inst1_out + 6'h08)) - 6'h01)) >= 6'h1c)),
    .O(Mux2xOutBit_inst28_O)
);
Mux2xOutBit Mux2xOutBit_inst29 (
    .I0(Register_inst0_O[29]),
    .I1(magma_Bits_8_lshr_inst29_out[0]),
    .S((1'b1 & (magma_Bits_6_mul_inst1_out <= 6'h1d)) & ((6'((6'(magma_Bits_6_mul_inst1_out + 6'h08)) - 6'h01)) >= 6'h1d)),
    .O(Mux2xOutBit_inst29_O)
);
Mux2xOutBit Mux2xOutBit_inst3 (
    .I0(Register_inst0_O[3]),
    .I1(magma_Bits_8_lshr_inst3_out[0]),
    .S((1'b1 & (magma_Bits_6_mul_inst1_out <= 6'h03)) & ((6'((6'(magma_Bits_6_mul_inst1_out + 6'h08)) - 6'h01)) >= 6'h03)),
    .O(Mux2xOutBit_inst3_O)
);
Mux2xOutBit Mux2xOutBit_inst30 (
    .I0(Register_inst0_O[30]),
    .I1(magma_Bits_8_lshr_inst30_out[0]),
    .S((1'b1 & (magma_Bits_6_mul_inst1_out <= 6'h1e)) & ((6'((6'(magma_Bits_6_mul_inst1_out + 6'h08)) - 6'h01)) >= 6'h1e)),
    .O(Mux2xOutBit_inst30_O)
);
Mux2xOutBit Mux2xOutBit_inst31 (
    .I0(Register_inst0_O[31]),
    .I1(magma_Bits_8_lshr_inst31_out[0]),
    .S((1'b1 & (magma_Bits_6_mul_inst1_out <= 6'h1f)) & ((6'((6'(magma_Bits_6_mul_inst1_out + 6'h08)) - 6'h01)) >= 6'h1f)),
    .O(Mux2xOutBit_inst31_O)
);
Mux2xOutBit Mux2xOutBit_inst32 (
    .I0(Register_inst0_O[32]),
    .I1(magma_Bits_8_lshr_inst32_out[0]),
    .S((1'b1 & (magma_Bits_6_mul_inst1_out <= 6'h20)) & ((6'((6'(magma_Bits_6_mul_inst1_out + 6'h08)) - 6'h01)) >= 6'h20)),
    .O(Mux2xOutBit_inst32_O)
);
Mux2xOutBit Mux2xOutBit_inst33 (
    .I0(Register_inst0_O[33]),
    .I1(magma_Bits_8_lshr_inst33_out[0]),
    .S((1'b1 & (magma_Bits_6_mul_inst1_out <= 6'h21)) & ((6'((6'(magma_Bits_6_mul_inst1_out + 6'h08)) - 6'h01)) >= 6'h21)),
    .O(Mux2xOutBit_inst33_O)
);
Mux2xOutBit Mux2xOutBit_inst34 (
    .I0(Register_inst0_O[34]),
    .I1(magma_Bits_8_lshr_inst34_out[0]),
    .S((1'b1 & (magma_Bits_6_mul_inst1_out <= 6'h22)) & ((6'((6'(magma_Bits_6_mul_inst1_out + 6'h08)) - 6'h01)) >= 6'h22)),
    .O(Mux2xOutBit_inst34_O)
);
Mux2xOutBit Mux2xOutBit_inst35 (
    .I0(Register_inst0_O[35]),
    .I1(magma_Bits_8_lshr_inst35_out[0]),
    .S((1'b1 & (magma_Bits_6_mul_inst1_out <= 6'h23)) & ((6'((6'(magma_Bits_6_mul_inst1_out + 6'h08)) - 6'h01)) >= 6'h23)),
    .O(Mux2xOutBit_inst35_O)
);
Mux2xOutBit Mux2xOutBit_inst36 (
    .I0(Register_inst0_O[36]),
    .I1(magma_Bits_8_lshr_inst36_out[0]),
    .S((1'b1 & (magma_Bits_6_mul_inst1_out <= 6'h24)) & ((6'((6'(magma_Bits_6_mul_inst1_out + 6'h08)) - 6'h01)) >= 6'h24)),
    .O(Mux2xOutBit_inst36_O)
);
Mux2xOutBit Mux2xOutBit_inst37 (
    .I0(Register_inst0_O[37]),
    .I1(magma_Bits_8_lshr_inst37_out[0]),
    .S((1'b1 & (magma_Bits_6_mul_inst1_out <= 6'h25)) & ((6'((6'(magma_Bits_6_mul_inst1_out + 6'h08)) - 6'h01)) >= 6'h25)),
    .O(Mux2xOutBit_inst37_O)
);
Mux2xOutBit Mux2xOutBit_inst38 (
    .I0(Register_inst0_O[38]),
    .I1(magma_Bits_8_lshr_inst38_out[0]),
    .S((1'b1 & (magma_Bits_6_mul_inst1_out <= 6'h26)) & ((6'((6'(magma_Bits_6_mul_inst1_out + 6'h08)) - 6'h01)) >= 6'h26)),
    .O(Mux2xOutBit_inst38_O)
);
Mux2xOutBit Mux2xOutBit_inst39 (
    .I0(Register_inst0_O[39]),
    .I1(magma_Bits_8_lshr_inst39_out[0]),
    .S((1'b1 & (magma_Bits_6_mul_inst1_out <= 6'h27)) & ((6'((6'(magma_Bits_6_mul_inst1_out + 6'h08)) - 6'h01)) >= 6'h27)),
    .O(Mux2xOutBit_inst39_O)
);
Mux2xOutBit Mux2xOutBit_inst4 (
    .I0(Register_inst0_O[4]),
    .I1(magma_Bits_8_lshr_inst4_out[0]),
    .S((1'b1 & (magma_Bits_6_mul_inst1_out <= 6'h04)) & ((6'((6'(magma_Bits_6_mul_inst1_out + 6'h08)) - 6'h01)) >= 6'h04)),
    .O(Mux2xOutBit_inst4_O)
);
Mux2xOutBit Mux2xOutBit_inst40 (
    .I0(Register_inst0_O[40]),
    .I1(magma_Bits_8_lshr_inst40_out[0]),
    .S((1'b1 & (magma_Bits_6_mul_inst1_out <= 6'h28)) & ((6'((6'(magma_Bits_6_mul_inst1_out + 6'h08)) - 6'h01)) >= 6'h28)),
    .O(Mux2xOutBit_inst40_O)
);
Mux2xOutBit Mux2xOutBit_inst41 (
    .I0(Register_inst0_O[41]),
    .I1(magma_Bits_8_lshr_inst41_out[0]),
    .S((1'b1 & (magma_Bits_6_mul_inst1_out <= 6'h29)) & ((6'((6'(magma_Bits_6_mul_inst1_out + 6'h08)) - 6'h01)) >= 6'h29)),
    .O(Mux2xOutBit_inst41_O)
);
Mux2xOutBit Mux2xOutBit_inst42 (
    .I0(Register_inst0_O[42]),
    .I1(magma_Bits_8_lshr_inst42_out[0]),
    .S((1'b1 & (magma_Bits_6_mul_inst1_out <= 6'h2a)) & ((6'((6'(magma_Bits_6_mul_inst1_out + 6'h08)) - 6'h01)) >= 6'h2a)),
    .O(Mux2xOutBit_inst42_O)
);
Mux2xOutBit Mux2xOutBit_inst43 (
    .I0(Register_inst0_O[43]),
    .I1(magma_Bits_8_lshr_inst43_out[0]),
    .S((1'b1 & (magma_Bits_6_mul_inst1_out <= 6'h2b)) & ((6'((6'(magma_Bits_6_mul_inst1_out + 6'h08)) - 6'h01)) >= 6'h2b)),
    .O(Mux2xOutBit_inst43_O)
);
Mux2xOutBit Mux2xOutBit_inst44 (
    .I0(Register_inst0_O[44]),
    .I1(magma_Bits_8_lshr_inst44_out[0]),
    .S((1'b1 & (magma_Bits_6_mul_inst1_out <= 6'h2c)) & ((6'((6'(magma_Bits_6_mul_inst1_out + 6'h08)) - 6'h01)) >= 6'h2c)),
    .O(Mux2xOutBit_inst44_O)
);
Mux2xOutBit Mux2xOutBit_inst45 (
    .I0(Register_inst0_O[45]),
    .I1(magma_Bits_8_lshr_inst45_out[0]),
    .S((1'b1 & (magma_Bits_6_mul_inst1_out <= 6'h2d)) & ((6'((6'(magma_Bits_6_mul_inst1_out + 6'h08)) - 6'h01)) >= 6'h2d)),
    .O(Mux2xOutBit_inst45_O)
);
Mux2xOutBit Mux2xOutBit_inst46 (
    .I0(Register_inst0_O[46]),
    .I1(magma_Bits_8_lshr_inst46_out[0]),
    .S((1'b1 & (magma_Bits_6_mul_inst1_out <= 6'h2e)) & ((6'((6'(magma_Bits_6_mul_inst1_out + 6'h08)) - 6'h01)) >= 6'h2e)),
    .O(Mux2xOutBit_inst46_O)
);
Mux2xOutBit Mux2xOutBit_inst47 (
    .I0(Register_inst0_O[47]),
    .I1(magma_Bits_8_lshr_inst47_out[0]),
    .S((1'b1 & (magma_Bits_6_mul_inst1_out <= 6'h2f)) & ((6'((6'(magma_Bits_6_mul_inst1_out + 6'h08)) - 6'h01)) >= 6'h2f)),
    .O(Mux2xOutBit_inst47_O)
);
Mux2xOutBit Mux2xOutBit_inst48 (
    .I0(Register_inst0_O[48]),
    .I1(magma_Bits_8_lshr_inst48_out[0]),
    .S((1'b1 & (magma_Bits_6_mul_inst1_out <= 6'h30)) & ((6'((6'(magma_Bits_6_mul_inst1_out + 6'h08)) - 6'h01)) >= 6'h30)),
    .O(Mux2xOutBit_inst48_O)
);
Mux2xOutBit Mux2xOutBit_inst49 (
    .I0(Register_inst0_O[49]),
    .I1(magma_Bits_8_lshr_inst49_out[0]),
    .S((1'b1 & (magma_Bits_6_mul_inst1_out <= 6'h31)) & ((6'((6'(magma_Bits_6_mul_inst1_out + 6'h08)) - 6'h01)) >= 6'h31)),
    .O(Mux2xOutBit_inst49_O)
);
Mux2xOutBit Mux2xOutBit_inst5 (
    .I0(Register_inst0_O[5]),
    .I1(magma_Bits_8_lshr_inst5_out[0]),
    .S((1'b1 & (magma_Bits_6_mul_inst1_out <= 6'h05)) & ((6'((6'(magma_Bits_6_mul_inst1_out + 6'h08)) - 6'h01)) >= 6'h05)),
    .O(Mux2xOutBit_inst5_O)
);
Mux2xOutBit Mux2xOutBit_inst50 (
    .I0(Register_inst0_O[50]),
    .I1(magma_Bits_8_lshr_inst50_out[0]),
    .S((1'b1 & (magma_Bits_6_mul_inst1_out <= 6'h32)) & ((6'((6'(magma_Bits_6_mul_inst1_out + 6'h08)) - 6'h01)) >= 6'h32)),
    .O(Mux2xOutBit_inst50_O)
);
Mux2xOutBit Mux2xOutBit_inst51 (
    .I0(Register_inst0_O[51]),
    .I1(magma_Bits_8_lshr_inst51_out[0]),
    .S((1'b1 & (magma_Bits_6_mul_inst1_out <= 6'h33)) & ((6'((6'(magma_Bits_6_mul_inst1_out + 6'h08)) - 6'h01)) >= 6'h33)),
    .O(Mux2xOutBit_inst51_O)
);
Mux2xOutBit Mux2xOutBit_inst52 (
    .I0(Register_inst0_O[52]),
    .I1(magma_Bits_8_lshr_inst52_out[0]),
    .S((1'b1 & (magma_Bits_6_mul_inst1_out <= 6'h34)) & ((6'((6'(magma_Bits_6_mul_inst1_out + 6'h08)) - 6'h01)) >= 6'h34)),
    .O(Mux2xOutBit_inst52_O)
);
Mux2xOutBit Mux2xOutBit_inst53 (
    .I0(Register_inst0_O[53]),
    .I1(magma_Bits_8_lshr_inst53_out[0]),
    .S((1'b1 & (magma_Bits_6_mul_inst1_out <= 6'h35)) & ((6'((6'(magma_Bits_6_mul_inst1_out + 6'h08)) - 6'h01)) >= 6'h35)),
    .O(Mux2xOutBit_inst53_O)
);
Mux2xOutBit Mux2xOutBit_inst54 (
    .I0(Register_inst0_O[54]),
    .I1(magma_Bits_8_lshr_inst54_out[0]),
    .S((1'b1 & (magma_Bits_6_mul_inst1_out <= 6'h36)) & ((6'((6'(magma_Bits_6_mul_inst1_out + 6'h08)) - 6'h01)) >= 6'h36)),
    .O(Mux2xOutBit_inst54_O)
);
Mux2xOutBit Mux2xOutBit_inst55 (
    .I0(Register_inst0_O[55]),
    .I1(magma_Bits_8_lshr_inst55_out[0]),
    .S((1'b1 & (magma_Bits_6_mul_inst1_out <= 6'h37)) & ((6'((6'(magma_Bits_6_mul_inst1_out + 6'h08)) - 6'h01)) >= 6'h37)),
    .O(Mux2xOutBit_inst55_O)
);
Mux2xOutBit Mux2xOutBit_inst56 (
    .I0(Register_inst0_O[56]),
    .I1(magma_Bits_8_lshr_inst56_out[0]),
    .S((1'b1 & (magma_Bits_6_mul_inst1_out <= 6'h38)) & ((6'((6'(magma_Bits_6_mul_inst1_out + 6'h08)) - 6'h01)) >= 6'h38)),
    .O(Mux2xOutBit_inst56_O)
);
Mux2xOutBit Mux2xOutBit_inst57 (
    .I0(Register_inst0_O[57]),
    .I1(magma_Bits_8_lshr_inst57_out[0]),
    .S((1'b1 & (magma_Bits_6_mul_inst1_out <= 6'h39)) & ((6'((6'(magma_Bits_6_mul_inst1_out + 6'h08)) - 6'h01)) >= 6'h39)),
    .O(Mux2xOutBit_inst57_O)
);
Mux2xOutBit Mux2xOutBit_inst58 (
    .I0(Register_inst0_O[58]),
    .I1(magma_Bits_8_lshr_inst58_out[0]),
    .S((1'b1 & (magma_Bits_6_mul_inst1_out <= 6'h3a)) & ((6'((6'(magma_Bits_6_mul_inst1_out + 6'h08)) - 6'h01)) >= 6'h3a)),
    .O(Mux2xOutBit_inst58_O)
);
Mux2xOutBit Mux2xOutBit_inst59 (
    .I0(Register_inst0_O[59]),
    .I1(magma_Bits_8_lshr_inst59_out[0]),
    .S((1'b1 & (magma_Bits_6_mul_inst1_out <= 6'h3b)) & ((6'((6'(magma_Bits_6_mul_inst1_out + 6'h08)) - 6'h01)) >= 6'h3b)),
    .O(Mux2xOutBit_inst59_O)
);
Mux2xOutBit Mux2xOutBit_inst6 (
    .I0(Register_inst0_O[6]),
    .I1(magma_Bits_8_lshr_inst6_out[0]),
    .S((1'b1 & (magma_Bits_6_mul_inst1_out <= 6'h06)) & ((6'((6'(magma_Bits_6_mul_inst1_out + 6'h08)) - 6'h01)) >= 6'h06)),
    .O(Mux2xOutBit_inst6_O)
);
Mux2xOutBit Mux2xOutBit_inst60 (
    .I0(Register_inst0_O[60]),
    .I1(magma_Bits_8_lshr_inst60_out[0]),
    .S((1'b1 & (magma_Bits_6_mul_inst1_out <= 6'h3c)) & ((6'((6'(magma_Bits_6_mul_inst1_out + 6'h08)) - 6'h01)) >= 6'h3c)),
    .O(Mux2xOutBit_inst60_O)
);
Mux2xOutBit Mux2xOutBit_inst61 (
    .I0(Register_inst0_O[61]),
    .I1(magma_Bits_8_lshr_inst61_out[0]),
    .S((1'b1 & (magma_Bits_6_mul_inst1_out <= 6'h3d)) & ((6'((6'(magma_Bits_6_mul_inst1_out + 6'h08)) - 6'h01)) >= 6'h3d)),
    .O(Mux2xOutBit_inst61_O)
);
Mux2xOutBit Mux2xOutBit_inst62 (
    .I0(Register_inst0_O[62]),
    .I1(magma_Bits_8_lshr_inst62_out[0]),
    .S((1'b1 & (magma_Bits_6_mul_inst1_out <= 6'h3e)) & ((6'((6'(magma_Bits_6_mul_inst1_out + 6'h08)) - 6'h01)) >= 6'h3e)),
    .O(Mux2xOutBit_inst62_O)
);
Mux2xOutBit Mux2xOutBit_inst63 (
    .I0(Register_inst0_O[63]),
    .I1(magma_Bits_8_lshr_inst63_out[0]),
    .S(1'b1 & ((6'((6'(magma_Bits_6_mul_inst1_out + 6'h08)) - 6'h01)) >= 6'h3f)),
    .O(Mux2xOutBit_inst63_O)
);
Mux2xOutBit Mux2xOutBit_inst7 (
    .I0(Register_inst0_O[7]),
    .I1(magma_Bits_8_lshr_inst7_out[0]),
    .S((1'b1 & (magma_Bits_6_mul_inst1_out <= 6'h07)) & ((6'((6'(magma_Bits_6_mul_inst1_out + 6'h08)) - 6'h01)) >= 6'h07)),
    .O(Mux2xOutBit_inst7_O)
);
Mux2xOutBit Mux2xOutBit_inst8 (
    .I0(Register_inst0_O[8]),
    .I1(magma_Bits_8_lshr_inst8_out[0]),
    .S((1'b1 & (magma_Bits_6_mul_inst1_out <= 6'h08)) & ((6'((6'(magma_Bits_6_mul_inst1_out + 6'h08)) - 6'h01)) >= 6'h08)),
    .O(Mux2xOutBit_inst8_O)
);
Mux2xOutBit Mux2xOutBit_inst9 (
    .I0(Register_inst0_O[9]),
    .I1(magma_Bits_8_lshr_inst9_out[0]),
    .S((1'b1 & (magma_Bits_6_mul_inst1_out <= 6'h09)) & ((6'((6'(magma_Bits_6_mul_inst1_out + 6'h08)) - 6'h01)) >= 6'h09)),
    .O(Mux2xOutBit_inst9_O)
);
Mux56xOutBits8 Mux56xOutBits8_inst0 (
    .I0(Register_inst0_O[7:0]),
    .I1(Register_inst0_O[8:1]),
    .I2(Register_inst0_O[9:2]),
    .I3(Register_inst0_O[10:3]),
    .I4(Register_inst0_O[11:4]),
    .I5(Register_inst0_O[12:5]),
    .I6(Register_inst0_O[13:6]),
    .I7(Register_inst0_O[14:7]),
    .I8(Register_inst0_O[15:8]),
    .I9(Register_inst0_O[16:9]),
    .I10(Register_inst0_O[17:10]),
    .I11(Register_inst0_O[18:11]),
    .I12(Register_inst0_O[19:12]),
    .I13(Register_inst0_O[20:13]),
    .I14(Register_inst0_O[21:14]),
    .I15(Register_inst0_O[22:15]),
    .I16(Register_inst0_O[23:16]),
    .I17(Register_inst0_O[24:17]),
    .I18(Register_inst0_O[25:18]),
    .I19(Register_inst0_O[26:19]),
    .I20(Register_inst0_O[27:20]),
    .I21(Register_inst0_O[28:21]),
    .I22(Register_inst0_O[29:22]),
    .I23(Register_inst0_O[30:23]),
    .I24(Register_inst0_O[31:24]),
    .I25(Register_inst0_O[32:25]),
    .I26(Register_inst0_O[33:26]),
    .I27(Register_inst0_O[34:27]),
    .I28(Register_inst0_O[35:28]),
    .I29(Register_inst0_O[36:29]),
    .I30(Register_inst0_O[37:30]),
    .I31(Register_inst0_O[38:31]),
    .I32(Register_inst0_O[39:32]),
    .I33(Register_inst0_O[40:33]),
    .I34(Register_inst0_O[41:34]),
    .I35(Register_inst0_O[42:35]),
    .I36(Register_inst0_O[43:36]),
    .I37(Register_inst0_O[44:37]),
    .I38(Register_inst0_O[45:38]),
    .I39(Register_inst0_O[46:39]),
    .I40(Register_inst0_O[47:40]),
    .I41(Register_inst0_O[48:41]),
    .I42(Register_inst0_O[49:42]),
    .I43(Register_inst0_O[50:43]),
    .I44(Register_inst0_O[51:44]),
    .I45(Register_inst0_O[52:45]),
    .I46(Register_inst0_O[53:46]),
    .I47(Register_inst0_O[54:47]),
    .I48(Register_inst0_O[55:48]),
    .I49(Register_inst0_O[56:49]),
    .I50(Register_inst0_O[57:50]),
    .I51(Register_inst0_O[58:51]),
    .I52(Register_inst0_O[59:52]),
    .I53(Register_inst0_O[60:53]),
    .I54(Register_inst0_O[61:54]),
    .I55(Register_inst0_O[62:55]),
    .S(6'(({1'b0,1'b0,1'b0,read_addr[2:0]}) * 6'h08)),
    .O(O)
);
Register Register_inst0 (
    .I({Mux2xOutBit_inst63_O,Mux2xOutBit_inst62_O,Mux2xOutBit_inst61_O,Mux2xOutBit_inst60_O,Mux2xOutBit_inst59_O,Mux2xOutBit_inst58_O,Mux2xOutBit_inst57_O,Mux2xOutBit_inst56_O,Mux2xOutBit_inst55_O,Mux2xOutBit_inst54_O,Mux2xOutBit_inst53_O,Mux2xOutBit_inst52_O,Mux2xOutBit_inst51_O,Mux2xOutBit_inst50_O,Mux2xOutBit_inst49_O,Mux2xOutBit_inst48_O,Mux2xOutBit_inst47_O,Mux2xOutBit_inst46_O,Mux2xOutBit_inst45_O,Mux2xOutBit_inst44_O,Mux2xOutBit_inst43_O,Mux2xOutBit_inst42_O,Mux2xOutBit_inst41_O,Mux2xOutBit_inst40_O,Mux2xOutBit_inst39_O,Mux2xOutBit_inst38_O,Mux2xOutBit_inst37_O,Mux2xOutBit_inst36_O,Mux2xOutBit_inst35_O,Mux2xOutBit_inst34_O,Mux2xOutBit_inst33_O,Mux2xOutBit_inst32_O,Mux2xOutBit_inst31_O,Mux2xOutBit_inst30_O,Mux2xOutBit_inst29_O,Mux2xOutBit_inst28_O,Mux2xOutBit_inst27_O,Mux2xOutBit_inst26_O,Mux2xOutBit_inst25_O,Mux2xOutBit_inst24_O,Mux2xOutBit_inst23_O,Mux2xOutBit_inst22_O,Mux2xOutBit_inst21_O,Mux2xOutBit_inst20_O,Mux2xOutBit_inst19_O,Mux2xOutBit_inst18_O,Mux2xOutBit_inst17_O,Mux2xOutBit_inst16_O,Mux2xOutBit_inst15_O,Mux2xOutBit_inst14_O,Mux2xOutBit_inst13_O,Mux2xOutBit_inst12_O,Mux2xOutBit_inst11_O,Mux2xOutBit_inst10_O,Mux2xOutBit_inst9_O,Mux2xOutBit_inst8_O,Mux2xOutBit_inst7_O,Mux2xOutBit_inst6_O,Mux2xOutBit_inst5_O,Mux2xOutBit_inst4_O,Mux2xOutBit_inst3_O,Mux2xOutBit_inst2_O,Mux2xOutBit_inst1_O,Mux2xOutBit_inst0_O}),
    .O(Register_inst0_O),
    .CLK(CLK)
);
assign magma_Bits_6_mul_inst1_out = 6'(({1'b0,1'b0,1'b0,write_addr[2:0]}) * 6'h08);
assign magma_Bits_6_sub_inst0_out = 6'(6'h00 - magma_Bits_6_mul_inst1_out);
assign magma_Bits_6_sub_inst10_out = 6'(6'h05 - magma_Bits_6_mul_inst1_out);
assign magma_Bits_6_sub_inst100_out = 6'(6'h32 - magma_Bits_6_mul_inst1_out);
assign magma_Bits_6_sub_inst102_out = 6'(6'h33 - magma_Bits_6_mul_inst1_out);
assign magma_Bits_6_sub_inst104_out = 6'(6'h34 - magma_Bits_6_mul_inst1_out);
assign magma_Bits_6_sub_inst106_out = 6'(6'h35 - magma_Bits_6_mul_inst1_out);
assign magma_Bits_6_sub_inst108_out = 6'(6'h36 - magma_Bits_6_mul_inst1_out);
assign magma_Bits_6_sub_inst110_out = 6'(6'h37 - magma_Bits_6_mul_inst1_out);
assign magma_Bits_6_sub_inst112_out = 6'(6'h38 - magma_Bits_6_mul_inst1_out);
assign magma_Bits_6_sub_inst114_out = 6'(6'h39 - magma_Bits_6_mul_inst1_out);
assign magma_Bits_6_sub_inst116_out = 6'(6'h3a - magma_Bits_6_mul_inst1_out);
assign magma_Bits_6_sub_inst118_out = 6'(6'h3b - magma_Bits_6_mul_inst1_out);
assign magma_Bits_6_sub_inst12_out = 6'(6'h06 - magma_Bits_6_mul_inst1_out);
assign magma_Bits_6_sub_inst120_out = 6'(6'h3c - magma_Bits_6_mul_inst1_out);
assign magma_Bits_6_sub_inst122_out = 6'(6'h3d - magma_Bits_6_mul_inst1_out);
assign magma_Bits_6_sub_inst124_out = 6'(6'h3e - magma_Bits_6_mul_inst1_out);
assign magma_Bits_6_sub_inst126_out = 6'(6'h3f - magma_Bits_6_mul_inst1_out);
assign magma_Bits_6_sub_inst14_out = 6'(6'h07 - magma_Bits_6_mul_inst1_out);
assign magma_Bits_6_sub_inst16_out = 6'(6'h08 - magma_Bits_6_mul_inst1_out);
assign magma_Bits_6_sub_inst18_out = 6'(6'h09 - magma_Bits_6_mul_inst1_out);
assign magma_Bits_6_sub_inst2_out = 6'(6'h01 - magma_Bits_6_mul_inst1_out);
assign magma_Bits_6_sub_inst20_out = 6'(6'h0a - magma_Bits_6_mul_inst1_out);
assign magma_Bits_6_sub_inst22_out = 6'(6'h0b - magma_Bits_6_mul_inst1_out);
assign magma_Bits_6_sub_inst24_out = 6'(6'h0c - magma_Bits_6_mul_inst1_out);
assign magma_Bits_6_sub_inst26_out = 6'(6'h0d - magma_Bits_6_mul_inst1_out);
assign magma_Bits_6_sub_inst28_out = 6'(6'h0e - magma_Bits_6_mul_inst1_out);
assign magma_Bits_6_sub_inst30_out = 6'(6'h0f - magma_Bits_6_mul_inst1_out);
assign magma_Bits_6_sub_inst32_out = 6'(6'h10 - magma_Bits_6_mul_inst1_out);
assign magma_Bits_6_sub_inst34_out = 6'(6'h11 - magma_Bits_6_mul_inst1_out);
assign magma_Bits_6_sub_inst36_out = 6'(6'h12 - magma_Bits_6_mul_inst1_out);
assign magma_Bits_6_sub_inst38_out = 6'(6'h13 - magma_Bits_6_mul_inst1_out);
assign magma_Bits_6_sub_inst4_out = 6'(6'h02 - magma_Bits_6_mul_inst1_out);
assign magma_Bits_6_sub_inst40_out = 6'(6'h14 - magma_Bits_6_mul_inst1_out);
assign magma_Bits_6_sub_inst42_out = 6'(6'h15 - magma_Bits_6_mul_inst1_out);
assign magma_Bits_6_sub_inst44_out = 6'(6'h16 - magma_Bits_6_mul_inst1_out);
assign magma_Bits_6_sub_inst46_out = 6'(6'h17 - magma_Bits_6_mul_inst1_out);
assign magma_Bits_6_sub_inst48_out = 6'(6'h18 - magma_Bits_6_mul_inst1_out);
assign magma_Bits_6_sub_inst50_out = 6'(6'h19 - magma_Bits_6_mul_inst1_out);
assign magma_Bits_6_sub_inst52_out = 6'(6'h1a - magma_Bits_6_mul_inst1_out);
assign magma_Bits_6_sub_inst54_out = 6'(6'h1b - magma_Bits_6_mul_inst1_out);
assign magma_Bits_6_sub_inst56_out = 6'(6'h1c - magma_Bits_6_mul_inst1_out);
assign magma_Bits_6_sub_inst58_out = 6'(6'h1d - magma_Bits_6_mul_inst1_out);
assign magma_Bits_6_sub_inst6_out = 6'(6'h03 - magma_Bits_6_mul_inst1_out);
assign magma_Bits_6_sub_inst60_out = 6'(6'h1e - magma_Bits_6_mul_inst1_out);
assign magma_Bits_6_sub_inst62_out = 6'(6'h1f - magma_Bits_6_mul_inst1_out);
assign magma_Bits_6_sub_inst64_out = 6'(6'h20 - magma_Bits_6_mul_inst1_out);
assign magma_Bits_6_sub_inst66_out = 6'(6'h21 - magma_Bits_6_mul_inst1_out);
assign magma_Bits_6_sub_inst68_out = 6'(6'h22 - magma_Bits_6_mul_inst1_out);
assign magma_Bits_6_sub_inst70_out = 6'(6'h23 - magma_Bits_6_mul_inst1_out);
assign magma_Bits_6_sub_inst72_out = 6'(6'h24 - magma_Bits_6_mul_inst1_out);
assign magma_Bits_6_sub_inst74_out = 6'(6'h25 - magma_Bits_6_mul_inst1_out);
assign magma_Bits_6_sub_inst76_out = 6'(6'h26 - magma_Bits_6_mul_inst1_out);
assign magma_Bits_6_sub_inst78_out = 6'(6'h27 - magma_Bits_6_mul_inst1_out);
assign magma_Bits_6_sub_inst8_out = 6'(6'h04 - magma_Bits_6_mul_inst1_out);
assign magma_Bits_6_sub_inst80_out = 6'(6'h28 - magma_Bits_6_mul_inst1_out);
assign magma_Bits_6_sub_inst82_out = 6'(6'h29 - magma_Bits_6_mul_inst1_out);
assign magma_Bits_6_sub_inst84_out = 6'(6'h2a - magma_Bits_6_mul_inst1_out);
assign magma_Bits_6_sub_inst86_out = 6'(6'h2b - magma_Bits_6_mul_inst1_out);
assign magma_Bits_6_sub_inst88_out = 6'(6'h2c - magma_Bits_6_mul_inst1_out);
assign magma_Bits_6_sub_inst90_out = 6'(6'h2d - magma_Bits_6_mul_inst1_out);
assign magma_Bits_6_sub_inst92_out = 6'(6'h2e - magma_Bits_6_mul_inst1_out);
assign magma_Bits_6_sub_inst94_out = 6'(6'h2f - magma_Bits_6_mul_inst1_out);
assign magma_Bits_6_sub_inst96_out = 6'(6'h30 - magma_Bits_6_mul_inst1_out);
assign magma_Bits_6_sub_inst98_out = 6'(6'h31 - magma_Bits_6_mul_inst1_out);
assign magma_Bits_8_lshr_inst0_out = write_data >> ({1'b0,1'b0,magma_Bits_6_sub_inst0_out[5:0]});
assign magma_Bits_8_lshr_inst1_out = write_data >> ({1'b0,1'b0,magma_Bits_6_sub_inst2_out[5:0]});
assign magma_Bits_8_lshr_inst10_out = write_data >> ({1'b0,1'b0,magma_Bits_6_sub_inst20_out[5:0]});
assign magma_Bits_8_lshr_inst11_out = write_data >> ({1'b0,1'b0,magma_Bits_6_sub_inst22_out[5:0]});
assign magma_Bits_8_lshr_inst12_out = write_data >> ({1'b0,1'b0,magma_Bits_6_sub_inst24_out[5:0]});
assign magma_Bits_8_lshr_inst13_out = write_data >> ({1'b0,1'b0,magma_Bits_6_sub_inst26_out[5:0]});
assign magma_Bits_8_lshr_inst14_out = write_data >> ({1'b0,1'b0,magma_Bits_6_sub_inst28_out[5:0]});
assign magma_Bits_8_lshr_inst15_out = write_data >> ({1'b0,1'b0,magma_Bits_6_sub_inst30_out[5:0]});
assign magma_Bits_8_lshr_inst16_out = write_data >> ({1'b0,1'b0,magma_Bits_6_sub_inst32_out[5:0]});
assign magma_Bits_8_lshr_inst17_out = write_data >> ({1'b0,1'b0,magma_Bits_6_sub_inst34_out[5:0]});
assign magma_Bits_8_lshr_inst18_out = write_data >> ({1'b0,1'b0,magma_Bits_6_sub_inst36_out[5:0]});
assign magma_Bits_8_lshr_inst19_out = write_data >> ({1'b0,1'b0,magma_Bits_6_sub_inst38_out[5:0]});
assign magma_Bits_8_lshr_inst2_out = write_data >> ({1'b0,1'b0,magma_Bits_6_sub_inst4_out[5:0]});
assign magma_Bits_8_lshr_inst20_out = write_data >> ({1'b0,1'b0,magma_Bits_6_sub_inst40_out[5:0]});
assign magma_Bits_8_lshr_inst21_out = write_data >> ({1'b0,1'b0,magma_Bits_6_sub_inst42_out[5:0]});
assign magma_Bits_8_lshr_inst22_out = write_data >> ({1'b0,1'b0,magma_Bits_6_sub_inst44_out[5:0]});
assign magma_Bits_8_lshr_inst23_out = write_data >> ({1'b0,1'b0,magma_Bits_6_sub_inst46_out[5:0]});
assign magma_Bits_8_lshr_inst24_out = write_data >> ({1'b0,1'b0,magma_Bits_6_sub_inst48_out[5:0]});
assign magma_Bits_8_lshr_inst25_out = write_data >> ({1'b0,1'b0,magma_Bits_6_sub_inst50_out[5:0]});
assign magma_Bits_8_lshr_inst26_out = write_data >> ({1'b0,1'b0,magma_Bits_6_sub_inst52_out[5:0]});
assign magma_Bits_8_lshr_inst27_out = write_data >> ({1'b0,1'b0,magma_Bits_6_sub_inst54_out[5:0]});
assign magma_Bits_8_lshr_inst28_out = write_data >> ({1'b0,1'b0,magma_Bits_6_sub_inst56_out[5:0]});
assign magma_Bits_8_lshr_inst29_out = write_data >> ({1'b0,1'b0,magma_Bits_6_sub_inst58_out[5:0]});
assign magma_Bits_8_lshr_inst3_out = write_data >> ({1'b0,1'b0,magma_Bits_6_sub_inst6_out[5:0]});
assign magma_Bits_8_lshr_inst30_out = write_data >> ({1'b0,1'b0,magma_Bits_6_sub_inst60_out[5:0]});
assign magma_Bits_8_lshr_inst31_out = write_data >> ({1'b0,1'b0,magma_Bits_6_sub_inst62_out[5:0]});
assign magma_Bits_8_lshr_inst32_out = write_data >> ({1'b0,1'b0,magma_Bits_6_sub_inst64_out[5:0]});
assign magma_Bits_8_lshr_inst33_out = write_data >> ({1'b0,1'b0,magma_Bits_6_sub_inst66_out[5:0]});
assign magma_Bits_8_lshr_inst34_out = write_data >> ({1'b0,1'b0,magma_Bits_6_sub_inst68_out[5:0]});
assign magma_Bits_8_lshr_inst35_out = write_data >> ({1'b0,1'b0,magma_Bits_6_sub_inst70_out[5:0]});
assign magma_Bits_8_lshr_inst36_out = write_data >> ({1'b0,1'b0,magma_Bits_6_sub_inst72_out[5:0]});
assign magma_Bits_8_lshr_inst37_out = write_data >> ({1'b0,1'b0,magma_Bits_6_sub_inst74_out[5:0]});
assign magma_Bits_8_lshr_inst38_out = write_data >> ({1'b0,1'b0,magma_Bits_6_sub_inst76_out[5:0]});
assign magma_Bits_8_lshr_inst39_out = write_data >> ({1'b0,1'b0,magma_Bits_6_sub_inst78_out[5:0]});
assign magma_Bits_8_lshr_inst4_out = write_data >> ({1'b0,1'b0,magma_Bits_6_sub_inst8_out[5:0]});
assign magma_Bits_8_lshr_inst40_out = write_data >> ({1'b0,1'b0,magma_Bits_6_sub_inst80_out[5:0]});
assign magma_Bits_8_lshr_inst41_out = write_data >> ({1'b0,1'b0,magma_Bits_6_sub_inst82_out[5:0]});
assign magma_Bits_8_lshr_inst42_out = write_data >> ({1'b0,1'b0,magma_Bits_6_sub_inst84_out[5:0]});
assign magma_Bits_8_lshr_inst43_out = write_data >> ({1'b0,1'b0,magma_Bits_6_sub_inst86_out[5:0]});
assign magma_Bits_8_lshr_inst44_out = write_data >> ({1'b0,1'b0,magma_Bits_6_sub_inst88_out[5:0]});
assign magma_Bits_8_lshr_inst45_out = write_data >> ({1'b0,1'b0,magma_Bits_6_sub_inst90_out[5:0]});
assign magma_Bits_8_lshr_inst46_out = write_data >> ({1'b0,1'b0,magma_Bits_6_sub_inst92_out[5:0]});
assign magma_Bits_8_lshr_inst47_out = write_data >> ({1'b0,1'b0,magma_Bits_6_sub_inst94_out[5:0]});
assign magma_Bits_8_lshr_inst48_out = write_data >> ({1'b0,1'b0,magma_Bits_6_sub_inst96_out[5:0]});
assign magma_Bits_8_lshr_inst49_out = write_data >> ({1'b0,1'b0,magma_Bits_6_sub_inst98_out[5:0]});
assign magma_Bits_8_lshr_inst5_out = write_data >> ({1'b0,1'b0,magma_Bits_6_sub_inst10_out[5:0]});
assign magma_Bits_8_lshr_inst50_out = write_data >> ({1'b0,1'b0,magma_Bits_6_sub_inst100_out[5:0]});
assign magma_Bits_8_lshr_inst51_out = write_data >> ({1'b0,1'b0,magma_Bits_6_sub_inst102_out[5:0]});
assign magma_Bits_8_lshr_inst52_out = write_data >> ({1'b0,1'b0,magma_Bits_6_sub_inst104_out[5:0]});
assign magma_Bits_8_lshr_inst53_out = write_data >> ({1'b0,1'b0,magma_Bits_6_sub_inst106_out[5:0]});
assign magma_Bits_8_lshr_inst54_out = write_data >> ({1'b0,1'b0,magma_Bits_6_sub_inst108_out[5:0]});
assign magma_Bits_8_lshr_inst55_out = write_data >> ({1'b0,1'b0,magma_Bits_6_sub_inst110_out[5:0]});
assign magma_Bits_8_lshr_inst56_out = write_data >> ({1'b0,1'b0,magma_Bits_6_sub_inst112_out[5:0]});
assign magma_Bits_8_lshr_inst57_out = write_data >> ({1'b0,1'b0,magma_Bits_6_sub_inst114_out[5:0]});
assign magma_Bits_8_lshr_inst58_out = write_data >> ({1'b0,1'b0,magma_Bits_6_sub_inst116_out[5:0]});
assign magma_Bits_8_lshr_inst59_out = write_data >> ({1'b0,1'b0,magma_Bits_6_sub_inst118_out[5:0]});
assign magma_Bits_8_lshr_inst6_out = write_data >> ({1'b0,1'b0,magma_Bits_6_sub_inst12_out[5:0]});
assign magma_Bits_8_lshr_inst60_out = write_data >> ({1'b0,1'b0,magma_Bits_6_sub_inst120_out[5:0]});
assign magma_Bits_8_lshr_inst61_out = write_data >> ({1'b0,1'b0,magma_Bits_6_sub_inst122_out[5:0]});
assign magma_Bits_8_lshr_inst62_out = write_data >> ({1'b0,1'b0,magma_Bits_6_sub_inst124_out[5:0]});
assign magma_Bits_8_lshr_inst63_out = write_data >> ({1'b0,1'b0,magma_Bits_6_sub_inst126_out[5:0]});
assign magma_Bits_8_lshr_inst7_out = write_data >> ({1'b0,1'b0,magma_Bits_6_sub_inst14_out[5:0]});
assign magma_Bits_8_lshr_inst8_out = write_data >> ({1'b0,1'b0,magma_Bits_6_sub_inst16_out[5:0]});
assign magma_Bits_8_lshr_inst9_out = write_data >> ({1'b0,1'b0,magma_Bits_6_sub_inst18_out[5:0]});
endmodule
