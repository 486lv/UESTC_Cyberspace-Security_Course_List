`timescale 1ns / 1ps


// page : 223 & 225
module pipemem(we, addr,datain , clk, inclk, outclk,dataout) ;
   input [31:0] addr, datain ;
   input clk, we, inclk, outclk;
   output reg [31:0] dataout;
	
	wire write_enable = we & ~clk;
	
	reg     [31:0] ram [0:31] ;

// dj : change it
/*
	assign dataout = ram[addr[6:2]];
	
	always @(posedge clk ) begin
	   if( we ) ram[addr] = datain ;
	end
*/
   always @(posedge outclk ) begin
	   dataout = ram[addr[6:2]] ;
	end
  
  	always @(posedge inclk ) begin
	   if( write_enable ) ram[addr[6:2]] = datain ;
	end

	integer i ;
	initial begin	
		ram[6'h14] = 32'h000000a3; // (50) data[0] 0 + A3 = A3
		ram[6'h15] = 32'h00000027; // (54) data[1] A3 + 27 = CA
		ram[6'h16] = 32'h00000079; // (58) data[2] CA + 79 = 143
		ram[6'h17] = 32'h00000115; // (5c) data[3] 143 + 115 = 258	
	end

endmodule
/*
DEPTH = 32; % Memory depth and width are required %
WIDTH = 32; % Enter a decimal number %
ADDRESS_RADIX = HEX; % Address and value radixes are optional %
DATA_RADIX = HEX; % Enter BIN, DEC, HEX, or OCT; unless %
CONTENT % otherwise specified, radixes = HEX %
BEGIN
[0..1F] : 00000000; % Range--Every address from 0 to 1F = 00000000 %
0 : BF800000; % 1 01111111 00..0 fp -1 %
14 : 000000A3; % (50) data[0] %
15 : 00000027; % (54) data[1] %
16 : 00000079; % (58) data[2] %
17 : 00000115; % (5C) data[3] %
END ;
*/