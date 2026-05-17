`timescale 1ns / 1ps

// page 168-169
module sccpu_intr(clock, resetn, inst , mem, pc, wmem, alu, data, intr , inta) ;
   input [31:0] inst , mem;
   input clock, resetn , intr;
   output[31:0] pc, alu, data;
   output wmem, inta;
   parameter EXC_BASE = 32'h00000008; // = base = BASE
   wire [31:0] p4,bpc,npc,adr,ra,alua,alub,res,alu_mem;
   wire [3:0] aluc ;
   wire [4:0] reg_dest,wn ;
   wire [1:0] pcsource ;
   wire zero,wmem,wreg,regrt,m2reg,shift,aluimm,jal,sext,overflow;

	wire [31:0] jpc = {p4[31:28] , inst [25:0] , 2'b00} ;
   wire exc , wsta , wcau , wepc , mtc0 ;
   wire [31:0] sta , cau , epc , sta_in , cau_in , epc_in ,
            sta_l1_a0 , epc_l1_a0 ,  cause , alu_mem_c0 , next_pc;
   wire [1:0] mfc0 , selpc;	
	wire   [31:0] sa= { 27'b0 , inst[10:6] } ;
	wire   [31:0] offset = {imm[13:0] ,inst[15:0] , 2'b00};

	sccu_intr cu (inst[31:26] , inst[25:21] , inst[15:11] , inst[5:0] , zero , wmem ,
	      wreg , regrt ,	m2reg , aluc , shift , aluimm , pcsource , jal , sext ,
			intr , inta , overflow , sta , cause , exc , wsta , wcau , wepc , mtc0 , mfc0 , selpc ) ;
	wire          e = sext & inst [ 15 ];
	wire   [15:0] imm = {16{e}} ;
	wire   [31:0] immediate = {imm, inst[15:0] } ;

	dff32 ip (next_pc, clock , resetn , pc) ;
	cla32 pcplus4(pc , 32'h4 , 1'b0 , p4) ;
	cla32 br_adr(p4, offset , 1'b0 , adr ) ;

	mux2x32 alu_b (data , immediate , aluimm, alub) ;
	mux2x32 alu_a (ra , sa , shift , alua) ;
	mux2x32 result (alu , mem, m2reg , alu_mem) ;
	mux2x32 link (alu_mem_c0, p4 , jal , res) ;
	mux2x5  reg_wn (inst[15:11], inst[20:16], regrt , reg_dest);

	assign wn = reg_dest | {5{jal}};

	mux4x32 nextpc (p4 , adr, ra , jpc , pcsource , npc) ;
	regfile rf(inst[25:21], inst[20:16] ,res , wn , wreg, clock , resetn ,
					ra , data ) ;
	alu_ov     al_unit (alua ,alub, aluc , alu ,zero , overflow ) ;
	


   dffe32 c0_Status (sta_in, clock, resetn, wsta , sta ) ; // Status register
   dffe32 c0_Cause  (cau_in, clock, resetn, wcau , cau ) ; // cause register
   dffe32 c0_EPC    (epc_in, clock, resetn, wepc , epc) ; // EPC register


   mux2x32 sta_l1 (sta_l1_a0, data , mtc0, sta_in) ; // for Status
   mux2x32 sta_l2 ({4'h0, sta[31:4]} , {sta [27:0] , 4'h0} , exc , sta_l1_a0);

   mux2x32 cau_l1 (cause, data , mtc0 , cau_in); // for Cause
   mux2x32 epc_l1 (epc_l1_a0, data , mtc0 , epc_in) ;
   mux2x32 epc_l2 (pc , npc , inta, epc_l1_a0) ;
   mux4x32 irq_pc (npc , epc, EXC_BASE, 32'h0, selpc, next_pc ) ;
   mux4x32 fromc0 (alu_mem , sta , cau , epc , mfc0 , alu_mem_c0) ;
	
endmodule
