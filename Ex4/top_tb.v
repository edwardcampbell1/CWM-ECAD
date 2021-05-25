//////////////////////////////////////////////////////////////////////////////////
// Test bench for Exercise #4 - Dynamic LED lights
// Student Name: Edward Campbell
// Date: 25/05/21
//
// Description: A testbench module to test Ex4 - Dynamic LED lights
// You need to write the whole file
//////////////////////////////////////////////////////////////////////////////////
`timescale 1ns / 100ps

module top_tb();

parameter CLK_PERIOD = 10;

reg clk;
reg rst;
reg button;
wire [2:0]colour;
reg err;

//Clock generation
    initial
    begin
       clk = 1'b0;
       forever
         #(CLK_PERIOD/2) clk=~clk;
     end

//Trial for colour start at 111 button = 0:
initial begin
rst=0;
button=0;
//colour=111;
err=0;
forever begin
	#10 if (colour==3'b111 | colour==3'b000)
		begin err=1;
		end
		else
		begin err=0;
		end
	button=1; //Now testing for button being held - should cycle but never have colour 000 or 111
	#10 if (colour==3'b111 | colour==3'b000)
		begin err=1;
		end
		else
		begin err=0;
		end
	end
end



//Todo: Finish test, check for success
initial begin
        #50 
        if (err==0)
          $display("***TEST PASSED! :) ***");
        $finish;
	if (err==1)
	  $display("***TEST FAILED! :) ***");
        $finish;
      end

//Todo: Instantiate lights module
lights top(clk,rst,button,colour);

endmodule
























