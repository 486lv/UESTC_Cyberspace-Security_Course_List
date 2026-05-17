`timescale 1ns / 1ps


module Keypad_Anvyl(
       input        CLK      ,
		 input  [3:0] KYPD_ROW , 
		 output [3:0] KYPD_COL ,
		 output [7:0] LED
    );
	 
	 wire Clock_1KHz ;
	 
	 ClockDivider clock_divider(
	    .Reset       ( 1'b0       ) , 
		 .Clock       ( CLK        ) ,
		 .DividedClock( Clock_1KHz ) 
	 );

    Keypad keypad(
       .Reset_N     ( 1'b1        ) , 
       .Clock       ( Clock_1KHz  ) , 
		 .Row         ( KYPD_ROW    ) ,
		 .Col         ( KYPD_COL    ) , 
       .KeypadData  ( LED         ) 		 
		 
    );
	

endmodule
