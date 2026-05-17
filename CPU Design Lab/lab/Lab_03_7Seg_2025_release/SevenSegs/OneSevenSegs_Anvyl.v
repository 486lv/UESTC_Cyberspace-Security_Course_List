`timescale 1ns / 1ps

module OneSevenSegs_Anvyl(
       input  [3:0] Switch ,
	    input        Btn0 ,
	    output [6:0] Segs ,
	    output       En    
	 );

    assign En = ~Btn0 ; // Btn0 : normal => 0 , pushdown => 1

    SevenSegs M1_SevenSegs( .Digit(Switch) , .EnableSegs(En) , .Seg(Segs) );

endmodule