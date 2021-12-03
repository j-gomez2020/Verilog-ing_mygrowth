`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/09/2021 06:52:09 PM
// Design Name: 
// Module Name: Lab2-week1
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

//-------------------mux ---------------------------------
module mux(d0, d1, s, y);  
input d0, d1, s; 
output y; 
reg y; 

always@(d0 or d1 or s) 
begin 
	if(s==1) 
	y = d1; 
	else 
	y = d0; 
end 
endmodule  
// -----------------muxb-------------------------------------- 

module muxb(d0, d1, s, y); 
input s;  
input [3:0] d0, d1; 
output [3:0] y; 
reg [3:0] y; 

always@(d0 or d1 or s ) 
begin 
	if(s==1) 
	y= d1; 
	else 
	y = d0; 
end
endmodule  
//----------------Half Adder for Full Adder-------------
module half(a, b, sum, cout);  
input a, b;
output sum, cout;
xor u1(sum, a, b);
and u2(cout, a, b);
endmodule

//---------------Full Adder For RCA---------------------
module fa( a, b, cin, cout, sum);
input a, b, cin;
output cout, sum;

wire m, n, p;

half g1(.a(a), .b(b), .cout(n), .sum(m));
half g2(.a(m), .b(cin), .cout(p), .sum(sum));

assign cout = p|n;
endmodule 
//----------------4RCA----------------------------------

module rca4(a, b, cin, cout, sum); 

input [3:0] a, b;  
input cin;  
output [3:0] sum; 
output cout; 

wire [2:0] c;  
//issue with the cout section of the RCA 
fa g1(.a(a[0]), .b(b[0]), .cin(cin), .cout(c[0]), .sum(sum[0])); 
fa g2(.a(a[1]), .b(b[1]), .cin(c[0]), .cout(c[1]), .sum(sum[1]));
fa g3(.a(a[2]), .b(b[2]), .cin(c[1]), .cout(c[2]), .sum(sum[2]));
fa g4(.a(a[3]), .b(b[3]), .cin(c[2]), .cout(cout), .sum(sum[3]));
endmodule  

//---------------8bit ---------------------------------------- 

module adder(a, b, cin, cout, sum); 

input [7:0] a, b;
input cin; 
output [7:0] sum; 
output cout; 


wire m; 
wire [7:0]sa, sb; 
wire [3:0] c; 
  
//look over wiring !!!
rca4 g1(.a(a[3:0]), .b(b[3:0]), .cin(cin), .cout(m), .sum(sum[3:0])); 
rca4 g2(.a(a[7:4]), .b(b[7:4]), .cin(0), .cout(c[0]), .sum(sa[7:4])); 
rca4 g3(.a(a[7:4]), .b(b[7:4]), .cin(1), .cout(c[1]), .sum(sb[7:4])); 
muxb g4(.d0(sa[7:4]), .d1(sb[7:4]), .s(m), .y(sum[7:4])); 
mux g5(.d0(c[0]), .d1(c[1]), .s(m), .y(c[2])); 

assign cout = c[2];

endmodule 
