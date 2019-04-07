`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   18:40:10 04/06/2019
// Design Name:   sroot
// Module Name:   E:/Xilinx/sroot2/tb_sroot.v
// Project Name:  sroot2
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: sroot
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module tb_sroot;

	// Inputs
	reg [19:0] x0;
	reg [19:0] y0;
	reg clk;
	reg reset;
	reg s;

	// Outputs
	wire [19:0] xn;
	wire [19:0] yn;
	wire [3:0]seq;
	// Instantiate the Unit Under Test (UUT)
	sroot uut (
		.x0(x0), 
		.y0(y0), 
		.clk(clk), 
		.reset(reset),
		.s(s),
		.xn(xn), 
		.yn(yn),
		.seq(seq)
	);

	initial begin
		// Initialize Inputs
		x0 = 20'b00010100000000000000;
		y0 = 20'b00001100000000000000;
		reset = 1'b1;
		s=1'b1;

		// Wait 100 ns for global reset to finish
		#100;
      	reset=1'b0; 
		#100;
		s=1'b0;
		// Add stimulus here

	end
	
	
	initial begin
	clk = 0;
		forever 
			begin
			#50 clk=~clk;
			#50 clk=~clk;
			
			end
			
	end
      
endmodule

