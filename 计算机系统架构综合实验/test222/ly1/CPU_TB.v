`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   13:57:10 06/10/2025
// Design Name:   SCCPU
// Module Name:   F:/ck2/test222/ly1/CPU_TB.v
// Project Name:  ly1
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

module CPU_TB;

	// Inputs
	reg Clock;
	reg Resetn;

	// Outputs
	wire [31:0] PC;
	wire [31:0] Inst;
	wire [31:0] Alu_Result;

	// Instantiate the Unit Under Test (UUT)
	SCCPU uut (
		.Clock(Clock), 
		.Resetn(Resetn), 
		.PC(PC), 
		.Inst(Inst), 
		.Alu_Result(Alu_Result)
	);

initial begin
		// Initialize Inputs
		Clock = 0;
		Resetn = 0;

		// Wait 100 ns for global reset to finish
		#50;
      Resetn = 1;
		// Add stimulus here

	end
	always begin
		#50;
		Clock = ~Clock;
   end
endmodule

