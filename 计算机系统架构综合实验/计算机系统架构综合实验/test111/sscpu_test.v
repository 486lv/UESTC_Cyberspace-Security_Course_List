`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   14:38:54 05/22/2025
// Design Name:   SCCPU
// Module Name:   D:/test/test111/sscpu_test.v
// Project Name:  test111
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

module sscpu_test;

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
		
		#20
		Resetn = 1;

		// Wait 100 ns for global reset to finish
        
		// Add stimulus here

	end
   always #10 Clock = ~Clock;   
endmodule

