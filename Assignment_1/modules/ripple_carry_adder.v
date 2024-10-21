// This code describes a model for 4-bit ripple carry adder using x4 full adders
module ripple_carry_adder(i1, i2, cin, o, cout);
input [3:0] i1, i2;
input cin;
wire c1, c2, c3;
output[3:0] o;
output cout;

full_adder fa1(i1[0], i2[0], cin, o[0], c1);
full_adder fa2(i1[1], i2[1], c1, o[1], c2);
full_adder fa3(i1[2], i2[2], c2, o[2], c3);
full_adder fa4(i1[3], i2[3], c3, o[3], cout);

endmodule
