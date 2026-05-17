`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   10:05:00 05/27/2025
// Design Name:   Inst_ROM
// Module Name:   D:/test111/Inst_Rom_tb.v
// Project Name:  test111
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Inst_ROM
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module Inst_Rom_tb;

	// Inputs
	reg [5:0] a;

	// Outputs
	wire [31:0] inst;

	// Instantiate the Unit Under Test (UUT)
	Inst_ROM uut (
		.a(a), 
		.inst(inst)
	);

	initial begin
		
endmodule

