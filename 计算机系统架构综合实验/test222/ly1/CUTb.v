`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   09:13:03 06/11/2025
// Design Name:   Control_Unit
// Module Name:   F:/ck2/test222/ly1/CUTb.v
// Project Name:  ly1
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Control_Unit
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module CUTb;

	// Inputs
	reg rsrtequ;
	reg [5:0] func;
	reg [5:0] op;

	// Outputs
	wire wreg;
	wire m2reg;
	wire wmem;
	wire [2:0] aluc;
	wire regrt;
	wire aluimm;
	wire sext;
	wire [1:0] pcsource;
	wire shift;

	// Instantiate the Unit Under Test (UUT)
	Control_Unit uut (
		.rsrtequ(rsrtequ), 
		.func(func), 
		.op(op), 
		.wreg(wreg), 
		.m2reg(m2reg), 
		.wmem(wmem), 
		.aluc(aluc), 
		.regrt(regrt), 
		.aluimm(aluimm), 
		.sext(sext), 
		.pcsource(pcsource), 
		.shift(shift)
	);

	initial begin
	   clk = 0;
		clrn = 0;
		pcsource = 0;
		bpc =32'h10;
		jpc = 32'h14;

		// Wait 100 ns for global reset to finish
		#50;
		clrn = 1;//顺序运行
		#200;
		pcsource =1;//bpc
		#50;
		pcsource =2;//jpc
		#50;
		clrn = 0;//测试复位信号
		#50;
		clrn = 1;
		pcsource =3;//无效
		end
    always begin
		#50;
		clk = ~clk;
   end  
endmodule

