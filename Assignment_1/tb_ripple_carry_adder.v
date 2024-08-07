// This code describes a testbench for testing and simulating the ripple carry 4-bit adder circuit model
module tb_ripple_carry_adder;
reg i11, i12, i13, i14, i21, i22, i23, i24, cin;
wire o1, o2, o3, o4, cout;
ripple_carry_adder rca(i11, i12, i13, i14, i21, i22, i23, i24, cin, o1, o2, o3, o4, cout);

initial 
begin
    cin = 1'b0;
    i11 = 1'b0;
    i12 = 1'b0;
    i13 = 1'b0;
    i14 = 1'b0;
    i21 = 1'b0;
    i22 = 1'b0;
    i23 = 1'b0;
    i24 = 1'b0;
    #20 
    i11 = 1'b0;
    i12 = 1'b1;
    i13 = 1'b0;
    i14 = 1'b1;
    i21 = 1'b0;
    i22 = 1'b0;
    i23 = 1'b1;
    i24 = 1'b1;
    #20 
    i11 = 1'b1;
    i12 = 1'b1;
    i13 = 1'b0;
    i14 = 1'b1;
    i21 = 1'b0;
    i22 = 1'b1;
    i23 = 1'b0;
    i24 = 1'b1;
    #20 
    i11 = 1'b1;
    i12 = 1'b0;
    i13 = 1'b1;
    i14 = 1'b1;
    i21 = 1'b1;
    i22 = 1'b0;
    i23 = 1'b1;
    i24 = 1'b0;

    # 30 $finish;

end
initial $monitor($time, " i14 = %b, i13 = %b, i12 = %b, i11 = %b, i24 = %b, i23 = %b, i22 = %b, i21 = %b, cin = %b, cout = %b, o4 = %b, o3 = %b, o2 = %b, o1 = %b", i14, i13, i12, i11, i24, i23, i22, i21, cin, cout, o4, o3, o2, o1);
endmodule
    