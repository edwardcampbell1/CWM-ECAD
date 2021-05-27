//////////////////////////////////////////////////////////////////////////////////
// Test bench for Exercise #7 - Lights Selector
// Student Name: Edward Campbell
// Date: 27/05/21
//
// Description: A testbench module to test Ex7 - Lights Selector
// You need to write the whole file
//////////////////////////////////////////////////////////////////////////////////
`timescale 1ns / 100ps

module top_tb();

parameter CLK_PERIOD = 10;

//regs and wires
reg sel;
reg clka;
wire [23:0] light;
reg rst;
reg button;
reg err;



//clock generation
initial
begin
clka = 1'b0;
	forever
        #(CLK_PERIOD/2) clka=~clka;
end

initial
begin
//checking white light for select = 0
sel = 0;
rst = 0;
button = 1;
err = 0;
	forever
	begin
	#10 if (light != 24'hFFFFFF)
		begin
		err<=1;
		end
	else
		begin
		err<=err;
		end
	end

//checking reset works
sel = 1;
rst = 1;
	forever
	begin
	#10 if (light != 24'h000000)
		begin
		err<=1;
		end
	else
		begin
		err<=err;
		end
	end

//testing that lights do not reach black or white if button not held (and reset off, select on)
rst = 0;
button = 0;
forever
	begin #10 if ((light == 24'h000000) || (light == 24'hFFFFFF))
		begin
		err<=1;
		end
	else
		begin
		err<=err;
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
	  $display("***TEST FAILED! :( ***");
        $finish;
	end

//Instantiating selector top:
selecter top(clka, sel, rst, button, light);

endmodule
