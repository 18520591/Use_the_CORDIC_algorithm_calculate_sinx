module ShiftRight(Out, In, i);
	input [4:0] i;
	input [31:0] In;
	output [31:0] Out;
	
	wire [7:0] Exponent, Exponent_new;
	
	assign Exponent = In[30:23];
	assign Exponent_new = Exponent - i;
	assign Out = {In[31], Exponent_new, In[22:0]};
	
endmodule