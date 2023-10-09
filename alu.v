`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09.10.2023 17:22:04
// Design Name: 
// Module Name: alu
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
module alu(
           input [7:0] A,B,  // ALU 8-bit Inputs                 
           input [3:0] ALU_Sel,// ALU Selection
           output [7:0] ALU_Out, // ALU 8-bit Output
           output CarryOut // Carry Out Flag
    );
    parameter Addition=4'b0000;
    parameter subtraction=4'b0001;
    parameter multiplication=4'b0010;
    parameter division=4'b0011;
    parameter logical_shift_left=4'b0100;
    parameter logical_shhift_right=4'b0101; 
    parameter rotate_left =4'b0110;
    parameter rotate_right =4'b0111;
    parameter AND =4'b1000;
    parameter OR=4'b1001;
    parameter XOR=4'b1010;
    parameter NOR=4'b1011;
    parameter NAND=4'b1100;
    parameter XNOR=4'b1101;
    
    reg [7:0] ALU_Result;
    wire [8:0] tmp;
    assign ALU_Out = ALU_Result; 
    assign tmp = {1'b0,A} + {1'b0,B};
    assign CarryOut = tmp[8]; 
    always @(*)
    begin
        case(ALU_Sel)
        4'b0000: 
           ALU_Result = A + B ; 
        4'b0001: 
           ALU_Result = A - B ;
        4'b0010: 
           ALU_Result = A * B;
        4'b0011: 
           ALU_Result = A/B;
        4'b0100: 
           ALU_Result = A<<1;
         4'b0101: 
           ALU_Result = A>>1;
         4'b0110: 
           ALU_Result = {A[6:0],A[7]};
         4'b0111:
           ALU_Result = {A[0],A[7:1]};
          4'b1000: 
           ALU_Result = A & B;
          4'b1001: 
           ALU_Result = A | B;
          4'b1010: 
           ALU_Result = A ^ B;
          4'b1011: 
           ALU_Result = ~(A | B);
          4'b1100: 
           ALU_Result = ~(A & B);
          4'b1101: 
           ALU_Result = ~(A ^ B);
          default: ALU_Result = A + B ; 
        endcase
    end

endmodule
