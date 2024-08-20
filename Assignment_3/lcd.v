// This code is to display a set of characters in lcd display
module lcd(in_Clk, lcd_rs, lcd_e, data);
input in_Clk;
output reg [7:0] data;
output reg lcd_rs;
output lcd_e;

wire [7:0] command [0:4];
reg [31:0] count = 0;
wire out_Clk;

assign command [0] = ;
assign command [1] = ;
assign command [2] = ;
assign command [3] = ;
assign command [4] = ;

clk_divider cd(in_Clk, out_Clk);
assign lcd_e = out_Clk;

always@(posedge lcd_e) begin
  case(count)
  1: begin lcd_rs = 0; data = ; end
  2: begin lcd_rs = 0; data = ; end
  3: begin lcd_rs = 0; data = ; end
  4: begin lcd_rs = 0; data = ; end
  5: begin lcd_rs = 0; data = ; end
  6: begin lcd_rs = 0; data = ; end
  7: begin lcd_rs = 0; data = ; end
  8: begin lcd_rs = 0; data = ; end
  9: begin lcd_rs = 0; data = ; end
  10: begin lcd_rs = 0; data = ; end
  11: begin lcd_rs = 0; data = ; end
  12: begin lcd_rs = 0; data = ; end
  13: begin lcd_rs = 0; data = ; end
  14: begin lcd_rs = 0; data = ; end
  15: begin lcd_rs = 0; data = ; end
  16: begin lcd_rs = 0; data = ; end
  17: begin lcd_rs = 0; data = ; end
  18: begin lcd_rs = 0; data = ; end
  19: begin lcd_rs = 0; data = ; end
  20: begin lcd_rs = 0; data = ; end
  21: begin lcd_rs = 0; data = ; end

  default: begin lcd_rs = 0; data = ; end

  endcase
end
endmodule

// Code for clock divider module used (taken from Assignment 2)
// This code demonstrates a clock divider module to reduce clock frequency to observe results in an FPGA board
module clk_divider(outClk, inClk, reset);
input inClk;
input reset;
output reg outClk;
//reg clockCount;
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
                clockCount = 26'd0;
                outClk = ~ outClk;
            end
        clockCount <= clockCount + 1;

        end
end
endmodule

    




