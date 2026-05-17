`timescale 1ns / 1ps

// page 124
module alu (a,b,aluc,r, z) ;
	input  [31 : 0] a , b ;
	input  [3:0]    aluc ;
	output [31: 0] r;
	output z;

	wire [31 : 0] d_and = a & b ;
	wire [31 : 0] d_or  = a | b;
	wire [31 : 0] d_xor = a ^ b;
	wire [31 : 0] d_lui = {b[15 : 0] ,16'h0};
	wire [31 : 0] d_and_or  = aluc[2]? d_or : d_and ;
	wire [31 : 0] d_xor_lui = aluc[2]? d_lui : d_xor ;

	wire [31 : 0]  d_as,d_sh;
	wire [31 : 0]  d_slt = ($signed(a) < $signed(b)) ? 32'b1 : 32'b0;
	wire [31 : 0]  d_sltu = (a < b) ? 32'b1 : 32'b0 ;
	wire [31 : 0]  d_sllv = b << (a[4:0]);
	wire [31 : 0]  d_srlv = b >> (a[4:0]);
	wire [31 : 0]  d_srav = $signed(b) >>> (a[4:0]);

	addsub32 as32 (a,b,aluc[2] , d_as) ;
	shift shifter (b ,a [4 : 0] ,aluc[2] ,aluc [3] ,d_sh );
	mux9 select ( d_as ,d_and_or, d_xor_lui ,d_sh , d_slt , d_sltu , d_sllv , d_srlv, d_srav , aluc , r);
	
	assign z = ~|r;
	
endmodule
