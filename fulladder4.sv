`timescale 1ns / 1ps



module fulladder4(
    input  logic [3:0] a_i,
    input  logic [3:0] b_i,
    input  logic       carry_i,
    output logic [3:0] sum_o,
    output logic       carry_o
    );
logic [3:0] carry_sign;

genvar i;
generate 
    for (i = 0; i < 4; i = i + 1) begin : newgen
        fulladder f (
        .a_i(a_i[i]),
        .b_i(b_i[i]),
        .carry_i(i==0 ? carry_i : carry_sign[i-1]),
        .sum_o(sum_o[i]),
        .carry_o(carry_sign[i]));
    end
    
endgenerate    

assign carry_o = carry_sign[3];

endmodule
