`timescale 1ns / 1ps



module SixSevenSegs_Anvyl(
       input        Clock, 
       input  [5:0] Switch,
       output [5:0] En ,
       output [7:0] Segs 	
	 );
    wire          divided_clock;
    wire   [23:0] data ;
    
	 assign data = 24'hABCDEF ;	
    
	 ClockDivider M1_ClockDivider(.Reset(1'b0), .Clock(Clock), .DividedClock(divided_clock));		
    
	 SevenSegsController M2_SevenSegsController(
	          .Reset(1'b0), .Clock(divided_clock), .DisplayEnables(Switch),  				 
				 .Data(data), .SevenSegsAndPoint(Segs), .ShowOneofSix(En));
endmodule
