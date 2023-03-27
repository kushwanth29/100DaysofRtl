`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/27/2023 06:32:09 PM
// Design Name: 
// Module Name: binarytogray
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


module binarytogray(input [3:0] binary, output reg [3:0] gray);
      integer i;
    always @(*) begin
  
        for (i = 0; i < 3; i = i + 1) begin 
            gray[i] = binary[i] ^ binary[i+1];
        end
        gray[3] = binary[3];
    end
endmodule
