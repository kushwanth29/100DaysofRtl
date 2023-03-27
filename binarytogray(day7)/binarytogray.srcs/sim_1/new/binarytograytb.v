`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/27/2023 06:54:07 PM
// Design Name: 
// Module Name: binarytograytb
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


module binarytograytb(    );
reg [3:0]binary;
wire [3:0]gray;
binarytogray aad(.binary(binary),.gray(gray));
initial begin
#100
// Test case 1
        binary = 4'b0000;
        #10;
        if (gray !== 4'b0000) $error("Test case 1 failed.");
        
        // Test case 2
        binary = 4'b0001;
        #10;
        if (gray !== 4'b0001) $error("Test case 2 failed.");
        
        // Test case 3
        binary = 4'b0010;
        #10;
        if (gray !== 4'b0011) $error("Test case 3 failed.");
        
        // Test case 4
        binary = 4'b0100;
        #10;
        if (gray !== 4'b0110) $error("Test case 4 failed.");
        
        // Test case 5
        binary = 4'b1111;
        #10;
        if (gray !== 4'b1010) $error("Test case 5 failed.");
        
        // Test case 6
        binary = 4'b1101;
        #10;
        if (gray !== 4'b1011) $error("Test case 6 failed.");
        
        // Test case 7
        binary = 4'b1010;
        #10;
        if (gray !== 4'b1101) $error("Test case 7 failed.");
        
        $display("All test cases passed.");
        $finish;



    end
endmodule
