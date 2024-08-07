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

    # 30 $finish;

end
// initial $monitor($time, " i14 = %b, i13 = %b, i12 = %b, i11 = %b, i24 = %b, i23 = %b, i22 = %b, i21 = %b, cin = %b, cout = %b, o4 = %b, o3 = %b, o2 = %b, o1 = %b", i14, i13, i12, i11, i24, i23, i22, i21, cin, cout, o4, o3, o2, o1);
initial $monitor($time, " i1 = %b, i2 = %b, cin = %b, cout = %b, o = %b ", i1, i2, cin, cout, o);

endmodule
    