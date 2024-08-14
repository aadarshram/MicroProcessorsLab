// Code to test the clock divider module
`timescale 1ns/1ps
module tb_clk_divider();
reg inClk, reset;
wire outClk;
clk_divider cd(inClk, reset, outClk);
initial
    begin
    inClk = 1'b0;
    forever #20 inClk = ~inClk; //Simulating FPGA's 50Mhs clock
    end
initial
begin   
    reset = 1'b0;
    #40 
    reset = 1'b1;
    #30 $finish;
end
initial $monitor($time, " inClk = %b, reset = %b, outCLk = %b", inClk, reset, outClk);
endmodule


