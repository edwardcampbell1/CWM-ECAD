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
reg clk,rst,change,on_off,err,counter_out;


//Todo: Clock generation
	initial
	begin
		clk=1'b0;   
		forever
			#(CLK_PERIOD/2) clk=~clk; //  happens every delay of CLK_PERIOD
	end


//Todo: User logic
//Testing reset input:
initial begin
 clk=0;
 rst=1;
 change=0;    
 on_off=1;
 err=0;
	
	#10 if (counter_out != 0)
		begin err=1;
		end
	rst = 0; //Now test for change = 0:
	
	#20 if (counter_out != 0)
		begin err=1;
		end

//Testing for change = 1:
change = 1;
	forever
	begin
	#(CLK_PERIOD*2)
	local_counter = on_off?local_counter+1:local_counter-1;
 		if (local_counter!=counter_out)
		begin
		err=1;
		end
	end

//Todo: Finish test, check for success
 if (err==0) begin
         $display("TEST PASSED");
         $finish;
 if (err==1) begin
	$display("TEST FAILED");
	$finish;
end
//Todo: Instantiate monitor module
monitor top(clk,rst,change,on_off)

endmodule
