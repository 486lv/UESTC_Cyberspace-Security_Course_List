`timescale 1ns / 1ps

// page : 218 & 224
module pipeimem(a , inst) ;
	input  [31:0] a;
	output [31:0] inst;

   // dj : create it
	wire [31:0] rom[0:63] ; 
	
	assign inst = rom[ a[7:2] ] ;
	

	assign rom[6'h00] = 32'h3c010000; // % (00) main: lui $1, 0 # address of data[0] %
	assign rom[6'h01] = 32'h34240050; // % (04) ori $4, $1, 80 # address of data[0] %
	assign rom[6'h02] = 32'h0c00001b; // % (08) call: jal sum # call function %
	assign rom[6'h03] = 32'h20050004; // % (0c) dslot1: addi $5, $0, 4 # counter,DELYED SLOT(DS) %
	assign rom[6'h04] = 32'hac820000; // % (10) return: sw $2, 0($4) # store result %
	assign rom[6'h05] = 32'h8c890000; // % (14) lw $9, 0($4) # check sw %
	assign rom[6'h06] = 32'h01244022; // % (18) sub $8, $9, $4 # sub: $8 <- $9 - $4 %
	assign rom[6'h07] = 32'h20050003; // % (1c) addi $5, $0, 3 # counter %
	assign rom[6'h08] = 32'h20a5ffff; // % (20) loop2: addi $5, $5, -1 # counter - 1 %
	assign rom[6'h09] = 32'h34a8ffff; // % (24) ori $8, $5, 0xffff # zero-extend: 0000ffff %
	assign rom[6'h0A] = 32'h39085555; // % (28) xori $8, $8, 0x5555 # zero-extend: 0000aaaa %
	assign rom[6'h0B] = 32'h2009ffff; // % (2c) addi $9, $0, -1 # sign-extend: ffffffff %
	assign rom[6'h0C] = 32'h312affff; // % (30) andi $10, $9, 0xffff # zero-extend: 0000ffff %
	assign rom[6'h0D] = 32'h01493025; // % (34) or $6, $10, $9 # or: ffffffff %
	assign rom[6'h0E] = 32'h01494026; // % (38) xor $8, $10, $9 # xor: ffff0000 %
	assign rom[6'h0F] = 32'h01463824; // % (3c) and $7, $10, $6 # and: 0000ffff %
	assign rom[6'h10] = 32'h10a00003; // % (40) beq $5, $0, shift # if $5 = 0, goto shift %
	assign rom[6'h11] = 32'h00000000; // % (44) dslot2: nop # DS %
	assign rom[6'h12] = 32'h08000008; // % (48) j loop2 # jump loop2 %
	assign rom[6'h13] = 32'h00000000; // % (4c) dslot3: nop # DS %
	assign rom[6'h14] = 32'h2005ffff; // % (50) shift: addi $5, $0, -1 # $5 = ffffffff %
	assign rom[6'h15] = 32'h000543c0; // % (54) sll $8, $5, 15 # <<15 = ffff8000 %
	assign rom[6'h16] = 32'h00084400; // % (58) sll $8, $8, 16 # <<16 = 80000000 %
	assign rom[6'h17] = 32'h00084403; // % (5c) sra $8, $8, 16 # >>16 = ffff8000 (arith) %
	assign rom[6'h18] = 32'h000843c2; // % (60) srl $8, $8, 15 # >>15 = 0001ffff (logic) %
	assign rom[6'h19] = 32'h08000019; // % (64) finish: j finish # dead loop %
	assign rom[6'h1A] = 32'h00000000; // % (68) dslot4: nop # DS %
	assign rom[6'h1B] = 32'h00004020; // % (6c) sum: add $8, $0, $0 # sum function entry %
	assign rom[6'h1C] = 32'h8c890000; // % (70) loop: lw $9, 0($4) # load data %
	assign rom[6'h1D] = 32'h01094020; // % (74) add $8, $8, $9 # sum, PIPELINE STALLS %
	assign rom[6'h1E] = 32'h20a5ffff; // % (78) addi $5, $5, -1 # counter - 1 %
	assign rom[6'h1F] = 32'h14a0fffc; // % (7c) bne $5, $0, loop # finish? %
	assign rom[6'h20] = 32'h20840004; // % (80) dslot5: addi $4, $4, 4 # address + 4, DS %
	assign rom[6'h21] = 32'h03e00008; // % (84) jr $ra # return %
	assign rom[6'h22] = 32'h00081000; // % (88) dslot6: sll $2, $8, 0 # move result to $v0, DS %
	
	assign rom[6'h23] = 32'h0 ;
	assign rom[6'h24] = 32'h0 ;
	assign rom[6'h25] = 32'h0 ;
	assign rom[6'h26] = 32'h0 ;
	assign rom[6'h27] = 32'h0 ;
	assign rom[6'h28] = 32'h0 ;
	assign rom[6'h29] = 32'h0 ;
	assign rom[6'h2A] = 32'h0 ;
	assign rom[6'h2B] = 32'h0 ;
	assign rom[6'h2C] = 32'h0 ;
	assign rom[6'h2D] = 32'h0 ;
	assign rom[6'h2E] = 32'h0 ;
	assign rom[6'h2F] = 32'h0 ;
	assign rom[6'h30] = 32'h0 ;
	assign rom[6'h31] = 32'h0 ;
	assign rom[6'h32] = 32'h0 ;
	assign rom[6'h33] = 32'h0 ;
	assign rom[6'h34] = 32'h0 ;
	assign rom[6'h35] = 32'h0 ;
	assign rom[6'h36] = 32'h0 ;
	assign rom[6'h37] = 32'h0 ;
	assign rom[6'h38] = 32'h0 ;
	assign rom[6'h39] = 32'h0 ;
	assign rom[6'h3A] = 32'h0 ;
	assign rom[6'h3B] = 32'h0 ;
	assign rom[6'h3C] = 32'h0 ;
	assign rom[6'h3D] = 32'h0 ;
	assign rom[6'h3E] = 32'h0 ;
	assign rom[6'h3F] = 32'hffff_ffff ; // dj : use it so that there is no warining that q[30],q[20] is fixed to zero ;
	
endmodule

/*
DEPTH = 64; % Memory depth and width are required %
WIDTH = 32; % Enter a decimal number %
ADDRESS_RADIX = HEX; % Address and value radixes are optional %
DATA_RADIX = HEX; % Enter BIN, DEC, HEX, or OCT; unless %
% otherwise specified, radixes = HEX %
CONTENT
BEGIN
[0..1F] : 00000000; % Range--Every address from 0 to 1F = 00000000 %
0 : 3c010000; % (00) main: lui $1, 0 # address of data[0] %
1 : 34240050; % (04) ori $4, $1, 80 # address of data[0] %
2 : 0c00001b; % (08) call: jal sum # call function %
3 : 20050004; % (0c) dslot1: addi $5, $0, 4 # counter,DELYED SLOT(DS) %
4 : ac820000; % (10) return: sw $2, 0($4) # store result %
5 : 8c890000; % (14) lw $9, 0($4) # check sw %
6 : 01244022; % (18) sub $8, $9, $4 # sub: $8 <- $9 - $4 %
7 : 20050003; % (1c) addi $5, $0, 3 # counter %
8 : 20a5ffff; % (20) loop2: addi $5, $5, -1 # counter - 1 %
9 : 34a8ffff; % (24) ori $8, $5, 0xffff # zero-extend: 0000ffff %
A : 39085555; % (28) xori $8, $8, 0x5555 # zero-extend: 0000aaaa %
B : 2009ffff; % (2c) addi $9, $0, -1 # sign-extend: ffffffff %
C : 312affff; % (30) andi $10, $9, 0xffff # zero-extend: 0000ffff %
D : 01493025; % (34) or $6, $10, $9 # or: ffffffff %
E : 01494026; % (38) xor $8, $10, $9 # xor: ffff0000 %
F : 01463824; % (3c) and $7, $10, $6 # and: 0000ffff %
10 : 10a00003; % (40) beq $5, $0, shift # if $5 = 0, goto shift %
11 : 00000000; % (44) dslot2: nop # DS %
12 : 08000008; % (48) j loop2 # jump loop2 %
13 : 00000000; % (4c) dslot3: nop # DS %
14 : 2005ffff; % (50) shift: addi $5, $0, -1 # $5 = ffffffff %
15 : 000543c0; % (54) sll $8, $5, 15 # <<15 = ffff8000 %
16 : 00084400; % (58) sll $8, $8, 16 # <<16 = 80000000 %
17 : 00084403; % (5c) sra $8, $8, 16 # >>16 = ffff8000 (arith) %
18 : 000843c2; % (60) srl $8, $8, 15 # >>15 = 0001ffff (logic) %
19 : 08000019; % (64) finish: j finish # dead loop %
1A : 00000000; % (68) dslot4: nop # DS %
1B : 00004020; % (6c) sum: add $8, $0, $0 # sum function entry %
1C : 8c890000; % (70) loop: lw $9, 0($4) # load data %
1D : 01094020; % (74) add $8, $8, $9 # sum, PIPELINE STALLS %
1E : 20a5ffff; % (78) addi $5, $5, -1 # counter - 1 %
1F : 14a0fffc; % (7c) bne $5, $0, loop # finish? %
20 : 20840004; % (80) dslot5: addi $4, $4, 4 # address + 4, DS %
21 : 03e00008; % (84) jr $ra # return %
22 : 00081000; % (88) dslot6: sll $2, $8, 0 # move result to $v0, DS %
END ;
*/