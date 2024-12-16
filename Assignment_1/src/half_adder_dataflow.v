// This code describes a dataflow model of a half adder logic circuit
module half_adder(a, b, s, c);
input a, b;
output s, c;
assign s = a ^ b;
assign c = a & b;
endmodule
