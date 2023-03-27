`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/26/2023 07:10:47 PM
// Design Name: 
// Module Name: carrylookaddertb
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


module cla_adder_tb;

  reg [3:0] a, b;
  reg cin;
  wire [3:0] sum;
  wire cout;

  // Instantiate the module under test
  carrylookadder uut (
    .a(a),
    .b(b),
    .cin(cin),
    .sum(sum),
    .cout(cout)
  );

  initial begin
    // Testcase 1: Add 2+3 with carry in 0
    a = 2;
    b = 3;
    cin = 0;
    #10;
    $display("Testcase 1: %d + %d + %d = %d (carry = %d)", a, b, cin, sum, cout);
    
    // Testcase 2: Add 5+7 with carry in 1
    a = 5;
    b = 7;
    cin = 1;
    #10;
    $display("Testcase 2: %d + %d + %d = %d (carry = %d)", a, b, cin, sum, cout);
    
    // Testcase 3: Add 15+1 with carry in 0
    a = 15;
    b = 1;
    cin = 0;
    #10;
    $display("Testcase 3: %d + %d + %d = %d (carry = %d)", a, b, cin, sum, cout);
    
    // Testcase 4: Add 8+8 with carry in 1
    a = 8;
    b = 8;
    cin = 1;
    #10;
    $display("Testcase 4: %d + %d + %d = %d (carry = %d)", a, b, cin, sum, cout);
    
    // Finish the simulation
    #10;
    $finish;
  end

endmodule
