`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:26:37 11/01/2019 
// Design Name: 
// Module Name:    Keypad 
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
module Keypad(
       input            Reset_N , 
       input            Clock , 
		 input  [3:0]     Row ,
		 output [3:0]     Col , 
       output reg [7:0] KeypadData		 
		 
    );
	
	reg [1:0] col_cnt ;
	wire [3:0]   kypd_col_t;
	 
   always @(posedge Clock)
      
      begin
         if (Reset_N == 1'b0)
            col_cnt <= {2{1'b0}};
         else
            col_cnt <= col_cnt + 1;
      end	
		
   assign kypd_col_t = (col_cnt == 2'b00) ? 4'b1110 : 
                       (col_cnt == 2'b01) ? 4'b1101 : 
                       (col_cnt == 2'b10) ? 4'b1011 : 
                       4'b0111;
							  
   assign Col = kypd_col_t;
	 
   always @(posedge Clock)
      
      begin
         if (Reset_N == 1'b0)
            KeypadData <= {8{1'b1}};
         else
            if (kypd_col_t == 4'b1110)
            begin
               if (Row == 4'b1110)
                  KeypadData <= 4'h1;
               else if (Row == 4'b1101)
                  KeypadData <= 4'h4;
               else if (Row == 4'b1011)
                  KeypadData <= 4'h7;
               else if (Row == 4'b0111)
                  KeypadData <= 4'h0;
            end
            else if (kypd_col_t == 4'b1101)
            begin
               if (Row == 4'b1110)
                  KeypadData <= 4'h2;
               else if (Row == 4'b1101)
                  KeypadData <= 4'h5;
               else if (Row == 4'b1011)
                  KeypadData <= 4'h8;
               else if (Row == 4'b0111)
                  KeypadData <= 4'hf;
            end
            else if (kypd_col_t == 4'b1011)
            begin
               if (Row == 4'b1110)
                  KeypadData <= 4'h3;
               else if (Row == 4'b1101)
                  KeypadData <= 4'h6;
               else if (Row == 4'b1011)
                  KeypadData <= 4'h9;
               else if (Row == 4'b0111)
                  KeypadData <= 4'he;
            end
            else if (kypd_col_t == 4'b0111)
            begin
               if (Row == 4'b1110)
                  KeypadData <= 4'ha;
               else if (Row == 4'b1101)
                  KeypadData <= 4'hb;
               else if (Row == 4'b1011)
                  KeypadData <= 4'hc;
               else if (Row == 4'b0111)
                  KeypadData <= 4'hd;
            end
      end
endmodule
