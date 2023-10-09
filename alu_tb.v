`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09.10.2023 17:25:27
// Design Name: 
// Module Name: alu_tb
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


module alu_tb;
 reg[7:0] A,B;
 reg[3:0] ALU_Sel;
 wire[7:0] ALU_Out;
 wire CarryOut;
 
 integer i;
 alu test_unit(
            A,B,          
            ALU_Sel,
            ALU_Out, 
            CarryOut 
     );
    initial begin
      A = 8'h08;
      B = 4'h09;
      ALU_Sel = 4'h0;
      for (i=0;i<=15;i=i+1)
      begin
       ALU_Sel = ALU_Sel + 8'h01;
       #10;
      end
      A = 8'h03;
      B = 8'h01;
      
    end
endmodule
