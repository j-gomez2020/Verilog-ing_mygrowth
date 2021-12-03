`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/23/2021 07:19:38 PM
// Design Name: 
// Module Name: multi_tb
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


module multi_tb; 

reg x2, x1, x0, y2, y1, y0;  //inputs
wire p0, p1, p2, p3, p4, p5; //outputs 
integer k; 

multi uut(x2, x1, x0,y2, y1, y0, p0, p1, p2, p3, p4, p5); // same parameters 

initial 
begin 
// % b is for binary 
	$monitor($time, " ns, x2=%b, x1=%b, x0=%b, y2=%b, y1=%b, y0=%b, p5=%b, p4=%b, p3=%b, p2=%b, p1=%b, p0=%b", x2, x1, x0, y2, y1, y0, p5, p4, p3, p2, p1, p0); 
	for(k=0; k<64; k=k+1) 
	begin 
	{x2, x1, x0, y2, y1, y0} = k; 
	#5; //delay 
	end
	#5 $stop;  
end 
endmodule 

