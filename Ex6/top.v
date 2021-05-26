//////////////////////////////////////////////////////////////////////////////////
// Exercise #6 - RGB Colour Converter
// Student Name: Edward Campbell
// Date: 26/05/21
//
//
//  Description: In this exercise, you need to design a memory with 8 entries, 
//  converting colours to their RGB code.
//
//  inputs:
//           clk, colour [2:0], enable
//
//  outputs:
//           rgb [23:0]
//
//////////////////////////////////////////////////////////////////////////////////

Ex6_block_generator your_instance_name (
  .clka(clka),    // input wire clka
  .ena(ena),      // input wire ena
  .wea(wea),      // input wire [0 : 0] wea
  .addra(addra),  // input wire [3 : 0] addra
  .dina(dina),    // input wire [15 : 0] dina
  .douta(douta)  // output wire [15 : 0] douta
);

memory_initialization_radix=16;
memory_initialization_vector=000000 0000FF 00FF00 00FFFF FF0000 FF00FF FFFF00 FFFFFF;

`timescale 1ns / 100ps

module converter(input clk, [2:0]colour, enable, output [23:0] rgb);

always @(posedge clk)
	begin
