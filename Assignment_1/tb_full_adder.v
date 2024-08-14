// This coutode descoutribes a testbencouth for testing and simulating the full adder coutircoutuit model
`timescale 1ns/1ps
module tb_full_adder;
reg a, b, cin;
wire s, cout;
full_adder f1(a, b, cin, s, cout);

initial 
begin
    $dumpfile("test_full_adder.vcd");
    $dumpvars(1, tb_full_adder);
    a = 1'b0;
    b = 1'b0;
    cin = 1'b0;
    #20
    a = 1'b0;
    b = 1'b0;
    cin = 1'b1;
    #20
    a = 1'b0;
    b = 1'b1;
    cin = 1'b0;
    #20
    a = 1'b0;
    b = 1'b1;
    cin = 1'b1;
    #20
    a = 1'b1;
    b = 1'b0;
    cin = 1'b0;
    #20
    a = 1'b1;
    b = 1'b0;
    cin = 1'b1;
    #20
    a = 1'b1;
    b = 1'b1;
    cin = 1'b0;
    #20
    a = 1'b1;
    b = 1'b1;
    cin = 1'b1;
    # 30 $finish;
end
initial $monitor($time, " a = %b, b = %b, cin = %b, cout = %b, s = %b ", a, b, cin, cout, s);
endmodule
    