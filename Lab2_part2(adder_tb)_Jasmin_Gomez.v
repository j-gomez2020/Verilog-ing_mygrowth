`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/29/2021 12:00:31 PM
// Design Name: 
// Module Name: adder_tb
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


module adder_tb;

reg [7:0] a,b;
reg cin;  //inputs
wire [7:0] sum; //outputs
wire cout;
integer k;

adder uut(a, b, cin, cout, sum); // same parameters

initial
begin
// % b is for binary
$monitor($time, " ns, a=%b, b=%b, cin=%b, cout=%b, sum=%b", a, b, cin, cout, sum);
for(k=5000; k<7000; k=k+1)
begin
{a, b, cin} = k;
#5; //delay
end
#5 $stop;  
end
endmodule

