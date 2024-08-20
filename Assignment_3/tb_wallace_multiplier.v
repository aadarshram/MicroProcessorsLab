`timescale 1ns/1ps
module tb_wallace_multiplier();
reg [3:0] a, b;
wire [7:0] m;
unsigned_mult um(m, a, b);
initial begin
    $dumpfile("test_wallace_multiplier.vcd");
    $dumpvars(1, tb_wallace_multiplier);
    #10 
    a = 4'd0;
    b = 4'd0;
    #10
    a = 4'd3;
    b = 4'd2;
    #10
    a = 4'd12;
    b = 4'd13;
    #10 $finish;
end
initial $monitor($time, " a = %b, b = %b, m = %b ", a, b, m);
endmodule