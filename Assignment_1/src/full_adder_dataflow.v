// This code describes a dataflow model of a full adder logic circuit
module full_adder(x, y, z, s, c);
input x, y, z;
output s, c;
wire s1, c1, c2;

assign s1 = x ^ y;
assign c1 = x & y;
assign s = s1 ^ z;
assign c2 = s1 & z;
assign c = c1 | c2;
endmodule