`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/01/2021 07:33:43 PM
// Design Name: 
// Module Name: VendingMachine
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

//Lab2 - Part 4 Wooohooo 

//------------------Final Implementation of the Vending Maching -------------------------------------
module VendingMachine(reset, x, clk,  y, cs, ns); 
input reset, x, clk; 
output y;
output  [1:0]  cs, ns; 
reg    y;
reg [1:0]  cs, ns;   
parameter A=2'b00,B=2'b01, C=2'b10;
always@(posedge clk or posedge reset)
begin
if(reset) 
    cs <= A;
else  
    cs <= ns;
end
always@(cs or x) 
begin 
    case (cs)
        A: y=0; 
        B: if(x) y = 1;
            else y = 0;  
        C: if(x) y = 0; 
            else y = 1;
        default: y=0; 
    endcase 
end  
always@(cs or x)
begin   
    case(cs)
        A:  if(x) ns = C;
            else ns =B;
        B:  if(x) ns = C;
            else ns = B;
        C:  if(x) ns = C;
            else ns = B;
        default: ns = A;
    endcase
end
endmodule
//--------------------------------------------------------------------------------------------
module fsm(reset, clk,one, two, five, d, r); 
input reset, clk, one, two, five; 
output reg d;
output reg [3:0]r; 
reg    y;
reg [3:0]  cs, ns;   

parameter idle = 4'b0000, S1 = 4'b0001, S2 = 4'b0010, S3 = 4'b0011, S4 = 4'b0100, S5 = 4'b0101, S6 = 4'b0110,  S7 = 4'b0111,  S8 = 4'b1000, S9 = 4'b1001; 
always@(posedge clk or posedge reset)
begin
if(reset) 
    cs <= idle;
else  
    cs <= ns;
end
always@(cs or one or two or five) 
begin 
    case (cs)
idle:
            if(one)
                ns = S1;
            else if(two)
                ns = S2; 
            else if(five)
                ns = S5; 
            else 
                ns = idle; 
S1:
            if(one)
                ns = S2;
            else if(two)
                ns = S3; 
            else if(five)
                ns = S6; 
            else 
                ns = S1; 

S2:
           if(one)
                ns = S3;
            else if(two)
                ns = S4; 
            else if(five)
                ns = S7; 
            else 
                ns = S2; 
S3:
           if(one)
                ns = S4;
            else if(two)
                ns = S5; 
            else if(five)
                ns = S8; 
            else 
                ns = S3;    
S4:
           if(one)
                ns = S5;
            else if(two)
                ns = S6; 
            else if(five)
                ns = S7; 
            else 
                ns = S4;    
S5:
            if(one)
                ns = S1;
            else if(two)
                ns = S2; 
            else if(five)
                ns = S5; 
            else 
                ns = idle; 
                
S6:
           if(one)
                ns = S1;
            else if(two)
                ns = S2; 
            else if(five)
                ns = S5; 
            else 
                ns = idle; 

S7:
           if(one)
                ns = S1;
            else if(two)
                ns = S2; 
            else if(five)
                ns = S5; 
            else 
                ns = idle;                
S8:
           if(one)
                ns = S1;
            else if(two)
                ns = S2; 
            else if(five)
                ns = S5; 
            else 
                ns = idle;   
S9:
           if(one)
                ns = S1;
            else if(two)
                ns = S2; 
            else if(five)
                ns = S5; 
            else 
                ns = idle;                  

        default: cs = idle; 
    endcase 
end     
  
always@(cs) 
begin 
    case(cs)
        idle:  begin
          d = 0; r = 0;
          end
        S1:  begin
          d = 0; r = 0;
          end 
        S2:  begin
          d = 0; r = 0;
          end
        S3:   begin
          d = 0; r = 0;
          end 
        S4:   begin
          d = 0; r = 0;
          end
        S5:  begin
          d = 1; r = 0;
          end
        S6:  begin
          d = 1; r = 1;
          end
        S7:   begin
          d = 1; r = 2;
          end
        S8:  begin
          d = 1; r = 3;
          end 
        S9:  begin
          d = 1; r = 4;
          end 
        default: ns = idle;
    endcase
end
endmodule


