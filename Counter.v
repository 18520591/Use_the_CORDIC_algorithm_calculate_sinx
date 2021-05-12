module Counter(Out, In, En, reset, clk);
        input clk, reset, En;
        input[7:0] In; 
	output reg [7:0] Out;
	
	always @ (posedge clk, posedge reset)
	begin
		if(reset)
		begin
			Out <= 8'd1;
		end
		else
		begin
			if(En)
				Out <= In + 1'b1;
			else
				Out <= Out;
		end
	end
endmodule
