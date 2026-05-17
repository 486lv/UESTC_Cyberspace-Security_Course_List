`timescale 1ns / 1ps

// page : 40

module mux2x32(a0 , a1 , s ,y);
	input  [31:0] a0 ,a1;
	input         s ;
	output [31:0] y;

	assign y = s? a1 : a0 ;

endmodule
