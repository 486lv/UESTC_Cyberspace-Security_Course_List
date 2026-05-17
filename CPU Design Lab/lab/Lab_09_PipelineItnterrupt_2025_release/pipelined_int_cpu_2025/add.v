`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:07:52 06/19/2014 
// Design Name: 
// Module Name:    add 
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

// page 70
module add(a, b, c, g, p, s);
	input a , b , c;
	output g,p,s;
	
	assign s = a ^ b ^ c ;
	assign g = a & b ;
	assign p = a | b ;
endmodule
