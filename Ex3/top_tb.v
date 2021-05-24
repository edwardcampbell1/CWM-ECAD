//////////////////////////////////////////////////////////////////////////////////
// Test bench for Exercise #3 - Active IoT Devices Monitor
// Student Name: Edward Campbell
// Date: 24/05/21
//
// Description: A testbench module to test Ex3 - Active IoT Devices Monitor
// Guidance: start with simple tests of the module (how should it react to each 
// control signal?). Don't try to test everything at once - validate one part of 
// the functionality at a time.
//////////////////////////////////////////////////////////////////////////////////
`timescale 1ns / 100ps

module top_tb();
    
//Todo: Parameters
parameter CLK_PERIOD = 10;


//Todo: Registers and wires
reg clk,rst,change,on_off,err,counter_out


//Todo: Clock generation
initial begin
	clk=0;   
	forever
		#(CLK_PERIOD) clk=~clk; //  happens every delay of CLK_PERIOD
end


//Todo: User logic
//Testing reset input:
initial begin
 clk=0;
 rst=1;
 change=1;    
 on_off=1;
 err=0;
	forever begin
	if (counter_out != 0)
		err=1;
	end

//Testing for change = 0:
initial begin
 clk=0;
 rst=0;
 change=0;    
 on_off=1;
 err=0;
	forever begin
	if (counter_out != 0)
		err=1;
	end

//Testing for 

//Todo: Finish test, check for success

begin if (err==0)
          $display("TEST PASSED");
        $finish;
	if (err==1)
		$display("TEST FAILED");
	$finish
      end

//Todo: Instantiate counter module
counter top (clk,rst,change,on_off);

endmodule 


