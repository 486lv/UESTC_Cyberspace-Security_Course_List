`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:56:50 03/19/2024 
// Design Name: 
// Module Name:    mapped_io_data 
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

/*
#define MFP_LEDS_ADDR           0xBF800000
#define MFP_SWITCHES_ADDR       0xBF800004
#define MFP_BUTTONS_ADDR        0xBF800008
#define MFP_7SEGEN_ADDR         0xBF80000c
#define MFP_7SEGDIGITS_ADDR     0xBF800010
#define MFP_KEYPAD_ADDR         0xBF800014
*/

module mapped_io_data(clk, resetn, dataout, datain, addr, we, 
                      IO_Switch, IO_PB, IO_LED, IO_7SEGEN_N, IO_7SEG_DATA
							 );
    input   [31:0] datain;
    input   [31:0] addr;
    input          clk , we ;
	 input          resetn;

	 input      [ 7 : 0] IO_Switch ;
	 input      [ 2 : 0] IO_PB ;

	 output reg [ 7 : 0] IO_LED ;
	 output reg [ 7 : 0] IO_7SEGEN_N ;
	 output reg [31 : 0] IO_7SEG_DATA ;

    output  [31:0] dataout;

    reg     [31:0] ram_out ;      // dj : add it for simulate altera 
    wire           write_enable ; // dj : add it for simulate altera 

    assign write_enable = we;
    assign dataout = ram_out ;

    reg  mapped_io_enabled;
/*
    initial begin
        IO_7SEGEN_N = 8'b0;
		  IO_7SEG_DATA = 32'b0;
    end
*/	 
	 always @(*) begin
	    if ( addr[31:16]== 16'h_BF80)
		     mapped_io_enabled = 1'b1;
		 else
		     mapped_io_enabled = 1'b0;
	 end

   always @(posedge clk)
   begin
	     if (mapped_io_enabled) begin
		         case(addr[7:0])
			         8'h_04:  begin
				                   ram_out <= {24'b0, IO_Switch};
						         end
				      8'h_08:  begin
				                   ram_out <= {29'b0, IO_PB};
						    	   end
				      default:  begin
				                   ram_out <= 32'h_0;
						    	  end
			      endcase
		  end
		  else
		    ram_out <= 32'h_0;
   end

   always @(posedge clk )
   begin
	    if(resetn == 0) begin
           IO_7SEGEN_N <= 8'b0;
		     IO_7SEG_DATA <= 32'b0;
		 end
		 else begin
           if( write_enable & mapped_io_enabled ) begin
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
   end
endmodule
