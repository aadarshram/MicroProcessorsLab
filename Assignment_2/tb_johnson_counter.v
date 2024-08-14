// This code serves as a testbench to simulate the Johnson counter
`timescale 1ns/1ps
module tb_three_bit_johnson_counter();
reg in_clk, rst;
wire out_clk;
wire [7:0] Seven_Seg;
wire [3:0] digit;
three_bit_johnson_counter jc(Seven_Seg, in_clk, rst, digit, out_clk);
initial 
begin
    in_clk = 1'b0;
    forever #10 in_clk = ~in_clk;
end
initial
begin
    rst = 1'b0;
    #5
    rst = 1'b1;
    #200 $finish;
end
initial $monitor($time, " in_clk = %b, rst = %b, digit = %b, Seven_Seg = %b out_clk = %b ", in_clk, rst, digit, Seven_Seg, out_clk);
endmodule
