`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   10:10:05 06/11/2025
// Design Name:   IF_STAGE
// Module Name:   F:/ck2/test222/ly1/If_tb.v
// Project Name:  ly1
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: IF_STAGE
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module If_tb;

	// Inputs
	reg clk;
	reg clrn;
	reg [1:0] pcsource;
	reg [31:0] bpc;
	reg [31:0] jpc;

	// Outputs
	wire [31:0] pc4;
	wire [31:0] inst;
	wire [31:0] PC;

	// Instantiate the Unit Under Test (UUT)
	IF_STAGE uut (
		.clk(clk), 
		.clrn(clrn), 
		.pcsource(pcsource), 
		.bpc(bpc), 
		.jpc(jpc), 
		.pc4(pc4), 
		.inst(inst), 
		.PC(PC)
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

