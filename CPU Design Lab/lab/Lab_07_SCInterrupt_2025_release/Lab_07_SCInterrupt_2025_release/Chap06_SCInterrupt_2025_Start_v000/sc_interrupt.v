`timescale 1ns / 1ps

// page : 168
module sc_interrupt (clock,resetn,inst,pc,aluout,memout,
                     mem_clk,intr,inta);
	input clock,resetn,mem_clk,intr;
	output [31:0] inst,pc,aluout,memout;
	output inta;
	
	wire [31:0] data;
	wire wmem;
	
	sccpu_intr cpu (clock,resetn,inst,memout,pc,wmem,aluout,data,intr,inta);
	sci_intr i_mem (pc,inst);
	scd_intr d_mem (clock,memout,data,aluout,wmem,mem_clk,mem_clk);
endmodule
