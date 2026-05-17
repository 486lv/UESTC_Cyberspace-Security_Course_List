`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:49:08 12/09/2014 
// Design Name: 
// Module Name:    pipelinedcpu_exc_int 
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

// page 236 - 239
module pipelinedcpu_exc_int(clock,memclock,resetn,pc, inst,ealu,malu,walu,
                                                               intr, inta);
    input clock,memclock, resetn, intr;
    output [31:0] pc, inst,ealu,malu,walu;
    output inta;
	 
	 parameter  EXC_BASE = 32'h00000008; // = base = BASE
	 
	 wire [31:0] bpc, jpc,npc, pc4,ins,pc4d, inst,da,db, imm,mmo,wdi;
	 wire [4:0] rn,ern;
	 wire [3:0] aluc;
	 wire [1:0] pcsource;
	 wire      wpcir;
	 wire      wreg, m2reg,wem, aluimm, shift, jal;
	
    wire [31:0] pcd;
	
    wire [31:0] sta, cau,epc, sta_in,cau_in,epc_in, // new for interrupt
                         stalr,epcin,epc10, cause, pc8c0r,next_pc;
    wire [1:0]  mfc0,selpc;
	
    reg [31:0] ea,eb, eimm,epc4,pce;
   reg [4:0]  ern0;
   reg [3:0]  ealuc;
   reg        ewreg0,em2reg, ewmem, ealuimm,eshift,ejal;

   reg [1:0]  emfc0; //  new
   reg      earith,ecancel, eisbr; // new
    wire [31:0] alua, alub, sa,ealu0,epc8;
    wire      zero;
	 
    reg [31:0]   malu,mb,pcm; // new: pcm
    reg [4:0]    mrn;
    reg        mwreg,mm2reg,mwmem;
    reg        misbr; // new
	 
	 wire   ewreg ;
	 
      reg [31:0]   wmo, walu;
      reg [4:0]    wrn;
      reg        wwreg, wm2reg;
		
	 
// pc
    dffe32 program_counter (next_pc, clock, resetn, wpcir,pc); // PC
// IF
    cla32 pc_plus4 (pc, 32'h4,1'b0,pc4); // PC+4
    mux4x32 nextpc (pc4,bpc,da, jpc,pcsource,npc); // Next pC


	
// pipeline registers: IF-ID
   dffe32 pc_4_r (pc4,clock,resetn,wpcir,pc4d); // PC+4 reg
   dffe32 inst_r (ins, clock, resetn,wpcir, inst); // IR
   dffe32 pcd_r ( pc, clock,resetn,wpcir, pcd); // PCD reg

// ID
   wire [31:0] qa,qb;
   wire [1:0] fwda, fwdb;
   wire [5:0] op = inst[31:26];
   wire [4:0] rs = inst[25:21];
   wire [4:0] rt =  inst[20:16];
   wire [4:0] rd = inst[15:11];
   wire [5:0] func= inst[5:0];

   assign    imm =  {{16{sext&inst[15]}},inst[15:0]};
   assign    jpc=   {pc4d[31:28],inst[25:0],2'b00};  // jump target
   regfile rf (rs,rt,wdi,wrn,wwreg, ~clock,resetn,qa,qb); // reg file
   
	wire      regrt;

   mux2x5 des_reg_no (rd, rt,regrt,rn); // destination reg
   mux4x32 operand_a (qa,ealu,malu,mmo, fwda,da); // forward A
   mux4x32 operand_b (qb,ealu, malu,mmo, fwdb, db); // forward B

   wire rsrtequ = ~|(da^db); // rsrtequ = (da ==db)
   
	cla32 br_addr (pc4d,{imm[29:0],2'b00},1'b0,bpc); // branch target

   wire [1:0] sepc;
   wire     sext,ov, exc,mtc0,wepc,wcau,wsta, isbr, arith,cancel;
   
	cu_exc_int cu (mwreg,mrn, ern, ewreg,em2reg,mm2reg, rsrtequ, func,op, rs, rt,
                               rd, rs,wreg,m2reg,wmem, aluc, regrt,aluimm,fwda, fwdb,
                               wpcir, sext,pcsource,shift, jal,intr, sta, ecancel,ov,
                               earith,eisbr,misbr, inta, selpc,exc, sepc, cause,mtc0,wepc,
                               wcau,wsta,mfc0, isbr,arith, cancel);



   dffe32 c0_Status (sta_in, clock, resetn,wsta, sta); // Status register
   dffe32 c0_Cause (cau_in, clock,resetn, wcau, cau); // Cause register
   dffe32 c0_EPC   (epc_in, clock, resetn,wepc, epc); // EPC register
   
	mux2x32 sta_mx (stalr, db,mtc0,sta_in); // mux for Status rag
   mux2x32 cau_mx (cause,db,mtc0,cau_in); // mux for Cause reg
   mux2x32 epc_mx (epcin,db,mtc0,epc_in); // mux for EPC rag
   mux2x32 sta_lr ({4'h0,sta[31:4]},{sta[27:0],4'h0},exc,stalr);
   mux4x32 epc_10 (pc,pcd,pce,pcm, sepc, epcin); // select epc source
   mux4x32 irq_pc (npc, epc,EXC_BASE, 32'h0,selpc,next_pc); // for PC
   mux4x32 fromc0 (epc8,sta, cau,epc,emfc0,pc8c0r); // for mfcO

// pipeline registers: ID-EXE

   always @(negedge resetn or posedge clock)
          if (resetn == 0) begin
                  ewreg0 <= 0;       em2reg  <= 0;         ewmem  <= 0;
                  ealuc  <= 0;       ealuimm <= 0;         ea     <= 0;
                  eb     <= 0;       eimm    <= 0;         ern0   <= 0;
                  eshift <= 0;       ejal    <= 0;         epc4   <= 0;
                  earith <= 0;       ecancel <= 0;         eisbr  <= 0;
                  emfc0  <= 0;       pce     <= 0;
          end else begin
                  ewreg0 <= wreg;     em2reg  <= m2reg;     ewmem  <= wmem;
                  ealuc  <= aluc;     ealuimm <= aluimm;      ea   <=   da;
                  eb     <= db;       eimm    <= imm;       ern0   <= rn;
                  eshift <= shift;    ejal    <= jal;       epc4   <= pc4d;
                  earith <= arith;    ecancel <=  cancel;   eisbr  <= isbr;
                  emfc0  <= mfc0;     pce     <= pcd;
          end
 // EXE
     assign    sa = {eimm[5:0],eimm[31:6]};
	 
    cla32  ret_addr (epc4,32'h4,1'b0,epc8);
    mux2x32 alu_ina (ea,sa,eshift,alua);
    mux2x32 alu_inb (eb, eimm,ealuimm,alub);
    mux2x32 save_pc8 (ealu0,pc8c0r,ejal|emfc0[1]|emfc0[0],ealu); // cO regs
   
 	 assign ern = ern0 | {5{ejal}};
    alu_ov al_unit (alua,alub, ealuc, ealu0, zero, ov);
    
	 assign   ewreg = ewreg0 & ~(ov & earith); // cancel ov inst
	 
// pipeline registers: EXE MEM

    always @(negedge resetn or posedge clock)
              if (resetn == 0) begin
                      mwreg  <= 0;       mm2reg <= 0;       mwmem  <= 0;
                      malu   <= 0;       mb     <=  0;       mrn   <= 0;
                       misbr <= 0;       pcm    <= 0;
              end else begin
                       mwreg  <= ewreg;    mm2reg <= em2reg;    mwmem  <= ewmem;
                       malu   <= ealu;     mb     <= eb;        mrn    <= ern;
                       misbr  <= eisbr;    pcm    <= pce;
              end
// MEM

		
// pipeline registers: MEM-WB


      always @ (negedge resetn or posedge clock)
              if (resetn == 0) begin
                      wwreg <= 0;       wm2reg <= 0;       wmo   <= 0;
                       walu  <= 0;       wrn   <= 0;
              end else begin
                      wwreg <= mwreg;    wm2reg <= mm2reg;    wmo   <= mmo;
                      walu  <= malu;     wrn   <= mrn;
              end
      // WB
     mux2x32 wb_stage (walu,wmo,wm2reg, wdi);		
	  
	sci_intr i_mem (pc,ins);
	scd_intr d_mem (clock,mmo,mb,malu,mwmem,memclock,memclock);
	
endmodule
