`include ".\Tff_2.v"

`timescale 1ns/1ns

module testbench();
	reg clk = 0;
	always #5 clk = ~clk;  // Create clock with period=10

  // A testbench
  reg data;
  reg rst;
  wire q;

  initial begin
    data <= 1'b0;
    rst <= 1'b0;
    #10
    rst <= 1'b1;
    #20
    data <= 1'b1;
    #20
    data <= 1'b0;
    #20
    $finish;
  end

  // Sub_modules
  Tff_2 t1(
    .data(data),
    .clk(clk),
    .rst(rst),
    .q(q)
  ); 
    
  //end    
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