`timescale 1ns / 1ps

module pipelinedcpu_tb_fig8_18;

	// Inputs
	reg clock;
	reg mem_clk;
	reg resetn;

	// Outputs
	wire [31:0] pc;
	wire [31:0] inst;
	wire [31:0] ealu;
	wire [31:0] malu;
	wire [31:0] walu;

	// Instantiate the Unit Under Test (UUT)
	pipelinedcpu uut (
		.clock(clock), 
		.memclock(mem_clk), 
		.resetn(resetn), 
		.pc(pc), 
		.inst(inst), 
		.ealu(ealu), 
		.malu(malu), 
		.walu(walu)
	);

	initial begin
/*	
		// Initialize Inputs
		clock = 0;
		resetn = 0;
		mem_clk = 0;

		// Wait 100 ns for global reset to finish
		#100;
 */       
		// Add stimulus here
		resetn = 0 ;
		mem_clk = 0 ;
		clock = 1 ;
		
		#1 ;
		resetn = 1 ;
		
	end
      
	initial begin
	   $monitor($time,"  pc=%h" , pc , "  inst=%h" , inst , "  ealu=%h", ealu);
	end
 
   always begin
	   #1 ;
		mem_clk = ~mem_clk ;
	end	
      
   always begin
	   #2 ;
		clock = ~clock ;
	end			
      
      
endmodule

