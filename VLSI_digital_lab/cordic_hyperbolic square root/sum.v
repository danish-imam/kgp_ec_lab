`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:42:21 04/06/2019 
// Design Name: 
// Module Name:    sum 
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
module sum(
    input a,
    input b,
    input c_in,
    output s
    );
wire t1;
xor g1 (t1,a,b);
xor g2 (s,t1,c_in);


endmodule
