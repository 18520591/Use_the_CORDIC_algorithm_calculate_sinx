module check(Out, current_state, k5, reset, clk);
	input clk, reset, k5;
	input [3:0] current_state;
	output reg Out;
	
	always @ (posedge clk, posedge reset)
	begin
		if(reset)
			Out <= 1'b0;
		else
		begin
			if(current_state == 4'd3 && k5 == 1'b1)
				Out <= 1'b1;
			else
				Out <= Out;
		end
	end

endmodule