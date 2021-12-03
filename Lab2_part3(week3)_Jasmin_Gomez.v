`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/22/2021 05:43:51 PM
// Design Name: 
// Module Name: week3
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

//----------------------Clock Division ---------------------------
module div(clkin, clkout); 

input clkin; 
output clkout; 

reg clkout; 
reg[2:0]cnt; 

initial cnt = 0; 

always@(posedge clkin)
begin 
    if(cnt ==3)
    begin 
        cnt<=0; 
        clkout<=1; 
    end 
    else if (cnt < 1) 
        begin
        cnt <= cnt + 1;
        clkout <= 1; 
    end
    else
    begin
        cnt <= cnt + 1; 
        clkout <= 0;
    end 
end
endmodule 

//------------------mux------------------------------- 
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

//---------------------BCD---------------------------- 
module bcd (clkin, dout);

input clkin; //just changed the input name -> it worked i guess
output [3:0] dout; 
 
reg [3:0]dout; 
initial dout = 0; 

always @ (posedge(clkin))begin
     if (dout == 9) 
        dout <= 0;
     else
        dout <= dout + 1;
    end
endmodule

//-------------------Two Speed Counter------------------------- 
//!!! When  s  is  logic  1, the  BCD counter will run 4 times slower.
module top(clkin, s, y);
input clkin, s; 
output [3:0]y;  

wire clkd, clky; 

// clock instance [Gate 1]
div g1 (clkin, clkd); 
// mux instance [Gate 1]
mux g2( clkd, clkin, s, clky);
// BCD instance [Gate 1]  Double check right here 
bcd g3(clky, y);

endmodule 



