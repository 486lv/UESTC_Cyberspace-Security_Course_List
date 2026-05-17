`timescale 1ns / 1ps

module alu_tb_fig4_7;

	// Inputs
	reg [31:0] a;
	reg [31:0] b;
	reg [3:0] aluc;

	// Outputs
	wire [31:0] r;
	wire z;

	// Instantiate the Unit Under Test (UUT)
	alu uut (
		.a(a), 
		.b(b), 
		.aluc(aluc), 
		.r(r), 
		.z(z)
	);

	initial begin
// dj : remove it 
/*	
		// Initialize Inputs
		a = 0;
		b = 0;
		aluc = 0;

		// Wait 100 ns for global reset to finish
		#100;
*/        
		// Add stimulus here
		aluc = 4'b0000 ;
		a = 32'h0000_0001 ;
		b = 32'h0000_0002 ;
		
		#10;
		aluc = 4'b0100 ;
		
		#10 ;
		aluc = 4'b0001 ;
		a = 32'hCCCC_CCCC ;
		b = 32'hAAAA_AAAA ;
		
		#10 ;
		aluc = 4'b0101 ;
		
		#10;
		aluc = 4'b0010 ;
		a = 32'h3333_3333 ;
		b = 32'hFF00_5555 ;
		
		#10 ;
		aluc = 4'b0110 ;
		
		#10 ;
		aluc = 4'b0011 ;
		a = 32'h0000_000F ;
		b = 32'hFFFF_FFFF ;
		
		#10 ;
		aluc = 4'b0111 ;
		
		#10 ;
		aluc = 4'b1111 ;
		a = 32'h0000_0010 ;
		b = 32'h7F00_0000 ;
		
		#10 ;
		b = 32'hFF00_0000 ;
		
		#10 ;
		$finish ;
	
	
	end
	
	initial begin
		$monitor($time," aluc=%h" , aluc , "  a=%h",a,"   b=%h",b, "  r=%h",r,"   z=%b",z);
	end	
      
endmodule

