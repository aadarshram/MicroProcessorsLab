// This code describes a testbench for testing and simulating the ripple carry 4-bit adder circuit model
`timescale 1ns/1ps
module tb_ripple_carry_adder;
reg[3:0] i1, i2;
reg cin;
wire[3:0] o;
wire cout;
ripple_carry_adder rca(i1, i2, cin, o, cout);

initial 
begin
    $dumpfile("test_ripple_carry_adder.vcd");
    $dumpvars(1, tb_ripple_carry_adder);
    cin = 1'b0;
    i1 = 4'b0000;
    i2 = 4'b0000;
    #20 
    i1 = 4'b0010;
    i2 = 4'b0101;
    #20 
    i1 = 4'b0111;
    i2 = 4'b1000;
    #20 
    i1 = 4'b0110;
    i2 = 4'b1000;

    #30 $finish;

end
initial $monitor($time, " i1 = %b, i2 = %b, cin = %b, cout = %b, o = %b ", i1, i2, cin, cout, o);

endmodule
    
