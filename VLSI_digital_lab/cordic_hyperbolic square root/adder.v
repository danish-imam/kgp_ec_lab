`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:43:22 04/06/2019 
// Design Name: 
// Module Name:    adder 
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
module adder(i1,i2,out);
input [19:0]i1;
input [19:0]i2;
output [19:0]out;

wire [19:0]c;
wire [19:0]t;
wire c_in;

xnor g1(c_in,i1[19],i2[19]);
xor g2[19:0](t,c_in,i2);
f_adder F0(i1[0],t[0],c_in,out[0],c[0]);

genvar i;
generate
for(i=1;i<20;i=i+1)
begin:loop
	f_adder F(i1[i],t[i],c[i-1],out[i],c[i]);
end
endgenerate

endmodule
