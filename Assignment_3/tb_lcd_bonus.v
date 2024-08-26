`timescale 1ns/1ps

module lcd_tb;

reg in_Clk;
reg [3:0] a, b;
wire [7:0] data;
wire lcd_rs, lcd_e;
wire out_Clk; // Monitor this signal

// Instantiate the LCD module
lcd uut (
    .in_Clk(in_Clk),
    .a(a),
    .b(b),
    .data(data),
    .lcd_rs(lcd_rs),
    .lcd_e(lcd_e)
);

// Instantiate the clock divider separately to monitor out_Clk
clk_divider cd (
    .outClk(out_Clk),  // Monitoring this output
    .inClk(in_Clk)
);

// Generate clock signal (e.g., 10ns period, 100MHz frequency)
initial begin
    in_Clk = 0;
    forever #5 in_Clk = ~in_Clk;
end

// Apply test vectors
initial begin

    $dumpfile("test_lcd_bonus.vcd");
    $dumpvars(1, lcd_tb);

    a = 4'b0011;
    b = 4'b0101;

    #800;
    a = 4'b1001;
    b = 4'b0010;

    #800;
    a = 4'b0111;
    b = 4'b0111;

    #800;
    a = 4'b1111;
    b = 4'b1111;

    #800;
    $finish;
end

endmodule