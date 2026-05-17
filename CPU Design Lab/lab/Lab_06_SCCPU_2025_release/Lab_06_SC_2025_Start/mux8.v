`timescale 1ns / 1ps

// page 40
module mux9(a0, a1, a2 , a3 , a4 , a5 , a6 , a7 , a8 , s, y);
	input [31:0]  a0, a1, a2 , a3 , a4 , a5 , a6 , a7  , a8;
	input [3:0] s ;
	output [31:0] y;

	function [31:0] select ;
		input [31:0] a0, a1, a2 , a3 , a4 , a5 , a6 , a7 , a8;
		input [3:0] s ;
		case ( s )
			4'b0000 : select = a0;
         4'b0100 : select = a0;
         4'b1000 : select = a0;
			4'b0001 : select = a1 ;
         4'b0101 : select = a1 ;
         4'b1101 : select = a1 ;
         4'b0010 : select = a2 ;
         4'b0110 : select = a2 ;
         4'b1110 : select = a2 ;
			4'b0011 : select = a3 ;
         4'b0111 : select = a3 ;
         4'b1001 : select = a4 ;
         4'b1010 : select = a5 ;
         4'b1011 : select = a6 ;
			4'b1100 : select = a7 ;
			4'b1111 : select = a8 ;
		endcase
	endfunction

	assign y = select(a0, a1, a2 , a3 , a4 , a5 , a6 , a7 , a8 , s) ;

endmodule
