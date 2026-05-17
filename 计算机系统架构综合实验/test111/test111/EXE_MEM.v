`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:40:45 05/27/2025 
// Design Name: 
// Module Name:    EXE_MEM 
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
module EXE_MEM(clk,clrn,exe_m2reg,exe_wmem,exe_wreg,exe_rn,exe_rb,exe_alu_result,
       mem_m2reg,mem_wmem,mem_wreg,mem_rn,mem_rb,mem_alu_result
    );
	 input clk,clrn;
	 input exe_m2reg,exe_wmem,exe_wreg;
	 input [4:0] exe_rn;
	 input [31:0] exe_rb,exe_alu_result;

	 output mem_m2reg,mem_wmem,mem_wreg;
	 output [4:0] mem_rn;
	 output [31:0] mem_rb,mem_alu_result;
	 
	 reg mem_m2reg,mem_wmem,mem_wreg;
	 reg [4:0] mem_rn;
	 reg [31:0] mem_rb,mem_alu_result;
	 
	 always @ (posedge clk or negedge clrn)
		if(clrn ==0)
			begin
				mem_m2reg <= 0;
				mem_wmem <= 0;
				mem_wreg <= 0;
				mem_rn <= 0;
				mem_rb <= 0;
				mem_alu_result <= 0;
			end
		else 
			begin 
				mem_m2reg <= exe_m2reg;
				mem_wmem <= exe_wmem;
				mem_wreg <=exe_wreg;
				mem_rn <= exe_rn;
				mem_rb <= exe_rb;
				mem_alu_result <= exe_alu_result ;
			end
endmodule
