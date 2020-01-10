module coreir_eq #(parameter width = 1) (input [width-1:0] in0, input [width-1:0] in1, output out);
  assign out = in0 == in1;
endmodule

module TestBinary (input [2:0] I0, input [2:0] I1, output [0:0] O);
wire magma_Bits_3_eq_inst0_out;
coreir_eq #(.width(3)) magma_Bits_3_eq_inst0(.in0(I0), .in1(I1), .out(magma_Bits_3_eq_inst0_out));
assign O = magma_Bits_3_eq_inst0_out;
endmodule

