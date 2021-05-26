//////////////////////////////////////////////////////////////////////////////////
// Test bench for Exercise #5 - Air Conditioning
// Student Name: Edward Campbell
// Date: 25/05/21
//
// Description: A testbench module to test Ex5 - Air Conditioning
// You need to write the whole file
//////////////////////////////////////////////////////////////////////////////////

`timescale 1ns / 100ps

module top_tb();

parameter CLK_PERIOD = 10;

reg clk;
wire heat;
wire cool;
reg err;
reg [4:0]temp;

//Clock generation
initial
begin
clk = 1'b0;
	forever
        #(CLK_PERIOD/2) clk=~clk;
end
//start at temp = 0:

initial
begin
temp = 5'b00000;
//heat = 0;
//cool = 0;
forever begin
	#10 if ((heat == 1 && temp > 20) || (cool == 1 && temp < 20) || (heat == 1 && cool == 1))
		begin err=1;
		end
		else
		begin err=0;
		end

//Trial response to heat = cool = 1:

	//assign heat = 1; //updating heat and cool
	//assign cool = 1;
	#10 if ((heat == 1 && temp > 20) || (cool == 1 && temp < 20) || (heat == 1 && cool == 1)) //confirming no illegal states in subsequenct clock cycles
		begin err=1;
		end
		else
		begin err=0;
		end

	end
end

//repeating but start at mid temp (20)


//Todo: Finish test, check for success
initial begin
        #50 
        if (err==0)
          $display("***TEST PASSED! :) ***");
        $finish;
	if (err==1)
	  $display("***TEST FAILED! :( ***");
        $finish;
      end

//Instantiating ac top:
ac top(clk,temp,heat,cool);

endmodule
