// This code is to display a set of characters in lcd display
module lcd(in_Clk, lcd_rs, lcd_e, data);
input in_Clk;
output reg [7:0] data;
output reg lcd_rs;
output lcd_e;

wire [7:0] command [0:4];
reg [31:0] count = 0;
wire out_Clk;

assign command [0] = 8'h38; // Control signal to display on the two lines
assign command [1] = 8'h0C; // Keep display on, cursor and blink off
assign command [2] = 8'h06; // Increment cursor, no shift
assign command [3] = 8'h01; // Clear display
assign command [4] = 8'hC0; // Choose second line

clk_divider cd(out_Clk, in_Clk);
assign lcd_e = out_Clk;

always@(posedge lcd_e) begin
  count  = count + 1;
  case(count)
  1: begin lcd_rs = 0; data = command[0]; end
  2: begin lcd_rs = 0; data = command[1]; end
  3: begin lcd_rs = 0; data = command[2]; end
  4: begin lcd_rs = 0; data = command[3]; end
  5: begin lcd_rs = 0; data = command[4]; end
  6: begin lcd_rs = 1; data = 8'h31; end
  7: begin lcd_rs = 1; data = 8'h32; end
  8: begin lcd_rs = 1; data = 8'h33; end
  9: begin lcd_rs = 1; data = 8'h34; end
  10: begin lcd_rs = 1; data = 8'h35; end
  11: begin lcd_rs = 1; data = 8'h36; end
  12: begin lcd_rs = 1; data = 8'h37; end
  13: begin lcd_rs = 1; data = 8'h38; end
  14: begin lcd_rs = 1; data = 8'h39; end
  15: begin lcd_rs = 1; data = 8'h41; end
  16: begin lcd_rs = 1; data = 8'h42; end
  17: begin lcd_rs = 1; data = 8'h43; end
  18: begin lcd_rs = 1; data = 8'h44; end
  19: begin lcd_rs = 1; data = 8'h45; end
  20: begin lcd_rs = 1; data = 8'h46; end
  21: begin lcd_rs = 1; data = 8'h47; end

  default: begin lcd_rs = 0; data = 8'h80; end

  endcase
end
endmodule

// Code for clock divider module used (taken from Assignment 2)
// This code demonstrates a clock divider module to reduce clock frequency to observe results in an FPGA board
module clk_divider(outClk, inClk);
input inClk;
output reg outClk;
//reg clockCount;
reg [25:0] clockCount;

always@(posedge inClk)
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
endmodule

    




