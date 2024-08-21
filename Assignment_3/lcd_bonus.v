// This code is to display a set of characters in lcd display
module lcd(in_Clk, a, b, lcd_rs, lcd_e, data);
input in_Clk;
input [3:0] a, b;
output reg [7:0] data;
output reg lcd_rs;
output lcd_e;
output [7:0] product;

wire [7:0] command [0:4];
reg [31:0] count = 0;
wire out_Clk; 
wire [7:0] m;

assign command [0] = 8'h38; // Control signal to display on the two lines
assign command [1] = 8'h0C; // Keep display on, cursor and blink off
assign command [2] = 8'h06; // Increment cursor, no shift
assign command [3] = 8'h01; // Clear display
assign command [4] = 8'hC0; // Choose second line

clk_divider cd(in_Clk, out_Clk);
assign lcd_e = out_Clk;

unsigned_mult um(m, a, b);
assign product = m;

always@(posedge lcd_e) begin
    count  = count + 1;
  case(count)
  // Entry command
  1: begin lcd_rs = 0; data = command[0]; end
  2: begin lcd_rs = 0; data = command[1]; end
  3: begin lcd_rs = 0; data = command[2]; end
  4: begin lcd_rs = 0; data = command[3]; end
  // Display "Product is ="
  5: begin lcd_rs = 1; data = 8'h50; end // P
  6: begin lcd_rs = 1; data = 8'h72; end // r
  7: begin lcd_rs = 1; data = 8'h33; end // o
  8: begin lcd_rs = 1; data = 8'h34; end // d
  9: begin lcd_rs = 1; data = 8'h35; end // u
  10: begin lcd_rs = 1; data = 8'h36; end // c
  11: begin lcd_rs = 1; data = 8'h74; end // t
  12: begin lcd_rs = 1; data = 8'h20; end // space
  13: begin lcd_rs = 1; data = 8'h69; end // i
  14: begin lcd_rs = 1; data = 8'h73; end // s
  15: begin lcd_rs = 1; data = 8'h20; end // space
  16: begin lcd_rs = 1; data = 8'h3D; end // equal to

  17: begin lcd_rs = 1; data = command[4]; end // command for next line
  // Display the product
  18: begin lcd_rs = 1; data = m[7]; end
  19: begin lcd_rs = 1; data = m[6]; end
  20: begin lcd_rs = 1; data = m[5]; end
  21: begin lcd_rs = 1; data = m[4]; end
  22: begin lcd_rs = 1; data = m[3]; end
  23: begin lcd_rs = 1; data = m[2]; end
  24: begin lcd_rs = 1; data = m[1]; end
  25: begin lcd_rs = 1; data = m[0]; end

  default: begin lcd_rs = 0; data = 8'h80; end

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

    




