`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:35:17 04/04/2024 
// Design Name: 
// Module Name:    pipelinedcpu_exc_int_anvyl 
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
module pipelinedcpu_exc_int_anvyl(CLK100MHZ, SW, BTN, LED, SEG, AN, KYPD_ROW, KYPD_COL, LDT1G, LDT1Y) ;
   input         CLK100MHZ;

	input  [7:0]  SW;
	input  [3:0]  BTN;
	output [7:0]  LED;
	output [6:0]  SEG;
	output [5:0]  AN;

	input  [3:0]  KYPD_ROW;
	output [3:0]  KYPD_COL;
	output        LDT1G, LDT1Y;
	
	wire          intr;

	reg  [31:0]   memout;

	wire   [31:0] mapped_io_out;
	wire   [31:0] real_data_mem_out;
	
	wire   [ 7 : 0] IO_7SEGEN_N ;
	wire   [31 : 0] IO_7SEG_DATA ;	

   wire [7:0]  keypad_data ;	
	
    wire clock,mem_clk, resetn;
    wire [31:0] pc, inst,ealu;
    wire inta;
	 
	 parameter  EXC_BASE = 32'h00000008; // = base = BASE
	 
	 wire [31:0] bpc, jpc,npc, pc4,ins,pc4d, da,db, imm, wdi;
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
		
	assign clock = CLK100MHZ;
	assign resetn = ~BTN[3];
	assign intr = BTN[2];
	
	assign LDT1Y = intr;
	assign LDT1G = inta;
	
   clock_generator clock_generator_0(
	                .Clock_100M(clock),
						 .Clock_1M(cpu_clock),
						 .Clock_2M(mem_clk) );
	
	wire divided_clock;
	ClockDivider M1_ClockDivider(.Reset(1'b0), .Clock(CLK100MHZ), .DividedClock(divided_clock));		
   
   wire [7:0] SevenSegsAndPoint;
   assign SEG = SevenSegsAndPoint[6:0];
	
	SevenSegsController M2_SevenSegsController(
	          .Reset(1'b0),
				 .Clock(divided_clock),
				 .DisplayEnables(~IO_7SEGEN_N[5:0]),
				 .Data(IO_7SEG_DATA[23:0]),
				 .SevenSegsAndPoint(SevenSegsAndPoint),
				 .ShowOneofSix(AN));						 

	Keypad              Keypad_Device(
	     .Reset_N      ( resetn      ) , 
		  .Clock        ( divided_clock    ) ,
		  .Row          ( KYPD_ROW     ) ,
		  .Col          ( KYPD_COL     ) , 
        .KeypadData	 ( keypad_data  ) 
   )    ;

	 
// pc
    dffe32 program_counter (next_pc, cpu_clock, resetn, wpcir,pc); // PC
// IF
    // cla32 pc_plus4 (pc, 32'h4,1'b0,pc4); // PC+4
	 assign pc4 = pc + 32'h4;
	 
    mux4x32 nextpc (pc4,bpc,da, jpc,pcsource,npc); // Next pC


	
// pipeline registers: IF-ID
   dffe32 pc_4_r (pc4,cpu_clock,resetn,wpcir,pc4d); // PC+4 reg
   dffe32 inst_r (ins, cpu_clock, resetn,wpcir, inst); // IR
   dffe32 pcd_r ( pc, cpu_clock,resetn,wpcir, pcd); // PCD reg

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
   regfile rf (rs,rt,wdi,wrn,wwreg, ~cpu_clock,resetn,qa,qb); // reg file
   
	wire      regrt;

   mux2x5 des_reg_no (rd, rt,regrt,rn); // destination reg
   mux4x32 operand_a (qa,ealu,malu,memout, fwda,da); // forward A
   mux4x32 operand_b (qb,ealu, malu,memout, fwdb, db); // forward B

   wire rsrtequ = ~|(da^db); // rsrtequ = (da ==db)
   
	// cla32 br_addr (pc4d,{imm[29:0],2'b00},1'b0,bpc); // branch target
	assign bpc = pc4d + {imm[29:0],2'b00};

   wire [1:0] sepc;
   wire     sext,ov, exc,mtc0,wepc,wcau,wsta, isbr, arith,cancel;
   
	cu_exc_int cu (mwreg,mrn, ern, ewreg,em2reg,mm2reg, rsrtequ, func,op, rs, rt,
                               rd, rs,wreg,m2reg,wmem, aluc, regrt,aluimm,fwda, fwdb,
                               wpcir, sext,pcsource,shift, jal,intr, sta, ecancel,ov,
                               earith,eisbr,misbr, inta, selpc,exc, sepc, cause,mtc0,wepc,
                               wcau,wsta,mfc0, isbr,arith, cancel);



   dffe32 c0_Status (sta_in, cpu_clock, resetn,wsta, sta); // Status register
   dffe32 c0_Cause (cau_in, cpu_clock,resetn, wcau, cau); // Cause register
   dffe32 c0_EPC   (epc_in, cpu_clock, resetn,wepc, epc); // EPC register
   
	mux2x32 sta_mx (stalr, db,mtc0,sta_in); // mux for Status rag
   mux2x32 cau_mx (cause,db,mtc0,cau_in); // mux for Cause reg
   mux2x32 epc_mx (epcin,db,mtc0,epc_in); // mux for EPC rag
   mux2x32 sta_lr ({4'h0,sta[31:4]},{sta[27:0],4'h0},exc,stalr);
   mux4x32 epc_10 (pc,pcd,pce,pcm, sepc, epcin); // select epc source
   mux4x32 irq_pc (npc, epc,EXC_BASE, 32'h0,selpc,next_pc); // for PC
   mux4x32 fromc0 (epc8,sta, cau,epc,emfc0,pc8c0r); // for mfcO

// pipeline registers: ID-EXE

   always @(negedge resetn or posedge cpu_clock)
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
     // assign    sa = {eimm[5:0],eimm[31:6]};
	  assign    sa = {27'b0, eimm[10:6]};
	 
    // cla32  ret_addr (epc4,32'h4,1'b0,epc8);
	 assign epc8 = epc4 + 32'h4;
	 
    mux2x32 alu_ina (ea,sa,eshift,alua);
    mux2x32 alu_inb (eb, eimm,ealuimm,alub);
    mux2x32 save_pc8 (ealu0,pc8c0r,ejal|emfc0[1]|emfc0[0],ealu); // cO regs
   
 	 assign ern = ern0 | {5{ejal}};
    // alu_ov al_unit (alua,alub, ealuc, ealu0, zero, ov);
	 alu_overflow al_unit(alua,alub, ealuc, ealu0, zero, ov); 
    
	 assign   ewreg = ewreg0 & ~(ov & earith); // cancel ov inst
	 
// pipeline registers: EXE MEM

    always @(negedge resetn or posedge cpu_clock)
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


      always @ (negedge resetn or posedge cpu_clock)
              if (resetn == 0) begin
                      wwreg <= 0;       wm2reg <= 0;       wmo   <= 0;
                       walu  <= 0;       wrn   <= 0;
              end else begin
                      wwreg <= mwreg;    wm2reg <= mm2reg;    wmo   <= memout;
                      walu  <= malu;     wrn   <= mrn;
              end
      // WB
     mux2x32 wb_stage (walu,wmo,wm2reg, wdi);		
	  
	sci_intr i_mem (pc,ins);
	
	// scd_intr d_mem (clock,memout,mb,malu,mwmem,mem_clock,mem_clock);
	pipeline_int_datamem d_mem (
	  .we(mwmem),
	  .addr(malu),
	  .datain(mb),
	  .clk(cpu_clock),
	  .inclk(mem_clk),
	  .outclk(mem_clk),
	  .dataout(real_data_mem_out)
	);

	always @(*) begin
	    if(malu[31:16]== 16'hBF80)
		     if(malu[4:0] == 5'b1_0100)
			      memout = {24'b0, keypad_data};
			  else
		         memout = mapped_io_out;
		 else 
		     memout = real_data_mem_out;
	end
	
   mapped_io_data mapped_io_mem(
	                .clk(clock),
						 .resetn(resetn),
						 .dataout(mapped_io_out),
						 .datain(mb), 
						 .addr(malu),
						 .we(mwmem),
                   .IO_Switch(SW),
						 .IO_PB(BTN[2:0]),
						 .IO_LED(LED),
						 .IO_7SEGEN_N(IO_7SEGEN_N), 
						 .IO_7SEG_DATA(IO_7SEG_DATA));		
endmodule
