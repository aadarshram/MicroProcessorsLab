// This code describes a testbench for testing and simulating the full adder circuit model
module tb_full_adder;
reg x, y, z;
wire s, c;
full_adder f1(x, y, z, s, c);

initial 
begin
    x = 1'b0;
    y = 1'b0;
    z = 1'b0;
    #20
    x = 1'b0;
    y = 1'b0;
    z = 1'b1;
    #20
    x = 1'b0;
    y = 1'b1;
    z = 1'b0;
    #20
    x = 1'b0;
    y = 1'b1;
    z = 1'b1;
    #20
    x = 1'b1;
    y = 1'b0;
    z = 1'b0;
    #20
    x = 1'b1;
    y = 1'b0;
    z = 1'b1;
    #20
    x = 1'b1;
    y = 1'b1;
    z = 1'b0;
    #20
    x = 1'b1;
    y = 1'b1;
    z = 1'b1;
    # 30 $finish;
end
initial $monitor($time, " x = %b, y = %b, z = %b, c = %b, s = %b ", x, y, z, c, s);
endmodule
    