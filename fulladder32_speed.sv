module fulladder32_speed(
    input  logic [31:0] a_i,
    input  logic [31:0] b_i,
    input  logic       carry_i,
    output logic [31:0] sum_o,
    output logic       carry_o
);
  logic [3:0] carry;
  logic [31:0] sum_partial;
  
  fulladder4_speed fa0 (
    .a_i(a_i[3:0]),
    .b_i(b_i[3:0]),
    .carry_i(carry_i),
    .sum_o(sum_partial[3:0]),
    .carry_o(carry[0])
  );
  
  fulladder4_speed fa1 (
    .a_i(a_i[7:4]),
    .b_i(b_i[7:4]),
    .carry_i(carry[0]),
    .sum_o(sum_partial[7:4]),
    .carry_o(carry[1])
  );
  
  fulladder4_speed fa2 (
    .a_i(a_i[11:8]),
    .b_i(b_i[11:8]),
    .carry_i(carry[1]),
    .sum_o(sum_partial[11:8]),
    .carry_o(carry[2])
  );
  
  fulladder4_speed fa3 (
    .a_i(a_i[15:12]),
    .b_i(b_i[15:12]),
    .carry_i(carry[2]),
    .sum_o(sum_partial[15:12]),
    .carry_o(carry[3])
  );
  
  fulladder4_speed fa4 (
    .a_i(a_i[19:16]),
    .b_i(b_i[19:16]),
    .carry_i(carry[3]),
    .sum_o(sum_partial[19:16]),
    .carry_o(carry[4])
  );
  
  fulladder4_speed fa5 (
    .a_i(a_i[23:20]),
    .b_i(b_i[23:20]),
    .carry_i(carry[4]),
    .sum_o(sum_partial[23:20]),
    .carry_o(carry[5])
  );
  
  fulladder4_speed fa6 (
    .a_i(a_i[27:24]),
    .b_i(b_i[27:24]),
    .carry_i(carry[5]),
    .sum_o(sum_partial[27:24]),
    .carry_o(carry[6])
  );
  
  fulladder4_speed fa7 (
    .a_i(a_i[31:28]),
    .b_i(b_i[31:28]),
    .carry_i(carry[6]),
    .sum_o(sum_partial[31:28]),
    .carry_o(carry[7])
  );

  assign carry_o = carry[7];
  assign sum_o = {sum_partial[31:28], sum_partial[27:24], sum_partial[23:20], sum_partial[19:16], sum_partial[15:12], sum_partial[11:8], sum_partial[7:4], sum_partial[3:0]};

endmodule
