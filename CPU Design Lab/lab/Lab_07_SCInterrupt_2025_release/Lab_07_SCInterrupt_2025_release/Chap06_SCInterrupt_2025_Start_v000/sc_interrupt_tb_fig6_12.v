`timescale 1ns / 1ps

module sc_interrupt_tb_fig6_12;

	// Inputs
	reg clock;
	reg resetn;
	reg mem_clk;
	reg intr;

	// Outputs
	wire [31:0] inst;
	wire [31:0] pc;
	wire [31:0] aluout;
	wire [31:0] memout;
	wire inta;

	// Instantiate the Unit Under Test (UUT)
	sc_interrupt uut (
		.clock(clock), 
		.resetn(resetn), 
		.inst(inst), 
		.pc(pc), 
		.aluout(aluout), 
		.memout(memout), 
		.mem_clk(mem_clk), 
		.intr(intr), 
		.inta(inta)
	);

	initial begin
// dj : remove it
/*	
		// Initialize Inputs
		clock = 0;
		resetn = 0;
		mem_clk = 0;
		intr = 0;

		// Wait 100 ns for global reset to finish
		#100;
*/    
		// Add stimulus here
		resetn = 0 ;
		mem_clk = 0 ;
		clock = 1 ;
		intr = 0;
		
		#5 ;
		resetn = 1 ;
		
		#950 ;
		intr = 1 ;
		
		#20 ;
		intr = 0 ;
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

