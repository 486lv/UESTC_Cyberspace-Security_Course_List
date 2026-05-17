`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:04:13 06/19/2014 
// Design Name: 
// Module Name:    cla32 
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

//page 72
module cla32(a ,b, ci , s , co );
	input [31 : 0] a,b;
	input ci;
	output [31:0] s;
	output co;
	wire g_out,p_out;

	cla_32 cla (a,b,ci,g_out,p_out,s);
	assign co = g_out | p_out & ci ;

endmodule
