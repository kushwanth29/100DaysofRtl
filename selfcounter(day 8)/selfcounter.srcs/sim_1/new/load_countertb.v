`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/27/2023 07:46:30 PM
// Design Name: 
// Module Name: load_countertb
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

module counter_load_tb;
    reg clk, rst, load;
    reg [7:0] data_in;
    wire [7:0] count;

    counter_load dut (.clk(clk), .rst(rst), .load(load), .data_in(data_in), .count(count));

    integer i;

    initial begin
        // Test case 1: Check if counter increments correctly
        clk = 0;
        rst = 1;
        load = 0;
        data_in = 8'h00;
        #5 rst = 0;

        for (i = 0; i < 10; i = i + 1) begin
            #10 clk = ~clk;
        end

        if (count !== 8'h0A) $error("Test case 1 failed.");

        // Test case 2: Check if counter resets correctly
        rst = 1;
        load = 0;
        data_in = 8'h00;
        #5 rst = 0;
        #10 rst = 1;

        for (i = 0; i < 10; i = i + 1) begin
            #10 clk = ~clk;
        end

        if (count !== 8'h00) $error("Test case 2 failed.");

        // Test case 3: Check if counter loads correctly
        rst = 1;
        load = 1;
        data_in = 8'h0F;
        #5 rst = 0;

        for (i = 0; i < 10; i = i + 1) begin
            #10 clk = ~clk;
        end

        if (count !== 8'h0F) $error("Test case 3 failed.");

        $display("All test cases passed.");
        $finish;
    end
endmodule

