`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:23:03 05/22/2025 
// Design Name: 
// Module Name:    IF_ID 
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
module IF_ID(if_pc4,if_inst,id_pc4,id_inst,clk,clrn
    );
	 input [31:0] if_pc4,if_inst;
	 input clk,clrn;
	 reg [31:0] id_pc4,id_inst;
	 always @ (posedge clk or negedge clrn)
	   if(clrn == 0)
		  begin
		    id_pc4<=0;
			 id_inst<=0;
		  end
		else
		  begin
		    id_pc4<=if_pc4;
			 id_inst<=if_inst;
		  end
endmodule
