// This code demonstrates a behavioural model for the D-flip flop circuit with the option of resettt
module dflipflop_withreset(q, qbar, d, rst, clk);
output q, qbar;
input d, rst, clk;
reg q, qbar;
always@(posedge clk or negedge rst)
    begin 
        if (~rst)
            begin
            q <= 1'b0;
            qbar <= 1'b1;
            end
        else
            begin
            q <= d;
            qbar <= ~d;
            end
    end
endmodule
