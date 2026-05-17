`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:06:18 06/19/2014 
// Design Name: 
// Module Name:    mux2x32 
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

// page : 40

module mux2x32(a0 , a1 , s ,y);
	input  [31:0] a0 ,a1;
	input         s ;
	output [31:0] y;

	assign y = s? a1 : a0 ;

endmodule
