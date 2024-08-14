// This code demonstrates a clock divider module to reduce clock frequency to observe results in an FPGA board
module clk_divider(inClk, reset, outClk);
input inClk;
input reset;
output outClk;
reg outClk;
reg[25:0] clockCount;

always@(negedge reset or posedge inClk)
begin
    if (reset == 1'b0)
        begin
            outClk = 1'b0;
            clockCount = 26'd0;
        end
    else
        begin
        clockCount <= clockCount + 1;
        if (clockCount >= 26'd25000000)
            begin
                clockCount <= 26'd0;
                outClk = ~ outClk;
            end
        end
end
endmodule

    



