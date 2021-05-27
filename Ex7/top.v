//////////////////////////////////////////////////////////////////////////////////
// Exercise #7 - Lights Selector
// Student Name:
// Date: 
//
//  Description: In this exercise, you need to implement a selector between RGB 
// lights and a white light, coded in RGB. If sel is 0, white light is used. If
//  the sel=1, the coded RGB colour is the output.
//
//  inputs:
//           clk, sel, rst, button
//
//  outputs:
//           light [23:0]
//////////////////////////////////////////////////////////////////////////////////

`timescale 1ns / 100ps

module selecter(input clka, sel, rst, button, output [23:0]light);

wire [2:0]colour;
wire ena;
wire [23:0]white;
wire [23:0]rgb;

assign ena = 1;
assign white = 24'hFFFFFF;

lights lights(.rst (rst), .clk (clka), .button (button), .colour (colour)); //instantiating lights to output the colour required		

converter converter(.clka (clka), .colour (colour), .ena (ena), .rgb (rgb)); //instantaiating convertor to produce rgb

doorbell doorbell(.a (white), .b (rgb), .sel (sel), .out (light));

endmodule
