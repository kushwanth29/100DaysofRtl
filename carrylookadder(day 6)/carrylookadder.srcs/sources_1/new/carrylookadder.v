`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/26/2023 07:09:40 PM
// Design Name: 
// Module Name: carrylookadder
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


module carrylookadder(
  input [3:0] a,
  input [3:0] b,
  input cin,
  output [3:0] sum,
  output cout
);

  wire [3:0] g, p;
  wire c1, c2, c3;

  assign g[0] = a[0] & b[0];
  assign p[0] = a[0] ^ b[0];
  
  assign g[1] = a[1] & b[1];
  assign p[1] = a[1] ^ b[1];
  
  assign g[2] = a[2] & b[2];
  assign p[2] = a[2] ^ b[2];
  
  assign g[3] = a[3] & b[3];
  assign p[3] = a[3] ^ b[3];
  
  assign c1 = g[0];
  assign c2 = g[1] | (p[1] & c1);
  assign c3 = g[2] | (p[2] & c2);
  assign cout = g[3] | (p[3] & c3);

  assign sum = a + b + cin;

endmodule
    
