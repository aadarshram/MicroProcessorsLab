// This code is to display a set of characters in lcd display
module lcd(in_Clk, a, b, lcd_rs, lcd_e, data);
input in_Clk;
input [3:0] a, b;
output reg [7:0] data;
output reg lcd_rs;
output lcd_e;

reg [3:0] a_old = 4'b0000, b_old = 4'b0000;
wire [7:0] command [0:5];
reg [31:0] count = 0;
wire out_Clk; 
wire [7:0] m;
wire [11:0] bcd;
assign command [0] = 8'h38; // Control signal to display on the two lines
assign command [1] = 8'h0C; // Keep display on, cursor and blink off
assign command [2] = 8'h06; // Increment cursor, no shift
assign command [3] = 8'h01; // Clear display
assign command [4] = 8'h80; // choose first line
assign command [5] = 8'hC0; // Choose second line

clk_divider cd(out_Clk, in_Clk);
assign lcd_e = out_Clk;

unsigned_mult um(m, a, b);
// convert m to bcd
bin2bcd b1(bcd, m);

always@(posedge lcd_e) begin
  if (a != a_old || b != b_old) begin
    count <= 0;
    a_old <= a;
    b_old <= b;
  end
  if (count < 21) begin
    count  <= count + 1;
    end 
  case(count)
  // Entry command
  1: begin lcd_rs = 0; data = command[0]; end
  2: begin lcd_rs = 0; data = command[1]; end
  3: begin lcd_rs = 0; data = command[2]; end
  4: begin lcd_rs = 0; data = command[3]; end
  5: begin lcd_rs = 0; data = command[4]; end
  // Display "Product is ="
  6: begin lcd_rs = 1; data = 8'h50; end // P
  7: begin lcd_rs = 1; data = 8'h72; end // r
  8: begin lcd_rs = 1; data = 8'h6F; end // o
  9: begin lcd_rs = 1; data = 8'h34; end // d
  10: begin lcd_rs = 1; data = 8'h75; end // u
  11: begin lcd_rs = 1; data = 8'h63; end // c
  12: begin lcd_rs = 1; data = 8'h74; end // t
  13: begin lcd_rs = 1; data = 8'h20; end // space
  14: begin lcd_rs = 1; data = 8'h69; end // i
  15: begin lcd_rs = 1; data = 8'h73; end // s
  16: begin lcd_rs = 1; data = 8'h20; end // space
  17: begin lcd_rs = 1; data = 8'h3D; end // equal to

  18: begin lcd_rs = 0; data = command[5]; end // command for next line

  // Display the product
  19: begin lcd_rs = 1; data = bcd[11:8] + 8'h30; end
  20: begin lcd_rs = 1; data = bcd[7:4] + 8'h30; end
  21: begin lcd_rs = 1; data = bcd[3:0] + 8'h30; end

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

// We need to convert binary to bcd for display in lcd
module bin2bcd( // double-dabble algorithm - behavioural model
   output reg [11:0] bcd,
   input [7:0] bin
   );
integer i;
always @(bin) begin
    bcd=0;		 	
    for (i=0;i<8;i=i+1) begin					//Iterate once for each bit in input number
        if (bcd[3:0] >= 5) bcd[3:0] = bcd[3:0] + 3;		//If any BCD digit is >= 5, add three
	    if (bcd[7:4] >= 5) bcd[7:4] = bcd[7:4] + 3;
	    if (bcd[11:8] >= 5) bcd[11:8] = bcd[11:8] + 3;
	    bcd = {bcd[10:0],bin[7-i]};				//Shift one bit, and shift in the MSB from input 
    end
end
endmodule


