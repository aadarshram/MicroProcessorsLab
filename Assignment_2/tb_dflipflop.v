// This code describes a testbench for testing the d flip flop module
`timescale 1ns/1ps
module tb_dflipflop();
reg d, clk;
wire q, qbar;
dflipflop dff(q, qbar, d, clk);
initial 
begin
    clk = 1'b0;
    forever # 10 clk = ~clk;
end
initial
begin
    d = 1'b0;
    #10
    d = 1'b1;
    #20
    d = 1'b0;
    #20
    d = 1'b1;
    #30 $finish;
end
initial $monitor($time, " clk = %b, d = %b, q = %b, qbar = %b ", clk, d, q, qbar);
endmodule
// The initial value of q and qbar will be denoted by'x' because it is undefined until the first positive edge of clock