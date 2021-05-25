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

module ac(input clk, reg [4:0]temp,
output heat, cool);

//Standard operating conditions


//Illegal state - both heat and cool on
//resolve by setting both to zero and letting system decide which (if any) to reactivate based on temp
