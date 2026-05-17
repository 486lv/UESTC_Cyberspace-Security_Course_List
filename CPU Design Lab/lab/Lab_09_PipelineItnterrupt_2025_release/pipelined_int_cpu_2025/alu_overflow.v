`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:48:44 06/19/2014 
// Design Name: 
// Module Name:    alu 
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


module alu_overflow (a,b,aluc,r, z, v) ;
	input  [31 : 0] a , b ;
	input  [3:0]    aluc ;
	output [31: 0] r;
	output z, v;

   reg [31:0] alu_result;
	
   always @(*) begin
	   case(aluc)
		    4'b0000,
			 4'b1000:
			     alu_result = a + b;
			 4'b0100,
			 4'b1100:
			     alu_result = a - b;
			 4'b0001,
			 4'b1001:
			     alu_result = a & b;
			 4'b0101,
			 4'b1101:
			     alu_result = a | b;
			 4'b0010,
			 4'b1010:
			     alu_result = a ^ b;
			 4'b0110,
			 4'b1110:
			     alu_result = {b[15:0], 16'h0};
			 4'b0011:
			     alu_result = b << a;
			 4'b0111:
			     alu_result = b >> a;
			 4'b1111:
			     alu_result = $signed(b) >>> a;
		    default:
  			     alu_result = 32'b_z;
		endcase
	end
   assign r = alu_result;
   assign z = ~|alu_result;
	assign v = ~aluc[2] & ~a[31] & ~b[31] &  r[31] & ~aluc[1] & ~aluc[0] | 
	           ~aluc[2] &  a[31] &  b[31] & ~r[31] & ~aluc[1] & ~aluc[0] | 
				   aluc[2] & ~a[31] &  b[31] &  r[31] & ~aluc[1] & ~aluc[0] | 
					aluc[2] &  a[31] & ~b[31] & ~r[31] & ~aluc[1] & ~aluc[0] ;    
endmodule
