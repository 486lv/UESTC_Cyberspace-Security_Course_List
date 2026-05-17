`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   09:34:50 05/08/2025
// Design Name:   SCCPU
// Module Name:   D:/p1/SCCPU_t.v
// Project Name:  p1
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: SCCPU
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module SCCPU_t;

	// Inputs
	reg Clock;
	reg Resetn;
	

	// Outputs
	wire [31:0] PC;
	wire [31:0] Inst;
	wire [31:0] Alu_Result;
	wire stall;////////////
	
   //re[4:0]mem_rn;

	// Instantiate the Unit Under Test (UUT)
	SCCPU uut (
		.Clock(Clock), 
		.Resetn(Resetn), 
		.PC(PC), 
		.Inst(Inst), 
		.Alu_Result(Alu_Result),
		.stall(stall)
      
	);

	initial begin
		
		Clock = 1;
		Resetn = 0;
		//stall=0;

		
		#100;
      Resetn = 1;  
		

	end
      
	always #50 Clock=~Clock;	
		
endmodule

