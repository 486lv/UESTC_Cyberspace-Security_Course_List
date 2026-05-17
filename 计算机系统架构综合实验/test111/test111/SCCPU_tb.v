`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   15:24:10 05/28/2025
// Design Name:   SCCPU
// Module Name:   G:/test111/SCCPU_tb.v
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

module SCCPU_tb;

	// Inputs
	reg Clock;
	reg Resetn;

	// Outputs
	wire [1:0] pcsource;
	wire [31:0] PC;
	wire [31:0] if_inst;
	wire [31:0] id_inst;
	wire [31:0] exe_alu_result;
	wire [31:0] mem_alu_result;
	wire [31:0] wb_alu_result;

	// Instantiate the Unit Under Test (UUT)
	SCCPU uut (
		.Clock(Clock), 
		.Resetn(Resetn), 
		.pcsource(pcsource), 
		.PC(PC), 
		.if_inst(if_inst), 
		.id_inst(id_inst), 
		.exe_alu_result(exe_alu_result), 
		.mem_alu_result(mem_alu_result), 
		.wb_alu_result(wb_alu_result)
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

