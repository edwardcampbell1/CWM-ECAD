//////////////////////////////////////////////////////////////////////////////////
// Exercise #3 - Active IoT Devices Monitor
// Student Name: Edward Campbell
// Date: 24/05/21
//
//  Description: In this exercise, you need to design a counter of active IoT devices, where 
//  if the rst=1, the counter should be set to zero. If event=0, the value
//  should stay constant. If on-off=1, the counter should count up every
//  clock cycle, otherwise it should count down.
//  Wrap-around values are allowed.
//
//  inputs:
//           clk, rst, change, on_off
//
//  outputs:
//           counter_out[7:0]
//////////////////////////////////////////////////////////////////////////////////

`timescale 1ns / 100ps

module monitor (clk,rst,change,on_off,counter_out);
        
 input clk,rst,change,on_off;
 output counter_out;
            
 //Todo: add registers and wires, if needed
 reg counter_out[7:0];

 //Todo: add user logic
 initial begin
	counter_out = 8'b00000000;
 end

 always @(posedge clk)
	begin
	if (rst)
		counter_out = 8'b00000000;
		
	if (change == 0)
	counter_out = counter_out;
	else 
		if (on_off)
		counter_out = counter_out + 1;
		if (on_off == 0)
		counter_out = counter_out - 1;
	end
endmodule
