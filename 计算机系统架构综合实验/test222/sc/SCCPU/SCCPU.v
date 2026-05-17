`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:33:59 05/14/2019 
// Design Name: 
// Module Name:    SCCPU 
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

module SCCPU(Clock, Resetn, PC, Inst, Alu_Result,stall
    );                                           
	 input Clock, Resetn;
	 output [31:0] PC, Inst, Alu_Result;
	 output stall;
	
	 
	 wire [31:0] if_inst,id_inst,exe_Alu_Result,mem_Alu_Result,wb_Alu_Result;
	 wire [1:0] pcsource;
	 wire [31:0] bpc, jpc, if_pc4,id_pc4; 
	 
	 wire [31:0] wdi, id_ra,exe_ra, id_rb,exe_rb,mem_rb, id_imm,exe_imm;
	 wire id_m2reg,exe_m2reg,mem_m2reg,wb_m2reg,id_wmem,exe_wmem,mem_wmem, id_aluimm,exe_aluimm, id_shift,exe_shift, z,id_wreg,exe_wreg,mem_wreg,wb_wreg;
	 wire [2:0] id_aluc,exe_aluc;
	 
	 wire [31:0] mem_mo,wb_mo;
	 wire [4:0] id_rn,exe_rn,mem_rn,wb_rn;
	 //
	 wire id_z;
	 wire [31:0] if_inst_org;
	 assign id_z=(id_ra==id_rb)?1'b1:1'b0;
	 assign if_inst=(pcsource==2'b01||pcsource==2'b10)?32'h0:if_inst_org;
	 //                                                                       
	 IF_STAGE stage1 (Clock, Resetn, pcsource, bpc, jpc, if_pc4, if_inst_org, PC,stall);
	                                                                                          /////////// 
	 ID_STAGE stage2 (id_pc4, id_inst, wdi, Clock, Resetn, bpc, jpc, pcsource,           
				   id_m2reg, id_wmem, id_aluc, id_aluimm, id_ra, id_rb, id_imm, id_shift, id_z,regrt,id_rn,wb_rn,id_wreg,wb_wreg);
////                                                                                         
	 EXE_STAGE stage3 (exe_aluc, exe_aluimm, exe_ra, exe_rb, exe_imm, exe_shift, exe_Alu_Result, z);
	 
	 MEM_STAGE stage4 (mem_wmem, mem_Alu_Result[6:2], mem_rb, Clock, mem_mo);		
	 
	 WB_STAGE stage5 (wb_Alu_Result, wb_mo, wb_m2reg, wdi);
	 
	 instruction_register IF_ID (if_pc4,if_inst,Clock,Resetn,id_pc4,id_inst,stall);
	 
	 wire stall1,stall2;
	 wire regrt;  
	 assign stall1 = ((id_inst[9:5] == exe_rn) | (id_inst[4:0] == exe_rn)&~regrt)&(exe_rn !=0)&exe_wreg;
	 assign stall2 = ((id_inst[9:5] == mem_rn) | (id_inst[4:0] ==mem_rn)&~regrt)&(mem_rn !=0)&mem_wreg;
	 assign stall = stall1 | stall2; 
	 wire id_wreg_stall,id_wmem_stall;
	 assign id_wreg_stall=~stall & id_wreg;
	 assign id_wmem_stall=~stall & id_wmem;
	 
	 id_exe_register ID_EXE (id_m2reg,id_wmem_stall,id_aluc,id_aluimm,id_ra,id_rb,id_imm,id_shift,id_wreg_stall,id_rn,
	 Clock,Resetn,exe_m2reg,exe_wmem,                                  
	 exe_aluc,exe_aluimm,exe_ra,exe_rb,exe_imm,exe_shift,exe_wreg,exe_rn);
	 exe_mem_register EXE_MEM (exe_Alu_Result,exe_rb,exe_wmem,exe_m2reg,exe_wreg,exe_rn,Clock,Resetn,mem_Alu_Result,mem_rb,mem_wmem,mem_m2reg,mem_wreg,mem_rn);
	 mem_wb_register MEM_WB (mem_Alu_Result,mem_m2reg,mem_wreg,mem_rn,mem_mo,Clock,Resetn,wb_Alu_Result,wb_m2reg,wb_wreg,wb_rn,wb_mo);

	 assign Inst=if_inst;
	 assign Alu_Result=exe_Alu_Result;

endmodule
