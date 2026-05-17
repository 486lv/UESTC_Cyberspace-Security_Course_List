`timescale 1ns / 1ps


module Keypad(
       input            Reset_N     , 
       input            Clock       , 
		 input  [3:0]     Row         ,
		 output [3:0]     Col         , 
       output reg [7:0] KeypadData  ,
       output           Ready 		 
		 
    );
	 
	 reg [3:0] column ;
	 reg       ready_0, ready_1, ready_2 ;
	 
	 initial begin
	    column     = 4'b1110 ;
		 KeypadData = 8'h_ff ;
		 
		 ready_0    = 0 ;
		 ready_1    = 0 ;
		 ready_2    = 0 ;
	 end
	 
	 always @(posedge Clock ) begin
	    if( Reset_N == 0 )
		     column <= 4'b1110 ;
		 else
		     column <=  { column[2:0] , column[3] } ;
	 end
	 
	 assign Col = column ;

	 assign Ready = ready_0 & ready_1 & ready_2 ;
	 always @(posedge Clock ) begin
		     ready_1    <= ready_0 ;
			  ready_2    <= ready_1 ;
	 end
	 
	 always @(posedge Clock ) begin
	    if( Reset_N == 0 ) begin
		     KeypadData <= 8'h_ff ;

		     ready_0    <= 0 ;
		 end 	  
		 else begin
			  
		     case( column )
			        4'b1110 :
					            case( Row )
									      4'b1110 : begin KeypadData <= 8'h_1 ; ready_0 <= 1 ; end
											4'b1101 : begin KeypadData <= 8'h_4 ; ready_0 <= 1 ; end
											4'b1011 : begin KeypadData <= 8'h_7 ; ready_0 <= 1 ; end
											4'b0111 : begin KeypadData <= 8'h_0 ; ready_0 <= 1 ; end
											
											default : begin                       ready_0 <= 0 ; end
									endcase
									
					  4'b1101 :
					            case( Row )
									      4'b1110 : begin KeypadData <= 8'h_2 ; ready_0 <= 1 ; end
											4'b1101 : begin KeypadData <= 8'h_5 ; ready_0 <= 1 ; end
											4'b1011 : begin KeypadData <= 8'h_8 ; ready_0 <= 1 ; end
											4'b0111 : begin KeypadData <= 8'h_f ; ready_0 <= 1 ; end
											
											default : begin                       ready_0 <= 0 ; end
									endcase
					  4'b1011 :
					            case( Row )
									      4'b1110 : begin KeypadData <= 8'h_3 ; ready_0 <= 1 ; end
											4'b1101 : begin KeypadData <= 8'h_6 ; ready_0 <= 1 ; end
											4'b1011 : begin KeypadData <= 8'h_9 ; ready_0 <= 1 ; end
											4'b0111 : begin KeypadData <= 8'h_e ; ready_0 <= 1 ; end
											
											default : begin                       ready_0 <= 0 ; end
									endcase
					  4'b0111 :
					            case( Row )
									      4'b1110 : begin KeypadData <= 8'h_a ; ready_0 <= 1 ; end
											4'b1101 : begin KeypadData <= 8'h_b ; ready_0 <= 1 ; end
											4'b1011 : begin KeypadData <= 8'h_c ; ready_0 <= 1 ; end
											4'b0111 : begin KeypadData <= 8'h_d ; ready_0 <= 1 ; end
											
											default : begin                       ready_0 <= 0 ; end
									endcase
									
					  default : begin                                       ready_0 <= 0 ; end
			  endcase
		 end
	 end
endmodule
