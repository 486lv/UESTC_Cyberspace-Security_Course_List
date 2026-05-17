`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:09:27 05/15/2019 
// Design Name: 
// Module Name:    Inst_ROM 
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
module Inst_ROM(a,inst
    );
	 input [5:0] a;
	 output [31:0] inst;
	 wire [31:0] rom [0:63];
	


 assign rom[6'h00] = 32'h00000000; 
    assign rom[6'h01] = 32'h00100443;  // addi r2, r0, 32 ; 给r2赋初值32
    assign rom[6'h02] = 32'h28000824;  // addi r3, r0, 16 ; 给r3赋初值16
    assign rom[6'h03] = 32'h34000825;  // add r4, r2, r3 ; r4 = r2 + r3 = 48
assign rom[6'h04] = 32'h3C002000;  // beq r0, r0, 6'h8 ; 当r0等于r0时，跳转到地址6'h0C assign rom[6'h05] = 32'h00101043;  // add r4, r2, r3 ; 如果beq成立，这条指令应被废弃
assign rom[6'h06] = 32'h00101464;  // add r5, r3, r4 ; 如果beq成立，这条指令应被废弃
assign rom[6'h07] = 32'h00101885;  // add r6, r4, r5 ; 如果beq成立，这条指令应被废弃
assign rom[6'h08] = 32'h00101CA6;  // add r7, r5, r6 ;跳转目标指令
assign rom[6'h0a] = 32'h00102507;  // add r9, r8, r7 ; 正常执行指令
assign rom[6'h0a] = 32'h00102507;  // add r9, r8, r7 ; 正常执行指令
assign rom[6'h0b] = 32'h00102928;  // add r10, r9, r8 ; 正常执行指令

	 assign rom[6'h12]=32'h0;        //bne r1,r1,6'h02  
	 assign rom[6'h13]=32'h48000002;       //jump 0x0000002  无条件转移到02h处   
	 assign rom[6'h14]=32'h00000000;        
	 assign rom[6'h15]=32'h00000000;        //store r1,1(r8)
	 assign rom[6'h16]=32'h00000000;        //0011 1000 0000 0000 0000 1101 0000 0001 
	 assign rom[6'h17]=32'h00000000;        // 
	 assign rom[6'h18]=32'h00000000;        //0011 1000 0000 0000 0000 1100 0010 0111 38000c27
	 assign rom[6'h19]=32'h00000000;			 //
	 assign rom[6'h1A]=32'h00000000;        //
	 assign rom[6'h1B]=32'h00000000;        //bne r1,r1,6'h03 40000421 
	 assign rom[6'h1C]=32'h00000000;        //beq r1,r2,6'h04 3c000422
	 assign rom[6'h1D]=32'h00000000;        //beq r1,r1,6'h05 3c000421
	 assign rom[6'h1E]=32'h00000000;        //add r5,r1,r2 00101422
	 assign rom[6'h1F]=32'h00000000;        //bne r1,r2,6'h07 40000422
	 assign rom[6'h20]=32'h00000000;        //add r5,r1,r2 00101422
	 assign rom[6'h21]=32'h00000000;        //jmp 6'h01 48000001
	 assign rom[6'h22]=32'h00000000;	    //add r5,r1,r2 00101422
	 assign rom[6'h23]=32'h00000000;
	 assign rom[6'h24]=32'h00000000;
	 assign rom[6'h25]=32'h00000000;
	 assign rom[6'h26]=32'h00000000;
	 assign rom[6'h27]=32'h00000000;
	 assign rom[6'h28]=32'h00000000;
	 assign rom[6'h29]=32'h00000000;
	 assign rom[6'h2A]=32'h00000000;
	 assign rom[6'h2B]=32'h00000000;
	 assign rom[6'h2C]=32'h00000000;
	 assign rom[6'h2D]=32'h00000000;
	 assign rom[6'h2E]=32'h00000000;
	 assign rom[6'h2F]=32'h00000000;
	 assign rom[6'h30]=32'h00000000;
	 assign rom[6'h31]=32'h00000000;
	 assign rom[6'h32]=32'h00000000;
	 assign rom[6'h33]=32'h00000000;
	 assign rom[6'h34]=32'h00000000;
	 assign rom[6'h35]=32'h00000000;
	 assign rom[6'h36]=32'h00000000;
	 assign rom[6'h37]=32'h00000000;
	 assign rom[6'h38]=32'h00000000;
	 assign rom[6'h39]=32'h00000000;
	 assign rom[6'h3A]=32'h00000000;
	 assign rom[6'h3B]=32'h00000000;
	 assign rom[6'h3C]=32'h00000000;
	 assign rom[6'h3D]=32'h00000000;
	 assign rom[6'h3E]=32'h00000000;
	 assign rom[6'h3F]=32'h00000000;
	 
	 assign inst=rom[a];
endmodule
