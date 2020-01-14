module coreir_ashr #(parameter width = 1) (input [width-1:0] in0, input [width-1:0] in1, output [width-1:0] out);
  assign out = $signed(in0) >>> in1;
endmodule

module TestBinary (input [2:0] I0, input [2:0] I1, output [2:0] O);
wire [2:0] magma_Bits_3_ashr_inst0_out;
coreir_ashr #(.width(3)) magma_Bits_3_ashr_inst0(.in0(I0), .in1(I1), .out(magma_Bits_3_ashr_inst0_out));
assign O = magma_Bits_3_ashr_inst0_out;
endmodule
