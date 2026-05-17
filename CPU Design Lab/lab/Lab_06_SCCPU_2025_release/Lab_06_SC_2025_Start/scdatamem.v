`timescale 1ns / 1ps

// page : 155
module scdatamem(clk, dataout, datain, addr, we, inclk, outclk);
    input   [31:0] datain;
    input   [31:0] addr;
    input          clk , we , inclk , outclk;

    output  [31:0] dataout;

    reg     [31:0] ram [0:63] ;
    
    reg     [31:0] ram_out ;      
    wire           write_enable ; 

    reg  mapped_io_enabled;

	 always @(*) begin
	    if ( addr >= 32'h_BF800000 && addr <= 32'h_0xBF800010)
		     mapped_io_enabled = 1'b1;
		 else
		     mapped_io_enabled = 1'b0;
	 end
	 
// dj : add it according to page 149
   assign write_enable = we & ~clk ;
    assign dataout = ram_out ;

   always @(posedge outclk )
    begin
	    if (mapped_io_enabled == 1'b0)
          ram_out <= ram[addr[7:2]] ;
		 else
		    ram_out <= 32'b0;
    end

   always @(posedge inclk )
    begin
           if( write_enable == 1'b1 && mapped_io_enabled == 1'b0 ) ram[addr[7:2]] <= datain ;
    end
// add end
    
    integer i ;
    initial begin
        for (i = 0 ; i < 64 ; i = i + 1)
             ram [i] = 0 ;
             
        ram[5'h14] = 32'h000000a3; // (50) data[0] 0 + A3 = A3
        ram[5'h15] = 32'h00000027; // (54) data[1] A3 + 27 = CA
        ram[5'h16] = 32'h00000079; // (58) data[2] CA + 79 = 143
        ram[5'h17] = 32'h00000115; // (5c) data[3] 143 + 115 = 258
    end
    
endmodule
