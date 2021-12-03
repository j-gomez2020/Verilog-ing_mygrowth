`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/08/2021 10:43:59 AM
// Design Name: 
// Module Name: myinv
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

//-----------------Half Adder----------------------------------
module myinv(a, b, sum, cout);  
input a, b; 
output sum, cout; 
xor u1(sum, a, b); 
and u2(cout, a, b); 
endmodule
//----------------Full Adder-------------------------------
module fa( a, b, cin, cout, sum); 
input a, b, cin; 
output cout, sum; 

wire m, n, p; 

myinv g1(.a(a), .b(b), .cout(n), .sum(m)); 
myinv g2(.a(m), .b(cin), .cout(p), .sum(sum)); 

assign cout = p|n; 
endmodule  
//---------------- Multiplier ----------------------------- 
//x2, x1, x0, y2, y1, y0, p5, p4, p3, p2, p1, p0
module multi( x2, x1, x0,y2, y1, y0, p0, p1, p2, p3, p4, p5); 
input  x2, x1, x0,y2, y1, y0; 
output p0, p1, p2, p3, p4, p5; 

wire c1, c2, c3, c4, c5,c6,t1, t2, t3, t4, t5, t6, t7, t8, t9, d1, d2; 
  
and s1(t1, y0, x0); 
and s2(t2, y0, x1); 
and s3(t3, y0, x2); 
and s4(t4, y1, x0); 
and s5(t5, y1, x1); 
and s6(t6, y1, x2); 
and s7(t7, y2, x0); 
and s8(t8, y2, x1);
and s9(t9, y2, x2);
   
myinv g1(.a(t4), .b(t2), .cout(c1), .sum(p1)); 
fa g2(.a(t5), .b(t3), .cin(c1),  .cout(c2), .sum(d1)); 
myinv g3(.a(c2), .b(t6), .cout(c3), .sum(d2)); // check input 
myinv g4(.a(t7), .b(d1), .cout(c4), .sum(p2));
fa g5(.a(t8), .b(d2),.cin(c4), .cout(c5), .sum(p3));
fa g6(.a(t9), .b(c3),.cin(c5), .cout(c6), .sum(p4));

assign p0 = t1;  
assign p5 = c6;  
endmodule  

