`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:58:33 06/19/2014 
// Design Name: 
// Module Name:    addsub32 
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

// page 124
module addsub32(a , b , sub , s) ;
	input [31 : 0] a , b;
	input sub ;
	output [31 : 0] s ;

	cla32 as32 (a , b^{32{sub}} , sub, s) ;

endmodule
