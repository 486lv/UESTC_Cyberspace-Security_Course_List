`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   21:13:58 12/09/2014
// Design Name:   pipelinedcpu_exc_int
// Module Name:   Z:/2014/mips/LiYaMin/source/pipelined_cpu_exc_int_tb_fig_8_33.v
// Project Name:  pipelined_int_cpu
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: pipelinedcpu_exc_int
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module pipelined_cpu_exc_int_tb_fig_8_33;

	// Inputs
	reg clock;
	reg memclock;
	reg resetn;
	reg intr;

	// Outputs
	wire [31:0] pc;
	wire [31:0] inst;
	wire [31:0] ealu;
	wire [31:0] malu;
	wire [31:0] walu;
	wire inta;

	// Instantiate the Unit Under Test (UUT)
	pipelinedcpu_exc_int uut (
		.clock(clock), 
		.memclock(memclock), 
		.resetn(resetn), 
		.pc(pc), 
		.inst(inst), 
		.ealu(ealu), 
		.malu(malu), 
		.walu(walu), 
		.intr(intr), 
		.inta(inta)
	);
	initial begin
	   $monitor($time,"  pc=%h" , pc , "  inst=%h" , inst , "  ealu=%h" , ealu);
	end
	
	initial begin
// dj : remove it
/*	
		// Initialize Inputs
		clock = 0;
		memclock = 0;
		resetn = 0;
		intr = 0;

		// Wait 100 ns for global reset to finish
		#100;
*/        
		// Add stimulus here
		resetn = 0 ;
		memclock = 0 ;
		clock = 1 ;
		intr = 0;
		
		#1 ;
		resetn = 1 ;
		
		#237 ;
		intr = 1 ;
		
		#4 ;
		intr = 0 ;
		
		#84
		intr = 1 ;
		
		#4 ;
		intr = 0 ;
		
		#44 ;
		intr = 1 ;
		
		#4 ;
		intr = 0 ;
	end
   
	always begin
	   #1 ;
		memclock = ~memclock ;
	end	
      
   always begin
	   #2 ;
		clock = ~clock ;
	end
endmodule

