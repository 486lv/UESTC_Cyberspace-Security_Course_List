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
	 
   assign rom[6'h00] = 32'h1410000A;  // beq r0, r0, 6'h0A ; 当r0等于r0时，跳转到地址6'h0A
assign rom[6'h01] = 32'h0C102020;  // add r4, r2, r3 ; 如果beq成立，这条指令应被废弃
assign rom[6'h02] = 32'h0C112021;  // add r5, r3, r4 ; 如果beq成立，这条指令应被废弃
assign rom[6'h03] = 32'h0C122022;  // add r6, r4, r5 ; 如果beq成立，这条指令应被废弃
assign rom[6'h04] = 32'h0C132023;  // add r7, r5, r6 ; 如果beq成立，这条指令应被废弃
assign rom[6'h05] = 32'h0C142024;  // add r8, r6, r7 ; 如果beq成立，这条指令应被废弃
assign rom[6'h06] = 32'h0C152025;  // add r9, r7, r8 ; 如果beq成立，这条指令应被废弃
assign rom[6'h07] = 32'h0C162026;  // add r10, r8, r9 ; 如果beq成立，这条指令应被废弃
assign rom[6'h08] = 32'h0C172027;  // add r11, r9, r10 ; 如果beq成立，这条指令应被废弃
assign rom[6'h09] = 32'h0C182028;  // add r12, r10, r11 ; 如果beq成立，这条指令应被废弃
assign rom[6'h0A] = 32'h0C192029;  // add r13, r11, r12 ; 跳转目标指令
assign rom[6'h0B] = 32'h0C1A202A;  // add r14, r12, r13 ; 正常执行指令
assign rom[6'h0C] = 32'h0C1B202B;  // add r15, r13, r14 ; 正常执行指令
assign rom[6'h0D] = 32'h10100005;  // bne r0, r0, 6'h05 ; 当r0不等于r0时，跳转到地址6'h05（永远不会成立）
assign rom[6'h0E] = 32'h0C1C202C;  // add r16, r14, r15 ; 正常执行指令
assign rom[6'h0F] = 32'h0FF00000;  // j 6'h00 ; 无条件跳转回地址6'h00
	 assign rom[6'h10]=32'h00000000;        //andi r7,r8,0xfff0  
	 assign rom[6'h11]=32'h00000000;       //xori r7,r9,0x00ff  
	 assign rom[6'h12]=32'h00000000;        //bne r1,r1,6'h02  
	 assign rom[6'h13]=32'h00000000;       //jump 0x0000001  无条件转移到01h处   

	 assign rom[6'h14]=32'h00000000;        
	 assign rom[6'h15]=32'h00000000;          
	 assign rom[6'h16]=32'h00000000;        
	 assign rom[6'h17]=32'h00000000;
	 assign rom[6'h18]=32'h00000000;
	 assign rom[6'h19]=32'h00000000;
	 assign rom[6'h1A]=32'h00000000;
	 assign rom[6'h1B]=32'h00000000;
	 assign rom[6'h1C]=32'h00000000;
	 assign rom[6'h1D]=32'h00000000;
	 assign rom[6'h1E]=32'h00000000;
	 assign rom[6'h1F]=32'h00000000;
	 assign rom[6'h20]=32'h00000000;
	 assign rom[6'h21]=32'h00000000;
	 assign rom[6'h22]=32'h00000000;	 
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
