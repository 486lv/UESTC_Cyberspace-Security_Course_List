`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:25:15 03/03/2025 
// Design Name: 
// Module Name:    OneSevenSegs_anvy1 
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
module OneSevenSegs_Anvyl(
	input [3:0] Switch ,
	input Btn0 ,
	output [6:0] Segs ,
	output En );
	assign En = ~Btn0 ; // Btn0 means for Disable
	SevenSegs M1_SevenSegs( .Digit(Switch) ,
	.EnableSegs(En) , .Seg(Segs) );
endmodule
