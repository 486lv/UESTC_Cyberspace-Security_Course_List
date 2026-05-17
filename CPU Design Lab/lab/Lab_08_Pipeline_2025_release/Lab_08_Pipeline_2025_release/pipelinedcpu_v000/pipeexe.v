`timescale 1ns / 1ps

// page : 222
module pipeexe(ealuc, ealuimm, ea, eb, eimm, eshift, ern0, epc4, 
               ejal, ern, ealu);
					
	input ejal;
	input [3:0] ealuc;
	input ealuimm, eshift;
	input [31:0] epc4, ea, eb, eimm;
	input [4:0] ern0;
	output [31:0] ealu;
	output [4:0] ern;
	
	wire         z ; // dj : LiYaMin
	
	wire [31:0] epc8, alua, alub, sa, ealu0 ; // dj : r in googlecode is ealu0 in LiYaMin ;
	

	// assign sa = {27'b0, eimm[10:6]}; // dj : googlecode
	assign sa = {eimm[5:0],eimm[31:6]};
	
	// assign epc8 = epc4 + 32'h4;	// dj : googlecode
	cla32  ret_addr( epc4, 32'h4 , 1'b0 , epc8);
	
	
	mux2x32 alu_ina (ea, sa, eshift, alua);
	mux2x32 alu_inb (eb, eimm, ealuimm, alub);

	// mux2x32 save_pc8 (r, epc8, ejal, ealu);  // dj : googlecode
	mux2x32 save_pc8(ealu0 , epc8 , ejal , ealu); 
	
	assign ern = ern0 | {5{ejal}};
	
	// alu alu_unit (alua, alub, ealuc, r);  // dj : googlecode
   alu alu_unit (alua, alub, ealuc, ealu0, z );	

endmodule
