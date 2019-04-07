`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:43:03 04/06/2019 
// Design Name: 
// Module Name:    f_adder 
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
module f_adder(
    input a,
    input b,
    input c_in,
    output s,	 
    output c_out
    );

sum s1(a, b, c_in, s);
carry carry1(a, b, c_in, c_out);
endmodule
