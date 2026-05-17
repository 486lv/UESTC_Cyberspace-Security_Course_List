`timescale 1ns / 1ps

// dj : create according to dff(page 51) and dffe32(page 138)
module dff32(d , clk , clrn , q) ;
	input [31:0] d ;
	input clk , clrn ;
	output [31:0] q ;
	reg    [31:0] q;

	always @(negedge clrn or posedge clk)
		if (clrn == 0)
			q <= 0 ;
		else 
			q <= d ;

endmodule
