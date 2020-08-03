module coreir_wrap (
    input in,
    output out
);
  assign out = in;
endmodule

module corebit_term (
    input in
);

endmodule

module FF(input I, output reg O, input CLK, input CE);
always @(posedge CLK) begin
  if (CE) O <= I;
end
endmodule
module TestDisplay (
    input I,
    output O,
    input CLK,
    input CE
);
wire FF_inst0_I;
wire FF_inst0_CLK;
wire FF_inst0_CE;
wire _magma_inline_wire0;
assign FF_inst0_I = I;
assign FF_inst0_CLK = CLK;
assign FF_inst0_CE = CE;
FF FF_inst0 (
    .I(FF_inst0_I),
    .O(O),
    .CLK(FF_inst0_CLK),
    .CE(FF_inst0_CE)
);
assign _magma_inline_wire0 = O;
always @(posedge CLK) begin
    if (CE) $display("%0t: ff.O=%d, ff.I=%d", $time, _magma_inline_wire0, I);
end

endmodule

