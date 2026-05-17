`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:17:22 03/26/2024 
// Design Name: 
// Module Name:    clock_generator 
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
module clock_generator(
    input Clock_100M,
	 output reg Clock_1M,
	 output reg Clock_2M
    );

    reg [7:0] counter_100;
	 reg [7:0] counter_50;
	 initial begin
	    counter_100 = 8'b0;
		 counter_50 = 8'b0;
	 end
	 
	 always @(posedge Clock_100M) begin
	    if (counter_100 < 99)
		     counter_100 <= counter_100 + 1;
		 else
		     counter_100 <= 0;
	 end

	 always @(posedge Clock_100M) begin
	    if (counter_50 < 49)
		     counter_50 <= counter_50 + 1;
		 else
		     counter_50 <= 0;
	 end
	 
	 always @(*) begin
	    if (counter_100 < 50)
		     Clock_1M <= 0;
		 else
		     Clock_1M <= 1;
	 end

	 always @(*) begin
	    if (counter_50 < 25)
		     Clock_2M <= 0;
		 else
		     Clock_2M <= 1;
	 end	 
endmodule
