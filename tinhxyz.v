module tinhxyz(x1, y1, z1, x0, y0, z0, i, arctan);
	input [4:0] i;
	input [31:0] x0, y0, z0, arctan;
	output [31:0] x1, y1, z1;
	
	wire [31:0] x2, x3, x4, y2, y3, y4, z2, z3;
	
	ShiftRight SR1 (y2, y0, i);
	ShiftRight SR2 (x2, x0, i);
	Floating_Point_Adder FLA1 (x3, x0, y2);
	Floating_Point_Sub FLS1 (x4, x0, y2);
	Floating_Point_Adder FLA2 (y3, y0, x2);
	Floating_Point_Sub FLS2 (y4, y0, x2);
	Floating_Point_Adder FLA3 (z2, z0, arctan);
	Floating_Point_Sub FLS3 (z3, z0, arctan);
	
	assign x1 = (z0[31]) ? x3 : x4;
	assign y1 = (z0[31]) ? y4 : y3;
	assign z1 = (z0[31]) ? z2 : z3;
endmodule	