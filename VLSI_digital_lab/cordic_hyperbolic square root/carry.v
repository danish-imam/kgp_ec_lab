`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:42:41 04/06/2019 
// Design Name: 
// Module Name:    carry 
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
module carry(
    input a,
    input b,
    input c_in,
    output c_out
    );

wire t2, t3, t4, t5;
and g3(t2,a,b);
and g4(t3,b,c_in);
and g5(t4,a,c_in);
or g6(t5, t2, t3);
or g7(c_out, t5, t4);

endmodule
