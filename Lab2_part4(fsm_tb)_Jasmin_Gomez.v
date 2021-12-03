`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/14/2021 07:32:02 PM
// Design Name: 
// Module Name: fsm_tb
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


module fsm_tb; 
reg reset, clk,one,two,five;

wire d;
wire [2:0]r;


fsm utt(reset, clk, one,two,five,d,r);
 
initial clk=0;
always #2 clk=~clk;

    initial begin

        reset=1; one=0; two=0; five=0;

         
        #4reset=0;
        #4two=0; one=1; five=0;
        #4five=0;one=1; two=0;
        #4one=0; two=1; five=0;
        #4two=1; one=0; five=0;
        #4reset=1; one=0; two=0; five=0;

        #4reset=0;
        #4five=0;one=1; two=0;
        #4five=0;one=0; two=1;
        #4five=0;one=0; two=1;
        #4reset=1; one=0; two=0; five=0;

        #4reset=0;
        #4five=0;one=0; two=1;
        #4five=1;one=0; two=0;
        #4reset=1; one=0; two=0; five=0;

        #4reset=0;
        #4five=0;one=1; two=0;
        #4five=1;one=0; two=0;
        #4reset=1; one=0; two=0; five=0;

        #4reset=0;
        #4five=0;one=0; two=1;
        #4five=0;one=0; two=1;
        #4five=0;one=0; two=1;
        #4reset=1; one=0; two=0; five=0;

        #4reset=0;
        #4two=0; one=1; five=0;
        #4five=0;one=1; two=0;
        #4two=0; one=1; five=0;
        #4five=0;one=1; two=0;
        #4two=0; one=1; five=0;
        #4reset=1; one=0; two=0; five=0;

        #4reset=0;
        #4two=1; one=0; five=0;
        #4two=1; one=0; five=0;
        #4five=1;one=1; two=0;
        #4reset=1; one=0; two=0; five=0;

        #4reset=0;
        #4two=0; one=1; five=0;
        #4two=0; one=1; five=0;
        #4five=1;one=0; two=0;
        #4reset=1; one=0; two=0; five=0;

        #4reset=0;
        #4$stop;
    end
endmodule

