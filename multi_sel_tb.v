`include "./multi_sel.v"

`timescale 1ns/1ns

module testbench();
  reg clk = 0;
  always #5 clk = ~clk;

  reg [7:0] d;
  reg rst;
  wire input_grant;
  wire [10:0] out;

  initial begin
    rst <= 1'b0;
    #10
    rst <= 1'b1;
    #10
    d <= 8'd143;
    #55
    d <= 8'd7;
    #50
    d <= 8'd6;
    #10
    d <= 8'd128;
    #10
    d <= 8'd129;
    #50
    $finish;
  end

  multi_sel m1(
    .d(d),
    .clk(clk),
    .rst(rst),
    .input_grant(input_grant),
    .out(out)
  );
  
  initial begin
    $dumpfile("out.vcd");
    // This will dump all signal, which may not be useful
    //$dumpvars;
    // dumping only this module
    //$dumpvars(1, testbench);
    // dumping only these variable
    // the first number (level) is actually useless
    $dumpvars(0, testbench);
end  
    
endmodule