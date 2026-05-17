`timescale 1ns / 1ps

// page 124
module addsub32(a , b , sub , s) ;
	input[31:0] a,b;
 input sub;
 output reg[31:0] s;
 
 always @* begin
    if (sub)
      begin
      s=a-b;
      end
    else
    begin
      s=a+b;
      end
    end


endmodule
