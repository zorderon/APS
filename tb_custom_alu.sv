`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 24.09.2023 18:02:51
// Design Name: 
// Module Name: tb_custom_alu
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

import alu_opcodes_pkg::*;
module tb_custom_alu;
    reg [31:0] a_i;
    reg [31:0] b_i;
    reg [4:0] alu_op_i;
    
    wire flag_o;
    wire [31:0] result_o;
    
    alu_riscv DUT (
        .a_i(a_i),
        .b_i(b_i),
        .alu_op_i(alu_op_i),
        .flag_o(flag_o),
        .result_o(result_o)
    );
    
    
    
    initial begin
        
        //  ALU_ADD
        #10;
        a_i = 10;
        b_i = 5;
        alu_op_i = ALU_ADD;
        #10;
        $display("ALU_ADD: result = %d, flag = %b", result_o, flag_o);
        
        //  ALU_SUB
        #10;
        a_i = 10;
        b_i = 5;
        alu_op_i = ALU_SUB;
        #10;
        $display("ALU_SUB: result = %d, flag = %b", result_o, flag_o);
        
        //  ALU_XOR
        #10;
        a_i = 10;
        b_i = 5;
        alu_op_i = ALU_XOR;
        #10;
        $display("ALU_XOR: result = %d, flag = %b", result_o, flag_o);
        
        //  ALU_OR
        #10;
        a_i = 10;
        b_i = 5;
        alu_op_i = ALU_OR;
        #10;
        $display("ALU_OR: result = %d, flag = %b", result_o, flag_o);
        
        //  ALU_AND
        #10;
        a_i = 10;
        b_i = 5;
        alu_op_i = ALU_AND;
        #10;
        $display("ALU_AND: result = %d, flag = %b", result_o, flag_o);
        
        //  ALU_SRA
        #10;
        a_i = 10;
        b_i = 2;
        alu_op_i = ALU_SRA;
        #10;
        $display("ALU_SRA: result = %d, flag = %b", result_o, flag_o);
        
        // ALU_SRL
        #10;
        a_i = 10;
        b_i = 2;
        alu_op_i = ALU_SRL;
        #10;
        $display("ALU_SRL: result = %d, flag = %b", result_o, flag_o);
        
       
        $finish;
    end

endmodule
