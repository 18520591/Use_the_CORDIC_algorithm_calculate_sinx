module SinX(Out, OE, next_state, current_state, In, start, clk, reset, i);
	input clk, reset, start;
	input[31:0] In;
	output [31:0] Out;
	output OE;
	output reg [3:0] next_state, current_state;

	reg [31:0] arctan[20:0];
	reg y_Sel, y_En, x_Sel, x_En, I_Sel,z_En, z_Sel, En, check, check1, s;
	reg [7:0] d3;
	reg [31:0] O, Ex_Fr;
	reg [31:0] z2;
	reg [31:0] x [0:31];
	reg [31:0] y [0:31];
	reg [31:0] z [0:31];
	
	
	output [7:0] i;
	wire k9;
	wire [31:0]  t3, t4, t5, t6, t7, t8, I4, I5, I6, I1, I2, I3, t1, t2, t, x2, y2;
	wire [31:0] m1, d1, m2, z1, z4, d4, x9, y9, z9, x0, y0, z0, I7, I8;
	wire k1, k2, k3, k4, k6, k7, k8, k10, rs, En_C, d2, d, k5;
	
	localparam [3:0]
		s0 = 4'b0000,
		s1 = 4'b0001,
		s2 = 4'b0010,
		s3 = 4'b0011,
		s4 = 4'b0100,
		s5 = 4'b0101,
		s6 = 4'b0110,
		s7 = 4'b0111,
		s8 = 4'b1000,
		s9 = 4'b1001,
		s10 = 4'b1010,
		s11 = 4'b1011,
		s12 = 4'b1100,
		s13 = 4'b1101,
		s14 = 4'b1110;
	
	always @ (posedge clk, posedge reset)
	begin
		if(reset)
		begin
			arctan[0] <= 32'b01000010001101000000000000000000;
			arctan[1] <= 32'b01000001110101001000010100111001;
			arctan[2] <= 32'b01000001011000001001010001110100;
			arctan[3] <= 32'b01000000111001000000000000100010;
			arctan[4] <= 32'b01000000011001001110001010101001;
			arctan[5] <= 32'b00111111111001010001101111001010;
			arctan[6] <= 32'b00111111011001010010101000011010;
			arctan[7] <= 32'b00111110111001010010110110101111;
			arctan[8] <= 32'b00111110011001010010111010010100;
			arctan[9] <= 32'b00111101111001010010111011001101;
			arctan[10] <= 32'b00111101011001010010111011011100;
			arctan[11] <= 32'b00111100111001010010111011011111;
			arctan[12] <= 32'b00111100011001010010111011100000;
			arctan[13] <= 32'b00111011111001010010111011100000;
			arctan[14] <= 32'b00111011011001010010111011100000;
			arctan[15] <= 32'b00111011111101010100011100011101;
			arctan[16] <= 32'b00111010011001010010111011100000;
			arctan[17] <= 32'b00111001111001010010111011100000;
			arctan[18] <= 32'b00111001011001010010111011100000;
			arctan[19] <= 32'b00111000111001010010111011100000;
			arctan[20] <= 32'b00111000011001010010111011100000;
			current_state <= s0;
		end
		else
			current_state <= next_state;
	end
	
	always @ (*)
	begin
		case (current_state)
			s0:
			begin
				En <= 1'b0;
				check <= 1'b0;
				check1 <= 1'b0;
				if(start)
					next_state <= s1;
				else
					next_state <= s0;
			end
			s1:
			begin
				next_state <= s2;
			end
			s2:
			begin
				if(k4)
					next_state <= s2;
				else
					next_state <= s3;
			end
			s3:
			begin
				if(k5)
					s <= ~In[31];
				else
					s <= In[31];
				next_state <= s4;
			end
			s4:
			begin
				if(z2[31])
				begin
					x[0] <= 32'b00111111000110110111010100000111;
					y[0] <= 32'b10111111000110110111010100000111;
				end
				else
				begin
					x[0] <= 32'b00111111000110110111010100000111;
					y[0] <= 32'b00111111000110110111010100000111;
				end
				z[0] <= z1;
				next_state <= s5;
			end
			s5:
			begin
				if (i > 8'd20)
				begin
					next_state <= s7;
				end
				else
				begin
					if(i==8'd1)
					begin
						x[i] <= x9;
						y[i] <= y9;
						z[i] <= z9;
					end
					else
					begin
						x[i] <= x0;
						y[i] <= y0;
						z[i] <= z0;
					end
					next_state <= s6;
				end
			end
			s6:
			begin
				d3 <= i;
				next_state <= s5;
			end
			s7:
			begin
				O <= {s, y[i-1][30:0]};
				next_state <= s0;
			end
		endcase
	end
	
	
	
	//xu ly so ve khoang 0-90
	//tru 360
	assign t = (current_state == 4'b0001) ? {1'b0, In[30:0]} : I1;
	compare_floating_point c4(k4, t, 32'b01000011101101000000000000000000);
	assign t1 = (k4) ? t : t2;
	Register r1(t2, t1, clk, reset);
	Floating_Point_Sub sub1(I1, t2, 32'b01000011101101000000000000000000);
	compare_floating_point c3(k3, {1'b0, In[30:0]}, 32'b01000011101101000000000000000000);
	assign I4 = (k3) ? t : {1'b0, In[30:0]};
	
	//tru 180
	//tru 90
	assign I3 = (current_state == 4'd3) ? I4 : I3;
	compare_floating_point CLP1(k5, I3, 32'b01000011001101000000000000000000);												
	Floating_Point_Sub FLS2(I5, 32'b01000011101101000000000000000000, I3);
	assign I6 = (k5) ? I5 : I3;
	compare_floating_point CLP2(k6, I6, 32'b01000010101101000000000000000000);
	Floating_Point_Sub FLS3 (I7, 32'b01000011001101000000000000000000, I6);
	assign I8 = (k6) ? I7 : I6;
	
	
	//cordic
	Floating_Point_Sub FLS1 (z1, I8, arctan[0]);
	
	tinhxyz xyz (x0, y0, z0, x[i-1], y[i-1], z[i-1], i, arctan[i]);
	
	assign x9 =	(current_state == 4'd4) ? x0 : x9;
	assign y9 = (current_state == 4'd4) ? y0 : y9;
	assign z9 = (current_state	== 4'd4) ? z0 : z9;
	
	Counter co1(i, d3, En_C, rs, clk);
	assign En_C = (current_state == 8'd6) ? 1'b1 : 1'b0;
	
	assign rs = (current_state == 4'b0000) ? 1'b1 : 1'b0;
	assign OE = (current_state == 4'd7) ? 1'b1 : 1'b0;
	assign Out = (OE) ? O : 32'dZ;
	
endmodule

