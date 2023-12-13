`include "./odd_sel.v"

`timescale 1ns/1ns

module testbench();
	reg clk = 0;
	always #5 clk = ~clk;  // Create clock with period=10
// A testbench
  reg [31:0] bus;
  reg sel;
  wire check;

  initial begin
    bus <= 32'h0000_0000;
    sel <= 1'b0;
    #20
    bus <= 32'h0000_0001;
    #20
    sel <= 1'b1;
    #20
    $finish;
  end

  odd_sel o1(
    .bus(bus),
    .sel(sel),
    .clk(clk),
    .check(check)
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