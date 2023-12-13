`include "./mux4_1.v"

`timescale 1ns/1ns

module testbench();
	reg clk = 0;
	always #5 clk = ~clk;

	// A testbench
	reg [1:0] d1 = 0;
	reg [1:0] d2 = 0;
	reg [1:0] d3 = 0;
  reg [1:0] d0 = 0;
	reg [1:0] sel = 0;	
	wire [1:0] mux_out;
	
	initial begin
		d1 <= 0;
		d2 <= 1;
		d3 <= 2;
		d0 <= 3;
		#10 
		sel <= 0;
		#10 
		sel <= 1;
		#10 
		sel <= 2;
		#10 
		sel <= 3;	
       
        
    #50 $finish;      //stoprunning 
	end

//Sub-modules	
	mux4_1 m1(
	.d0(d0),
	.d1(d1),
	.d2(d2),
	.d3(d3),
	.sel(sel),
	.mux_out(mux_out)
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