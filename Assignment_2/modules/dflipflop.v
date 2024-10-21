// This code describes a behavioural model for D flip flop
module dflipflop(q, qbar, d, clk);
output reg q, qbar;
input d, clk;
always@(posedge clk)
    begin 
        q <= d;
        qbar <= ~d;
    end
endmodule
