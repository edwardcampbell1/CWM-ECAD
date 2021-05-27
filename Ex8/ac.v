//////////////////////////////////////////////////////////////////////////////////
// Exercise #5 - Air Conditioning
// Student Name: Edward Campbell
// Date: 25/05/21
//
//  Description: In this exercise, you need to an air conditioning control system
//  According to the state diagram provided in the exercise.
//
//  inputs:
//           clk, temperature [4:0]
//
//  outputs:
//           heating, cooling
//////////////////////////////////////////////////////////////////////////////////

`timescale 1ns / 100ps

module ac(input clk, [4:0]temp,
output reg heat, reg cool);

//Standard operating conditions
always @(posedge clk)
	begin
	heat <= (temp<5'd18)?1: (temp>=5'd20)?0: heat;
	cool <= (temp<=5'd20)?0: (temp>5'd22)?1: cool;
//Illegal state - both heat and cool on
//resolve by setting both to zero and letting system decide which (if any) to reactivate based on temp
	if (cool==1 & heat==1)
		cool <= 0;
		heat <= 0;
	end
endmodule
