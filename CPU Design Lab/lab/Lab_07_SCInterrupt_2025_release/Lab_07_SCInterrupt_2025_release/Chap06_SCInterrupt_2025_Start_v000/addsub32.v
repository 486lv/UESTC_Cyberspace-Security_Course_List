`timescale 1ns / 1ps

// page 124
module addsub32(a , b , sub , s) ;
	input [31 : 0] a , b;
	input sub ;
	output [31 : 0] s ;

	cla32 as32 (a , b^{32{sub}} , sub, s) ;

endmodule
