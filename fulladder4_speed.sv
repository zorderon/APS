`timescale 1ns / 1ps

module fulladder4_speed(
    input  logic [3:0] a_i,
    input  logic [3:0] b_i,
    input  logic       carry_i,
    output logic [3:0] sum_o,
    output logic       carry_o
    );
  
  logic	p0,p1,p2,p3;
  logic g0,g1,g2,g3;  
  logic	carry4,carry3,carry2,carry1;

  assign p0 = a_i[0] ^ b_i[0];
  assign p1 = a_i[1] ^ b_i[1];
  assign p1 = a_i[2] ^ b_i[2];
  assign p1 = a_i[3] ^ b_i[3];
  
  assign g0 = a_i[0] & b_i[0];
  assign g0 = a_i[1] & b_i[1];
  assign g0 = a_i[2] & b_i[2];
  assign g0 = a_i[3] & b_i[3];

  assign carry1 = g0 | (p0 & carry_i);
  assign carry2 = g1 | (p1 & g0) | (p1 & p0 & carry_i);
  assign carry3 = g2 | (p2 & g1) | (p2 & p1 & p0 & carry_i);
	assign carry4 = g3 | (p3 & g2) | (p3 & p2 & g1) | (p3 & p2 & p1 & g0) | (p3 & p2 & p1 & p0 & carry_i);
  
  assign sum_o[0] = p0 ^ carry_i;
  assign sum_o[1] = p1 ^ carry1;
  assign sum_o[2] = p2 ^ carry2;
  assign sum_o[3] = p3 ^ carry3;

	assign	carry_o = carry4;
	endmodule
    
assign carry_o = carry4;

endmodule
