module Register(Out, In, clk, reset);
	input clk, reset;
	input [31:0] In;
	output reg [31:0] Out;
	always @ (posedge clk, posedge reset)
	begin
		if(reset)
			Out <= 32'd0;
		else	
			Out <= In;
	end
endmodule