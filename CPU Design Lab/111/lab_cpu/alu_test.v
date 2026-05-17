`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   14:37:59 06/19/2025
// Design Name:   alu
// Module Name:   F:/lab/111/lab_cpu/alu_test.v
// Project Name:  lab_cpu
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: alu
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module alu_test;

	// Inputs
	reg [31:0] a;
	reg [31:0] b;
	reg [3:0] aluc;

	// Outputs
	wire [31:0] r;
	wire z;

	// Instantiate the Unit Under Test (UUT)
	alu uut (
		.a(a), 
		.b(b), 
		.aluc(aluc), 
		.r(r), 
		.z(z)
	);

	initial begin
		// Initialize Inputs
		aluc = 4'b0000 ;
		a = 32'h0000_0001 ;
		b = 32'h0000_0002 ;
		
		#10;
		aluc = 4'b0100 ;
		
		#10 ;
		aluc = 4'b0001 ;
		a = 32'hCCCC_CCCC ;
		b = 32'hAAAA_AAAA ;
		
		#10 ;
		aluc = 4'b0101 ;
		
		#10;
		aluc = 4'b0010 ;
		a = 32'h3333_3333 ;
		b = 32'hFF00_5555 ;
		
		#10 ;
		aluc = 4'b0110 ;
		
		#10 ;
		aluc = 4'b0011 ;
		a = 32'h0000_000F ;
		b = 32'hFFFF_FFFF ;
		
		#10 ;
		aluc = 4'b0111 ;
		
		#10 ;
		aluc = 4'b1111 ;
		a = 32'h0000_0010 ;
		b = 32'h7F00_0000 ;
		
		#10 ;
		b = 32'hFF00_0000 ;

	end
      
endmodule

