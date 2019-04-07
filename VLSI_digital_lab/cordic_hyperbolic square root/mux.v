`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:44:58 04/06/2019 
// Design Name: 
// Module Name:    mux 
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
module mux(
    input sel,
    input i0,
    input i1,
    output out
    );
//select i0 if sel=0
wire t1,t2;
and g1(t1,i0,~sel);
and g2(t2,i1,sel);
or g3(out,t1,t2);
endmodule
