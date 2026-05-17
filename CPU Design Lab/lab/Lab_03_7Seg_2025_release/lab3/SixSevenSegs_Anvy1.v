`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:26:24 03/03/2025 
// Design Name: 
// Module Name:    SixSevenSegs_Anvy1 
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
module SixSevenSegs_Anvyl(
	input Clock,
	input [5:0] Switch,
	output [5:0] En ,
	output [7:0] Segs );
	wire divided_clock;
	wire [23:0] data ;
	assign data = 24'h543210 ;
	ClockDivider M1_ClockDivider(.Reset(1'b0),
	.Clock(Clock), .DividedClock(divided_clock));
	SevenSegsController M2_SevenSegsController(
	.Reset(1'b0), .Clock(divided_clock),
	.DisplayEnables(Switch),
	.Data(data), .SevenSegsAndPoint(Segs), .ShowOneofSix(En));
endmodule
