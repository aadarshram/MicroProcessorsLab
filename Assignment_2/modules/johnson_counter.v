// This code demonstrates a trhee-bit Johnson Counter circuit model
module three_bit_johnson_counter(Seven_Seg, digit, in_clk, rst);
input in_clk, rst;
wire out_clk;
output [7:0] Seven_Seg;
output [3:0] digit;
wire [2:0] cntr;

wire q0, q1, q2;
wire q2bar, q1bar, q0bar;

assign digit = 4'b0001; //this enables seven seg display.
assign cntr = {q0, q1, q2};
clk_divider cd0(out_clk, in_clk, rst);
dflipflop_withreset d2(q2, q2bar, q1, rst, out_clk);
dflipflop_withreset d1(q1, q1bar, q0, rst, out_clk);
dflipflop_withreset d0(q0, q0bar, q2bar, rst, out_clk);
decoder dc0(Seven_Seg, cntr);

endmodule