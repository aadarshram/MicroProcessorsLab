// This code demonstrates a trhee-bit Johnson Counter circuit model
module three_bit_johnson_counter(Seven_Seg, in_clk, rst, digit);
input in_clk, rst;
output [7:0] Seven_Seg;
output [3:0] digit;
wire [2:0] cntr;

wire q0, q1, q2;
wire q2bar, q1bar, q0bar;
wire out_clk;

assign digit = 4'b0001; //this enables seven seg display.
assign cntr = {q2,q1,q0};
dflipflop_withreset d2(q2, q2bar, q0bar, rst, out_clk);
dflipflop_withreset d1(q1, q1bar, q2, rst, out_clk);
dflipflop_withreset d0(q0, q0bar, q1, rst, out_clk);

clk_divider cd0(in_clk, rst, out_clk);

decoder dc0(cntr, Seven_Seg);

endmodule