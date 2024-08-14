// This code describes a behavioural model for D flip flop
module dflipflop(q, qbar, d, clk);
output q, qbar;
input d, clk;
reg q, qbar;
always@(posedge clk)
    begin 
        q = d;
        qbar = ~d;
    end
endmodule
