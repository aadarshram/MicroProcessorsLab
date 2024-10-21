// This code demonstrates a clock divider module to reduce clock frequency to observe results on an FPGA board
module clk_divider(outClk, inClk, reset);
input inClk, reset;
output reg outClk;
reg [25:0] clockCount;

always@(negedge reset or posedge inClk)
begin
    if (reset == 1'b0)
        begin
            outClk = 1'b0;
            //clockCount = 1'd0;
            clockCount = 26'd0;
        end
    else
        begin
        // if (clockCount >= 1'd1)
        if (clockCount >= 26'd50000000)
            begin
                // clockCount = 1'd0;
                clockCount <= 26'd0;
                outClk <= ~ outClk;
            end
        clockCount <= clockCount + 1;

        end
end
endmodule

    



