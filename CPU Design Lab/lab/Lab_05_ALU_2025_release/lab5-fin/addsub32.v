`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:00:49 03/03/2025 
// Design Name: 
// Module Name:    addsub32 
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
module addsub32(a,b,sub,s);

	 input[31:0] a,b;
	 input sub;
	 output reg[31:0] s;
	 
    always @* begin
		if (sub)
			begin
				s=a-b;
			end 
		else 
			begin
				s=a+b;
			end
	end	


endmodule
