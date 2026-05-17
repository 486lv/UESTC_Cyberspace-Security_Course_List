`timescale 1ns / 1ps

// page 217
module pipeif(pcsource,pc,bpc,rpc,jpc,npc, pc4,ins);
	input  [31:0] pc,bpc,rpc,jpc;
	input  [1:0]  pcsource;
	output [31:0] npc , pc4,ins;
	
	mux4x32 next_pc (pc4,bpc , rpc, jpc,pcsource,npc) ;
	cla32 pc_plus4 (pc , 32'h4 , 1'b0, pc4) ;
	pipeimem iost_mem (pc , ins) ;

endmodule
