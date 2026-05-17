`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:57:29 11/27/2014 
// Design Name: 
// Module Name:    scd_intr 
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
module scd_intr(clk, dataout, datain, addr, we, inclk, outclk);
	input   [31:0] datain;
	input   [31:0] addr;
	input          clk , we , inclk , outclk;

	output reg [31:0] dataout;

	reg     [31:0] ram [0:31] ;
// dj : change it
/*
	assign dataout = ram[addr[6:2]];
	
	always @(posedge clk ) begin
	   if( we ) ram[addr] = datain ;
	end
*/
   wire    write_enable = we & ~clk ;
   always @(posedge outclk ) begin
	   dataout = ram[addr[6:2]] ;
	end
  
  	always @(posedge inclk ) begin
	   if( write_enable ) ram[addr[6:2]] = datain ;
	end
	
	
	integer i ;
	initial begin
		for (i = 0 ; i < 32 ; i = i + 1)
			 ram [i] = 0 ;
			 
		ram[5'h08] = 32'h00000030 ;
		ram[5'h09] = 32'h0000003c ;
		ram[5'h0a] = 32'h00000054 ;
		ram[5'h0b] = 32'h00000068 ;
		ram[5'h12] = 32'h00000002 ;
		ram[5'h13] = 32'h7fffffff ;
		ram[5'h14] = 32'h000000a3 ;
		ram[5'h15] = 32'h00000027 ;
		ram[5'h16] = 32'h00000079 ;
		ram[5'h17] = 32'h00000115 ;
		

	end
endmodule
