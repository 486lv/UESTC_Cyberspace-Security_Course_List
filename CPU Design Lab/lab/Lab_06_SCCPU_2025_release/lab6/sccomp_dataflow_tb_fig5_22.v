`timescale 1ns / 1ps

module sccomp_dataflow_tb_fig5_22;

	// Inputs
	reg clock;
	reg resetn;
	reg mem_clk;

	// Outputs
	wire [31:0] inst;
	wire [31:0] pc;
	wire [31:0] aluout;
	wire [31:0] memout;

	// Instantiate the Unit Under Test (UUT)
	sccomp_dataflow uut (
		.clock(clock), 
		.resetn(resetn), 
		.inst(inst), 
		.pc(pc), 
		.aluout(aluout), 
		.memout(memout), 
		.mem_clk(mem_clk)
	);

	initial begin
// dj : remove it
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
		
		#5 ;
		resetn = 1 ;
		
	end
	
	initial begin
	   $monitor($time,"  pc=%h" , pc , "  inst=%h" , inst , "  aluout=%h" , aluout , "  memout=%h" , memout );
	end
 
   always begin
	   #5 ;
		mem_clk = ~mem_clk ;
	end	
      
   always begin
	   #10 ;
		clock = ~clock ;
	end		
endmodule

