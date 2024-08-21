// This code describes a testbench for testing the d flip flop with reset module
`timescale 1ns/1ps
module tb_dflipflop_withreset();
reg d, rst, clk;
wire q, qbar;
dflipflop_withreset dff(q, qbar, d, rst, clk);
initial 
begin
    clk = 1'b0;
    forever #10 clk = ~clk;
end
initial
begin
    $dumpfile("test_dflipflop.vcd");
    $dumpvars(0, tb_dflipflop_withreset);
    rst = 1'b0;
    #15
    rst = 1'b1;
    d = 1'b0;
    #10
    d = 1'b1;
    #20
    rst = 1'b0;
    #10
    rst = 1'b1;
    #20
    d = 1'b0;
    #20
    d = 1'b1;
    #30 $finish;
end
initial $monitor($time, " clk = %b, rst = %b, d = %b, q = %b, qbar = %b ", clk, rst, d, q, qbar);
endmodule
// The initial value of q and qbar will be denoted by'x' because it is undefined until the first positive edge of clock