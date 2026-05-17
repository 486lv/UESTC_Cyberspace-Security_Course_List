`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   20:00:17 04/04/2024
// Design Name:   pipelinedcpu_exc_int_anvyl
// Module Name:   E:/2023-2024-2/Computer_System_Design_and_Implementation/LiYaMin/Chap08_PipelinedCPU_2024_0402/pipelined_int_cpu/pipelinedcpu_exc_int_anvyl_tb.v
// Project Name:  pipelined_int_cpu
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: pipelinedcpu_exc_int_anvyl
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module pipelinedcpu_exc_int_anvyl_tb;

	// Inputs
	reg CLK100MHZ;
	reg [7:0] SW;
	reg [3:0] BTN;
	reg [3:0] KYPD_ROW;

	// Outputs
	wire [7:0] LED;
	wire [6:0] SEG;
	wire [5:0] AN;
	wire [3:0] KYPD_COL;
	wire LDT1G;
	wire LDT1Y;

	wire [31:0] pc;
	wire [31:0] pce;
	wire [31:0] inst;
	wire [31:0] ealu;
	wire [31:0] malu;
	wire [31:0] walu;
	wire        intr;
	wire inta;
	
	// Instantiate the Unit Under Test (UUT)
	pipelinedcpu_exc_int_anvyl uut (
		.CLK100MHZ(CLK100MHZ), 
		.SW(SW), 
		.BTN(BTN), 
		.LED(LED), 
		.SEG(SEG), 
		.AN(AN), 
		.KYPD_ROW(KYPD_ROW), 
		.KYPD_COL(KYPD_COL), 
		.LDT1G(LDT1G), 
		.LDT1Y(LDT1Y)
	);
	
	assign pc = uut.pc;
	assign inst = uut.inst;
	assign ealu = uut.ealu;
	assign malu = uut.malu;
	assign walu = uut.walu;
	assign inta = uut.inta;
	assign pce = uut.pce;
	assign intr = uut.intr;
	assign inta = uut.inta;
	
	initial begin
	   $monitor($time,"  pc=%h" , pc , "  inst=%h" , inst , "  pce=%h" , pce , "  ealu=%h" , ealu, "  intr=%h", intr,  "  inta=%h", inta);
	end
	
	initial begin
		// Initialize Inputs
		CLK100MHZ = 0;
		SW = 0;
		BTN = 4'b1000;
		KYPD_ROW = 4'b1110;

		// Wait 100 ns for global reset to finish
		// #100;
        
		// Add stimulus here
		
		#(1*250) ;
		BTN[3] = 0 ;
		
		#(237*250 - 500) ;
		BTN[2] = 1 ;
		
		#(4*250) ;
		BTN[2] = 0 ;
		
		#(84*250) ;
		BTN[2] = 1 ;
		
		#(4*250) ;
		BTN[2] = 0 ;
		
		#(44*250) ;
		BTN[2] = 1 ;
		
		#(4*250) ;
		BTN[2] = 0 ;
	end


   always begin
	   #5 ;
		CLK100MHZ = ~CLK100MHZ ;
	end      
endmodule

