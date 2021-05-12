module Gan(Out, current_state, i, clk);
	input clk, i;
	input [7:0] current_state;
	output reg Out;
	
	always @ (posedge clk)
	begin
		if(current_state == 8'd9)
			Out <= i;
		else
			Out <= Out;
	end
endmodule