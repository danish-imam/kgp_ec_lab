`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:46:13 04/06/2019 
// Design Name: 
// Module Name:    shifter 
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
module shifter(sel,ip,out);
input [3:0]sel;
input [19:0]ip;
output [19:0]out;

wire [19:0]t[3:1];

mux m0[19:0](sel[0],ip,{ip[19],ip[19:1]},t[1]);
mux m1[19:0](sel[1],t[1],{{2{ip[19]}},t[1][19:2]},t[2]);
mux m2[19:0](sel[2],t[2],{{4{ip[19]}},t[2][19:4]},t[3]);
mux m3[19:0](sel[3],t[3],{{8{ip[19]}},t[3][19:8]},out);

endmodule
