`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:51:24 06/19/2014 
// Design Name: 
// Module Name:    dffe32 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////

// page 138
module dffe32(d , clk , clrn , e, q) ;
	input [31:0] d ;
	input clk , clrn , e ;
	output [31:0] q ;
	reg    [31:0] q;

	always @(negedge clrn or posedge clk)
		if (clrn == 0) begin
			q <= 0 ;
		end else begin
			if (e) q <= d ;
		end

   // DJ : ADD IT
	initial begin
	   q = 0 ;
	end;
endmodule
