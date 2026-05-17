`timescale 1ns / 1ps

// dj : changed from mux2x32 (on page : 40)

module mux2x5(a0 , a1 , s ,y);
	input  [4:0] a0 ,a1;
	input        s ;
	output [4:0] y;

	assign y = s? a1 : a0 ;

endmodule
