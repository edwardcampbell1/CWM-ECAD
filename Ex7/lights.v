//////////////////////////////////////////////////////////////////////////////////
// Exercise #4 - Dynamic LED lights
// Student Name: Edward Campbell
// Date: 25/05/21
//
//  Description: In this exercise, you need to design a LED based lighting solution, 
//  following the diagram provided in the exercises documentation. The lights change 
//  as long as a button is pressed, and stay the same when it is released. 
//
//  inputs:
//           clk, rst, button
//
//  outputs:
//           colour [2:0]
//
//  You need to write the whole file.
//////////////////////////////////////////////////////////////////////////////////

`timescale 1ns / 100ps

module lights(input rst,clk,button,
output reg [2:0]colour);

//Todo: add user logic
initial begin
	colour = 3'b001;
end

always @(posedge clk)
	begin
	if (rst == 1)
		colour = 3'b000;
	else if (button == 0 && (colour == 3'b111 || colour == 3'b000))
		colour = 3'b001;
	else if (button == 0)
		colour = colour;
	else if ((button == 1) && (colour != 3'b111) && (colour != 3'b110))
		colour = colour + 1;
		
	else
		colour = 3'b001;
	end

endmodule


















