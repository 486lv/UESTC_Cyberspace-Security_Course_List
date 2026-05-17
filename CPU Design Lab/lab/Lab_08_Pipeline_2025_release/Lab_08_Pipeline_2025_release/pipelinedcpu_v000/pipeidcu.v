`timescale 1ns / 1ps

// page 219 
module pipeidcu(mwreg, mrn, ern, ewreg, em2reg, mm2reg, rsrtequ, func, op, rs, rt, 
                wreg, m2reg, wmem, aluc, regrt, aluimm, fwda, fwdb, nostall, sext, 
					 pcsource, shift, jal);
 	input ewreg, em2reg, mwreg, mm2reg, rsrtequ;	
 	input [4:0] rs, rt, ern, mrn;
	input [5:0] op, func;
	
	output wreg, m2reg, wmem, jal, aluimm, shift, regrt, sext;	
	output [3:0] aluc;
	output [1:0] fwda, fwdb, pcsource;
	output       nostall;
	
	reg [1:0] fwda, fwdb;
 
	wire r_type = ~|op;
	wire i_add = r_type & func[5] & ~func[4] & ~func[3] & ~func[2] & ~func[1] & ~func[0];
	wire i_sub = r_type & func[5] & ~func[4] & ~func[3] & ~func[2] & func[1] & ~func[0];
	wire i_and = r_type & func[5] & ~func[4] & ~func[3] & func[2] & ~func[1] & ~func[0];
	wire i_or = r_type & func[5] & ~func[4] & ~func[3] & func[2] & ~func[1] & func[0];
	wire i_xor = r_type & func[5] & ~func[4] & ~func[3] & func[2] & func[1] & ~func[0];
	wire i_sll = r_type & ~func[5] & ~func[4] & ~func[3] & ~func[2] & ~func[1] & ~func[0];
	wire i_srl = r_type & ~func[5] & ~func[4] & ~func[3] & ~func[2] & func[1] & ~func[0];
	wire i_sra = r_type & ~func[5] & ~func[4] & ~func[3] & ~func[2] & func[1] & func[0];
	wire i_jr = r_type & ~func[5] & ~func[4] & func[3] & ~func[2] & ~func[1] & ~func[0];
	
	wire i_addi = ~op[5] & ~op[4] & op[3] & ~op[2] & ~op[1] & ~op[0];
	wire i_andi = ~op[5] & ~op[4] & op[3] & op[2] & ~op[1] & ~op[0];
	
	wire i_ori = ~op[5] & ~op[4] & op[3] & op[2] & ~op[1] & op[0];
	wire i_xori = ~op[5] & ~op[4] & op[3] & op[2] & op[1] & ~op[0];
	wire i_lw = op[5] & ~op[4] & ~op[3] & ~op[2] & op[1] & op[0];
	wire i_sw = op[5] & ~op[4] & op[3] & ~op[2] & op[1] & op[0];
	wire i_beq = ~op[5] & ~op[4] & ~op[3] & op[2] & ~op[1] & ~op[0];
	wire i_bne = ~op[5] & ~op[4] & ~op[3] & op[2] & ~op[1] & op[0];
	wire i_lui = ~op[5] & ~op[4] & op[3] & op[2] & op[1] & op[0];
	wire i_j = ~op[5] & ~op[4] & ~op[3] & ~op[2] & op[1] & ~op[0];
	wire i_jal = ~op[5] & ~op[4] & ~op[3] & ~op[2] & op[1] & op[0];
	
	wire i_rs = i_add | i_sub | i_and | i_or | i_xor | i_jr | i_addi | i_andi | i_ori | i_xori | i_lw | i_sw | i_beq | i_bne;
	wire i_rt = i_add | i_sub | i_and | i_or | i_xor | i_sll | i_srl | i_sra | i_sw | i_beq | i_bne;
	
	assign nostall = ~(ewreg & em2reg & (ern != 0) & (i_rs & (ern == rs) | i_rt & (ern == rt)));
	
	assign wreg = (i_xori | i_andi | i_ori | i_addi | i_lw | i_add | i_sub | i_xor | i_and | i_or | i_sll | i_srl | i_sra | i_lui | i_jal) & nostall;
	assign m2reg = i_lw;
	assign wmem = i_sw & nostall;
	assign jal = i_jal;
	assign aluc[3] = i_sra;
	assign aluc[2] = i_srl | i_sra | i_beq | i_bne | i_sub | i_or | i_ori | i_lui;
	assign aluc[1] = i_sll | i_xor | i_xori | i_srl | i_sra | i_lui;
	assign aluc[0] = i_and | i_andi | i_or | i_ori | i_sll | i_srl | i_sra;
	assign aluimm = i_addi | i_lw | i_sw | i_xori | i_lui | i_andi | i_ori;
	assign shift = i_sll | i_srl | i_sra;
	assign regrt = i_xori | i_andi | i_ori | i_addi | i_lui | i_lw;
	assign sext = i_beq | i_bne | i_addi | i_lw | i_sw;
	assign pcsource[1] = i_jr | i_j | i_jal;
	assign pcsource[0] = (i_bne & ~rsrtequ) | (i_beq & rsrtequ) | i_j | i_jal;


	always @ (ewreg or mwreg or ern or mrn or em2reg or mm2reg or rs or rt) begin
		fwda = 2'b00; // default forward A: no hazards
		if (ewreg & (ern != 0) & (ern == rs) & ~em2reg) begin
			fwda = 2'b01; // select exe_alu
		end else begin
			if (mwreg & (mrn != 0) & (mrn == rs) & ~mm2reg) begin
				fwda = 2'b10; // select mem_alu
			end else begin
				if (mwreg & (mrn != 0) & (mrn == rs) & mm2reg) begin
					fwda = 2'b11; // select mem_lw
				end
			end
		end
		fwdb = 2'b00; // default forward B: no hazards
		if (ewreg & (ern != 0) & (ern == rt) & ~em2reg) begin
			fwdb = 2'b01; // select exe_alu
		end else begin
			if (mwreg & (mrn != 0) & (mrn == rt) & ~mm2reg) begin
				fwdb = 2'b10; // select mem_alu
			end else begin
				if (mwreg & (mrn != 0) & (mrn == rt) & mm2reg) begin
					fwdb = 2'b11; // select mem_lw
				end
			end
		end
	end

endmodule
