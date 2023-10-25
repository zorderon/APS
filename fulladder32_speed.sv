`timescale 1ns / 1ps

module fulladder32_speed(
    input  logic [31:0] a_i,
    input  logic [31:0] b_i,
    input  logic       carry_i,
    output logic [31:0] sum_o,
    output logic       carry_o
);
 logic [7:0] carry_sign;
genvar i;
generate 
    for (i = 0; i < 8; i = i + 1) begin : newgen
        fulladder4_speed f (
        .a_i(a_i[4*i+3:4*i]),
        .b_i(b_i[4*i+3:4*i]),
        .carry_i(i==0 ? carry_i : carry_sign[i-1]),
        .sum_o(sum_o[4*i+3:4*i]),
        .carry_o(carry_sign[i]));
    end
    
endgenerate    
assign carry_o = carry_sign[7];
    
endmodule
