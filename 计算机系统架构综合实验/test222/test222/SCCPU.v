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
module SCCPU(Clock, Resetn, pcsource, PC, if_inst, id_inst, exe_alu_result, mem_alu_result, wb_alu_result,stall,bpc,jpc);
    input Clock, Resetn;
    output [1:0] pcsource;
    output [31:0] PC,if_inst, id_inst;
    output [31:0] exe_alu_result, mem_alu_result, wb_alu_result;
	 output stall;
	 output [31:0] bpc,jpc;//实验4：输出bpc，jpc地址
    // 全局信号
    wire z;
    wire [1:0] pcsource;
    wire [31:0] bpc, jpc, wdi; // IF_STAGE
	 
    wire [31:0] if_pc4, if_inst; 
	 wire [31:0] if_inst_org;
		 // ID_STAGE
    wire id_m2reg, id_wmem, id_wreg, id_aluimm, id_shift;
    wire [2:0] id_aluc;
    wire [4:0] id_rn;
    wire [31:0] id_pc4, id_inst;	 
    wire [31:0] id_ra, id_rb, id_imm; // EXE_STAGE
	 wire id_z;
    wire exe_m2reg, exe_wmem, exe_wreg, exe_aluimm, exe_shift;
    wire [2:0] exe_aluc;
    wire [4:0] exe_rn;
    wire [31:0] exe_ra, exe_rb, exe_imm, exe_alu_result; // MEM_STAGE
    wire mem_m2reg, mem_wmem, mem_wreg;
    wire [4:0] mem_rn;
    wire [31:0] mem_rb, mem_alu_result, mem_mo; // WB_STAGE
    wire wb_m2reg, wb_wreg;
    wire [4:0] wb_rn;
    wire [31:0] wb_rb, wb_alu_result, wb_mo;
	 
	 wire id_wmem_org,id_wreg_org;
	 wire i_addi,i_andi,i_ori,i_xori,i_lw;
	 wire regrt,stall1,stall2,stall;
	 wire [4:0] id_Rs,id_Rt;
	 
	assign stall1 =((id_Rs == exe_rn)| (id_Rt == exe_rn)&~regrt) &(exe_rn!=0)&exe_wreg;
	assign stall2 =((id_Rs == mem_rn)|(id_Rt == mem_rn) &~regrt) &(mem_rn!=0)&mem_wreg;
	assign stall = stall1|stall2;//流水线暂停信号
	assign id_wreg = ~stall &id_wreg_org;//id级最终写数据存储器使能信号;
	assign id_wmem = ~stall &id_wmem_org;//id级最终写寄存器堆使能信号;
	
	assign if_inst=(pcsource==2'b01||pcsource==2'b10)?32'h0:if_inst_org;
	assign id_z=(id_ra==id_rb)?1'b1:1'b0;


    // IF_STAGE
    IF_STAGE stage1(Clock, Resetn, pcsource, bpc, jpc, if_pc4, if_inst_org, PC);

    IF_ID if_id_reg(if_pc4, if_inst, Clock, Resetn, id_pc4, id_inst);

    // ID_STAGE
    ID_STAGE stage2(id_pc4, id_inst, wdi, wb_rn, wb_wreg, ~Clock, Resetn, bpc, jpc, pcsource,
                    id_m2reg, id_wmem_org, id_aluc, id_aluimm, id_rn, id_ra, id_rb, id_imm, id_shift, id_wreg_org, id_z,id_Rs,id_Rt,regrt);

    ID_EXE id_exe_reg(Clock, Resetn, id_m2reg, id_wmem, id_aluimm, id_shift, id_wreg,
                               id_aluc, id_rn, id_ra, id_rb, id_imm,
                               exe_m2reg, exe_wmem, exe_aluimm, exe_shift, exe_wreg, exe_aluc, exe_rn, exe_ra, exe_rb, exe_imm);
    // EXE_STAGE
    EXE_STAGE stage3(exe_aluc, exe_aluimm, exe_ra, exe_rb, exe_imm, exe_shift, exe_alu_result, z);

    EXE_MEM exe_mem_reg(Clock, Resetn, exe_m2reg, exe_wmem, exe_wreg, exe_rn, exe_rb,
                                 exe_alu_result, mem_m2reg, mem_wmem, mem_wreg, mem_rn, mem_rb, mem_alu_result);

    // MEM_STAGE
    MEM_STAGE stage4(mem_wmem, mem_alu_result[4:0], mem_rb, Clock, mem_mo);

    MEM_WB mem_wb_reg(Clock, Resetn, mem_m2reg, mem_wreg, mem_rn, mem_mo, mem_alu_result,
                               wb_m2reg, wb_wreg, wb_rn, wb_mo, wb_alu_result);

    // WB_STAGE
    WB_STAGE stage5(wb_alu_result, wb_mo, wb_m2reg, wdi);

endmodule