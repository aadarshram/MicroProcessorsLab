// This code demonstrates a clock divider module to reduce clock frequency to observe results in an FPGA board
module clk_divider(outClk, inClk, reset);
input inClk;
input reset;
output outClk;
reg outClk;
reg clockCount;

always@(negedge reset or posedge inClk)
begin
    if (reset == 1'b0)
        begin
            outClk = 1'b0;
            clockCount = 1'd0;
        end
    else
        begin
        if (clockCount >= 1'd1)
            begin
                clockCount = 1'd0;
                outClk = ~ outClk;
            end
        clockCount <= clockCount + 1;

        end
end
endmodule

    



