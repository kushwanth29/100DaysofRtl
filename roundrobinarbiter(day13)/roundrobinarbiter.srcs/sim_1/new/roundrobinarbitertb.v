`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/14/2023 02:03:10 PM
// Design Name: 
// Module Name: roundrobinarbitertb
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


module roundrobinarbitertb( );


reg clk;
  reg reset;
  reg [3:0] req;
  wire [3:0] gnt;
  
  //Instantiate Design Under Test
  
  roundrobinarbiter DUT(.clk(clk), .reset(reset), .req(req), .gnt(gnt));
  
  //Generate a 10 ns  Time Period Clock 
  always #5 clk = ~clk;
  
  //Drive the DUT or Generate stimuli for the DUT
  
  initial begin
    clk = 0;
    reset = 1;
    req = 4'b0;
    
    #5 reset = 1;
    
    @(negedge clk) req = 4'b1000;    
    
    @(negedge clk) req = 4'b1010;
    
    @(negedge clk) req = 4'b0010;
    
    @(negedge clk) req = 4'b0110;
    
    @(negedge clk) req = 4'b1110;
    
    @(negedge clk) req = 4'b1111;
    
    @(negedge clk) req = 4'b0100;
    
    @(negedge clk) req = 4'b0010;
    
    #5 reset = 0;
    
    #100 $finish;
  end
  endmodule 
