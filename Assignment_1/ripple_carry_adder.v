// This code describes a model for 4-bit ripple carry adder using x4 full adders
module ripple_carry_adder(i11, i12, i13, i14, i21, i22, i23, i24, cin, o1, o2, o3, o4, cout);
input i11, i12, i13, i14, i21, i22, i23, i24, cin;
wire c1, c2, c3;
output o1, o2, o3, o4, cout;

full_adder fa1(i11, i21, c0, o1, c1);
full_adder fa2(i12, i22, c1, o2, c2);
full_adder fa3(i13, i23, c2, o3, c3);
full_adder fa4(i14, i24, c3, o4, cout);

endmodule