module Tinhz(zo, z, arctan, z_Sel, z_En, I_Sel, s, clk, reset);
	input clk, reset, z_En, z_Sel, s, I_Sel;
	input [31:0] z, arctan;
	output [31:0] zo;
	
	wire [31:0] z1, z2, z3, z4, z5, z6, z7, z8, z9;
	//tinh z
	assign z8 = (I_Sel) ? arctan : z9;
	Register r3(z9, z8, clk, reset);
	assign z2 = (z_Sel) ? z : z1;
	Floating_Point_Adder add1(z3, z2, z9);
	Floating_Point_Sub sub1(z4, z2, z9);
	assign z5 = (s) ? z3 : z4;
	Register r1(z6, z5, clk, reset);
	Register r2(z7, z2, clk, reset);
	assign z1 = (z_En) ? z6 : z7;
	assign zo = z6;
	

endmodule
