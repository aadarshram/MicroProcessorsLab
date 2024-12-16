module full_adder(a, b, cin, s, cout);

input a, b, cin;
wire c0, s0, c1;
output cout,s;

half_adder ha1(a, b, s0, c0);
half_adder ha2(s0, cin, s, c1);
or(cout, c0, c1);

endmodule