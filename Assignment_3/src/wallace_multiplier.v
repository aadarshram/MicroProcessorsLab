// This code describes a module to perform "Wallace" multiplication of two 4-bit numbers
// The Wallace multiplier is a circuit that does multiplication og two inetegrs faster by producing partial products and then adding them up with layers of appropriate adders.

module unsigned_mult(m, a, b);
input [3:0] a, b;
output [7:0] m;

wire [3:0] p0, p1, p2, p3;
wire s5, s4, s3, s2, s1, s0;
wire c4, c3, c2, c1, c0;
wire k1, l1, k2, l2;

// assign partial products
assign p0 = a & {4{b[0]}}; // {4{x}} for 1'bx input results in 4'bxxxx output
assign p1 = a & {4{b[1]}};
assign p2 = a & {4{b[2]}};
assign p3 = a & {4{b[3]}};

assign m[0] = p0[0];

half_adder ha1(s0, c0, p0[1], p1[0]);
assign m[1] = s0;

full_adder fa1(s1, c1, p0[2], p1[1], p2[0]);

half_adder ha3(k1, l1, p2[1], p3[0]);
full_adder fa2(s2, c2, p0[3], p1[2], k1);

half_adder ha4(k2, l2, p2[2], p3[0]);
full_adder fa3(s3, c3, k2, l1, p1[3]);

full_adder fa4(s4, c4, p2[3], p3[2], l2);

ripple_carry_adder rca(m[6:2], m[7], {p3[3], s4, s3, s2, s1}, {c4, c3, c2, c1, c0}); // {} denotes concatenation
endmodule

// We use the half-adder and full-adder and ripple carry adder modules created in Assignment 1, here.
// The ripple carry adder is modified to handle 5-bit inputs.

// This code describes a dataflow model of a half adder logic circuit
module half_adder(s, c, a, b);
input a;
input b;
output s;
output c;
assign s = a ^ b;
assign c = a & b;
endmodule

// This code describes a dataflow model of a full adder logic circuit
module full_adder(s, c, x, y, z);
input x, y, z;
output s, c;
wire s1, c1, c2;

assign s1 = x ^ y;
assign c1 = x & y;
assign s = s1 ^ z;
assign c2 = s1 & z;
assign c = c1 | c2;
endmodule

// This code describes a model for 5-bit ripple carry adder using x5 full adders (carry input port is removed since it is not necessary)
module ripple_carry_adder(o, cout, i1, i2);
input [4:0] i1, i2;
wire cin;
wire c1, c2, c3, c4;
output[4:0] o;
output cout;

assign cin = 1'b0; // in our case

full_adder fa1(o[0], c1, i1[0], i2[0], cin);
full_adder fa2(o[1], c2, i1[1], i2[1], c1);
full_adder fa3( o[2], c3, i1[2], i2[2], c2);
full_adder fa4(o[3], c4, i1[3], i2[3], c3);
full_adder fa5(o[4], cout, i1[4], i2[4], c4);

endmodule