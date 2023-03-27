`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/27/2023 07:28:22 PM
// Design Name: 
// Module Name: selfcounter
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

module counter_load(
    input clk, rst, load,
    input [7:0] data_in,
    output reg [7:0] count
);
    always @(posedge clk) begin
        if (rst) begin
            count <= 8'h00;
        end else if (load) begin
            count <= data_in;
        end else begin
            count <= count + 1;
        end
    end
endmodule