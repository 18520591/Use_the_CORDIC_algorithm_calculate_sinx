module Tinhxy(x0, y0, m1, x, y, s, x_Sel, y_Sel, I_Sel, x_En, y_En, clk, reset);
	input [31:0] x, y, m1;	
	input s, x_Sel, y_Sel, x_En, y_En, clk, reset, I_Sel;
	output [31:0] x0, y0;
	
	wire [31:0] x1, x2, x3, x4, x5, x6, x7, x8, y1, y2, y3, y4, y5, y6, y7, y8, xy, xy1;
	
	// tinh x1, y1
	assign xy = (I_Sel) ? m1 : xy1;
	Register r5(xy1, xy, clk, reset);
	assign x2 = (x_Sel) ? x : x1;
	assign y2 = (y_Sel) ? y : y1;
	Floating_Point_Multiplier mul1(x3, y2, xy1);
	Floating_Point_Multiplier mul2(y3, x2, xy1);
	Floating_Point_Adder add1(x4, x2, x3);
	Floating_Point_Sub sub1(x5, x2, x3);
	Floating_Point_Adder add2(y4, y2, y3);
	Floating_Point_Sub sub2(y5, y2, y3);
	assign x6 = (s) ? x4 : x5;
	assign y6 = (s) ? y5 : y4;
	Register r1(x7, x6, clk, reset);
	Register r2(y7, y6, clk, reset);
	Register r3(x8, x2, clk, reset);
	Register r4(y8, y2, clk, reset);
	assign x1 = (x_En) ? x7 : x8;
	assign y1 = (y_En) ? y7 : y8;
	assign x0 = x7;
	assign y0 = y7;
	
endmodule	