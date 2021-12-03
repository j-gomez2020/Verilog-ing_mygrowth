`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/01/2021 07:11:35 PM
// Design Name: 
// Module Name: top_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module top_tb;
reg clkin, s; 
wire [3:0]y;  
integer k; 

top uut(clkin, s, y); 

initial
begin

$monitor($time, " ns, clkin=%b, s=%b, y=%b", clkin, s, y);
for(k=0; k<16; k=k+1)
begin
{clkin, s} = k;
#5; //delay
end
#5 $stop;  
end
endmodule

