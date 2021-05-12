module cosxcos (Out, i, E, clk, reset);
	input clk, reset, E;
	input [4:0] i;
	output reg [31:0] Out;
	
	reg [31:0] cos[8:0];
	wire[31:0] I;
	always @ (posedge clk, posedge reset)
	begin
		if(reset)
		begin
			cos[0] <= 32'b00111111001101010000010011110011;
			cos[1] <= 32'b00111111011001001111100100101110;
			cos[2] <= 32'b00111111011110000101101101000010;
			cos[3] <= 32'b00111111011111100000010111101100;
			cos[4] <= 32'b00111111011111111000000001011111;
			cos[5] <= 32'b00111111011111111110000000000101;
			cos[6] <= 32'b00111111011111111111100000000000;
			cos[7] <= 32'b00111111011111111111111000000000;
			cos[8] <= 32'b00111111011111111111111110000000;
			Out <= 32'b00111111001101010000010011110011;
		end
		else
		begin
			if(E)
				Out <= I;
			else
				Out <= Out;
		end
	end
	
	Floating_Point_Multiplier mul1(I, Out, cos[i]);

endmodule