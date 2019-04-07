`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:45:55 04/06/2019 
// Design Name: 
// Module Name:    seqgen 
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
module seqgen(b,c,d,e,reset,clk);
input reset,clk;
output b,c,d,e;
wire a,b,c,d,e,abar,bbar,cbar,dbar,ebar,w,ck;
wire t[19:1];

nand g19(w,abar,b,c,d,e);
and g20(ck,w,clk);

dff F5(a,abar,t[3],reset,ck);
dff F4(b,bbar,t[6],reset,ck);
dff F3(c,cbar,t[10],reset,ck);
dff F2(d,dbar,t[15],reset,ck);
dff F1(e,ebar,t[19],reset,ck);

and g1(t[1],a,ebar);
xor g2(t[2],b,c);
or g3(t[3],t[1],t[2]);

and g4(t[5],c,d,e);
or g5(t[6],b,t[5]);

and g6(t[7],c,dbar);
and g7(t[8],c,ebar);
and g8(t[9],cbar,d,e);
or g9(t[10],t[7],t[8],t[9]);

or g10(t[11],bbar,cbar);
and g11(t[12],d,ebar);
and g12(t[13],abar,b);
and g13(t[14],t[11],e,dbar);
or g14(t[15],t[12],t[13],t[14]);

and g15(t[16],cbar,ebar);
and g16(t[17],d,ebar);
and g17(t[18],a,b,c);
or g18(t[19],t[16],t[17],t[18],t[1]);

endmodule
