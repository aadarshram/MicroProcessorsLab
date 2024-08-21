// This code is to display a set of characters in lcd display
module lcd(in_Clk, a, b, lcd_rs, lcd_e, data);
input in_Clk;
input [3:0] a, b;
output reg [7:0] data;
output reg lcd_rs;
output lcd_e;

wire [7:0] command [0:4];
reg [31:0] count = 0;
wire out_Clk; 
wire [7:0] m, m1;
wire [7:0] h;
assign command [0] = 8'h38; // Control signal to display on the two lines
assign command [1] = 8'h0C; // Keep display on, cursor and blink off
assign command [2] = 8'h06; // Increment cursor, no shift
assign command [3] = 8'h01; // Clear display
assign command [4] = 8'hC0; // Choose second line

clk_divider cd(out_Clk, in_Clk);
assign lcd_e = out_Clk;

unsigned_mult um(m, a, b);
// convert m to hexadecimal
b2h b1(m[7:4], h[7:4]);
b2h b2(m[3:0], h[3:0]);

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
  7: begin lcd_rs = 1; data = 8'h6F; end // o
  8: begin lcd_rs = 1; data = 8'h34; end // d
  9: begin lcd_rs = 1; data = 8'h75; end // u
  10: begin lcd_rs = 1; data = 8'h63; end // c
  11: begin lcd_rs = 1; data = 8'h74; end // t
  12: begin lcd_rs = 1; data = 8'h20; end // space
  13: begin lcd_rs = 1; data = 8'h69; end // i
  14: begin lcd_rs = 1; data = 8'h73; end // s
  15: begin lcd_rs = 1; data = 8'h20; end // space
  16: begin lcd_rs = 1; data = 8'h3D; end // equal to

  17: begin lcd_rs = 1; data = command[4]; end // command for next line
  // Display the product
  18: begin lcd_rs = 1; data = h[7]; end
  19: begin lcd_rs = 1; data = h[6]; end
  20: begin lcd_rs = 1; data = h[5]; end
  21: begin lcd_rs = 1; data = h[4]; end
  22: begin lcd_rs = 1; data = h[3]; end
  23: begin lcd_rs = 1; data = h[2]; end
  24: begin lcd_rs = 1; data = h[1]; end
  25: begin lcd_rs = 1; data = h[0]; end

  default: begin lcd_rs = 0; data = 8'h80; end

  endcase
  unsigned_mult um1(m1, a, b);
  if (m != m1) begin
    count = 0;
    b2h b1(m[7:4], h[7:4]);
    b2h b2(m[3:0], h[3:0]);
  end
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

module b2h(b, h);
input [3:0] b;
output [3:0] h;
case(b)
1'd0: h = 4'h30;
1'd1: h = 4'h31;
1'd2: h = 4'h32;
1'd3: h = 4'h33;
1'd4: h = 4'h34;
1'd5: h = 4'h35;
1'd6: h = 4'h36;
1'd7: h = 4'h37;
1'd8: h = 4'h38;
1'd9: h = 4'h39;
1'd10: h = 4'h41;
1'd11: h = 4'h42;
1'd12: h = 4'h43;
1'd13: h = 4'h44;
1'd14: h = 4'h45;
1'd15: h = 4'h46;

endcase



