module LuyThua(Out, k, i, clk, reset);
	input clk, reset;
	input [7:0] i;
	output [31:0] Out;
	output reg k;
	
	wire[31:0] I;
	reg [7:0] j;
	
	reg[31:0] I1;
	
	always @ (posedge clk, posedge reset)
	begin
		if(reset)
		begin
			I1 <= 32'b00111111100000000000000000000000;
			j <= 8'd0;
			k <= 1'b0;
		end
		else
		begin
			if(j<i)
			begin
				I1 <= I;
				j <= j + 1'b1;
			end
			else
			begin
				I1 <= I1;
				k <= 1'b1;
			end
			
		end
		
	end
	
	Floating_Point_Multiplier mul(I, I1, 32'b00111111000000000000000000000000);
	assign Out = I1;
	
endmodule