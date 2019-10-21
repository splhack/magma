module coreir_sge #(parameter width = 1) (input [width-1:0] in0, input [width-1:0] in1, output out);
  assign out = $signed(in0) >= $signed(in1);
endmodule

module TestBinary (input [0:0] I0, input [0:0] I1, output O);
wire magma_Bits_1_sge_inst0_out;
coreir_sge #(.width(1)) magma_Bits_1_sge_inst0(.in0(I0), .in1(I1), .out(magma_Bits_1_sge_inst0_out));
assign O = magma_Bits_1_sge_inst0_out;
endmodule

