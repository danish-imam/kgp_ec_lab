`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:45:19 04/06/2019 
// Design Name: 
// Module Name:    dff 
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
module dff (q,qbar,d,reset, clk);
input d,reset, clk;
output reg q; 
output qbar;
//assign qbar = ~q;
not g(qbar,q);

always@(posedge clk)
begin

if (reset == 1) q<=1'b0;
else q<=d;

end
endmodule
