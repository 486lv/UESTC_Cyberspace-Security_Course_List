`timescale 1ns / 1ps
/*
#define MFP_LEDS_ADDR           0xBF800000
#define MFP_SWITCHES_ADDR       0xBF800004
#define MFP_BUTTONS_ADDR        0xBF800008
#define MFP_7SEGEN_ADDR         0xBF80000c
#define MFP_7SEGDIGITS_ADDR     0xBF800010
*/
// page : 143 
module sccomp_dataflow(clock , resetn , inst , pc , aluout , memout ,mem_clk) ;
	input         clock ,resetn ,mem_clk ;
	output [31:0] inst,pc,aluout,memout;
	
	wire   [31:0] data ;
	wire          wmem;
	
	sccpu_dataflow s(clock, resetn , inst , memout , pc , wmem, aluout, data) ;
	scinstmem imem (pc , inst) ;
	scdatamem dmem (clock, memout, data , aluout ,wmem, mem_clk, mem_clk ) ;

endmodule
