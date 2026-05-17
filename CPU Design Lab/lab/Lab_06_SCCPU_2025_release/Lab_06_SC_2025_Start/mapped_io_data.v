`timescale 1ns / 1ps

/*
#define MFP_LEDS_ADDR           0xBF800000
#define MFP_SWITCHES_ADDR       0xBF800004
#define MFP_BUTTONS_ADDR        0xBF800008
#define MFP_7SEGEN_ADDR         0xBF80000c
#define MFP_7SEGDIGITS_ADDR     0xBF800010
*/

module mapped_io_data(clk, dataout, datain, addr, we, inclk, outclk,
                      IO_Switch, IO_PB, IO_LED, IO_7SEGEN_N, IO_7SEG_DATA);
    input   [31:0] datain;
    input   [31:0] addr;
    input          clk , we , inclk , outclk;

	 input      [ 7 : 0] IO_Switch ;
	 input      [ 3 : 0] IO_PB ;
	 output reg [ 7 : 0] IO_LED ;
	 output     [ 7 : 0] IO_7SEGEN_N ;
	 output     [31 : 0] IO_7SEG_DATA ;

		 
    output  [31:0] dataout;

    reg     [31:0] ram [0:7] ;
    
    reg     [31:0] ram_out ;      
    wire           write_enable ; 

    assign write_enable = we & ~clk ;
    assign dataout = ram_out ;

    reg  mapped_io_enabled;
	 
	 always @(*) begin
	    if ( addr >= 32'h_BF800000 && addr <= 32'h_0xBF800010)
		     mapped_io_enabled = 1'b1;
		 else
		     mapped_io_enabled = 1'b0;
	 end

   always @(posedge outclk )
    begin
	     if (mapped_io_enabled) begin
		    case(addr[7:0])
			     8'h_04:  begin
				               ram_out <= {24'h_0, IO_Switch};
						     end
				  8'h_08:  begin
				               ram_out <= {28'h_0, IO_PB};
							  end
				  default: begin
				               ram_out <= ram[ addr[4:2] ];
							  end
			 endcase
		  end
		  else
		    ram_out <= 32'h_0;
    end

   always @(posedge inclk )
    begin
           if( write_enable & mapped_io_enabled ) begin
			      ram[addr[6:2]] <= datain ;

		         case(addr[7:0])
			         8'h_00:  begin
				                   IO_LED <= datain[7:0];
						         end
				      8'h_0C:  begin
				                   IO_7SEGEN_N <= datain[7:0];
						    	  end
				      8'h_10:  begin
				                   IO_7SEG_DATA <= datain[31:0];
						    	  end
			      endcase
			  end
    end
endmodule
