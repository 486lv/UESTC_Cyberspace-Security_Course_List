`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:30:35 03/10/2025 
// Design Name: 
// Module Name:    top 
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
module top(
	input clk,resetn,
	output [6:0]seg,//七段数码管
	output [7:0]led//LED灯
    );
	 
	 wire [31:0]pc,inst,aluout,memout;
	 wire wmem,wreg;//控制信号
	 
	 sccpu_dataflow cpu


endmodule
