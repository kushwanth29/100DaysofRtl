`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/13/2023 02:42:31 PM
// Design Name: 
// Module Name: seqdettb
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


module seqdettb;
reg clk = 0;
    reg reset = 0;
    reg seqin = 0;
    
    // Outputs
    wire seqdet;
    
    // Instantiate sequence detector module
    seqdet dut(
        .clk(clk),
        .reset(reset),
        .seqin(seqin),
        .seqdet(seqdet)
    );
    
    initial begin
        // Reset sequence detector
        reset = 1;
        #10 reset = 0;
        
        // Test case 1: no sequence detected
        seqin = 0;
        #5 seqin = 1;
        #5 seqin = 0;
        #5 seqin = 1;
        #5 seqin = 1;
        #20;
        if (seqdet) $display("Test case 1 failed: sequence detected when it shouldn't have.");
        else $display("Test case 1 passed.");
        
        // Test case 2: sequence detected
        seqin = 1;
        #5 seqin = 1;
        #5 seqin = 1;
        #5 seqin = 0;
        #5 seqin = 1;
        #20;
        if (!seqdet) $display("Test case 2 failed: sequence not detected.");
        else $display("Test case 2 passed.");
        
        // Test case 3: sequence detected twice
        seqin = 1;
        #5 seqin = 1;
        #5 seqin = 1;
        #5 seqin = 0;
        #5 seqin = 1;
        #5 seqin = 1;
        #5 seqin = 1;
        #5 seqin = 0;
        #5 seqin = 1;
        #20;
        if (!seqdet) $display("Test case 3 failed: sequence not detected.");
        else $display("Test case 3 passed.");
        
        // End simulation
        #10 $finish;
    end
    
    // Toggle clock
    always #5 clk <= ~clk;
    
endmodule


