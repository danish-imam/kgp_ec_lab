`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:46:31 04/06/2019 
// Design Name: 
// Module Name:    sroot 
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
module sroot(x0,y0,clk,reset,s,xn,yn,seq);
input [19:0]x0;
input [19:0]y0;
input clk,reset,s;
output [19:0]xn;
output [19:0]yn;
output [3:0]seq;

/*wire w1,ck;*/
wire [3:0]sel;
wire [19:0]t[10:1];

assign sel=seq;
mux m1[19:0](s,t[9],x0,t[1]);
mux m2[19:0](s,t[10],y0,t[2]);
dff r1[19:0](t[3],t[5],t[1],reset,clk);
dff r2[19:0](t[4],t[6],t[2],reset,clk);
shifter s1(sel,t[4],t[7]);
shifter s2(sel,t[3],t[8]);
seqgen sg(seq[3],seq[2],seq[1],seq[0],reset,clk);
adder a1(t[3],t[7],xn);
adder a2(t[4],t[8],yn);
assign t[9]=xn;
assign t[10]=yn;
/*
nand g1(w1,sel[3],sel[2],sel[1],sel[0]);
and g2(ck,clk,w1);*/

endmodule
