`timescale 1ns / 1ps

module ClockDivider(
       input      Reset ,
       input      Clock , 
       output reg DividedClock	
	 );      

	 parameter  COUNTER = 32'hC350; // 50 000   
    reg [32:0] clock_count;

    initial begin
	     clock_count  = 0 ;
		  DividedClock = 0 ;
	 end

    always @(posedge Clock ) 
      if (Reset == 1'b1) begin
         clock_count  <= {32{1'b0}};
			DividedClock <= 0 ;
		end
      else 
      begin
         if ( clock_count == COUNTER - 1 ) // CLK为100M时， dividedClk的周期 1ms , 高低各 0.5ms
         begin
            DividedClock <= ~DividedClock;
            clock_count <= {32{1'b0}};
         end
			else
            clock_count <= clock_count + 1;
      end	
		
endmodule
