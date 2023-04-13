module priorityarbiter_tb;

  // Parameters
  parameter NUM_PORTS = 4;

  // Inputs
  reg [NUM_PORTS-1:0] req_i;

  // Outputs
  reg [NUM_PORTS-1:0] gnt_o;

  // Instantiate the module
  priorityarbiter #(
    .NUM_PORTS(NUM_PORTS)
  ) dut (
    .req_i(req_i),
    .gnt_o(gnt_o)
  );

  // Stimulus generation
  initial begin
    // Test case 1: Only one request
    req_i <= {1'b1, 1'b0, 1'b0, 1'b0};
    #10;
    $display("Test case 1: gnt_o = %b", gnt_o);

    // Test case 2: Multiple requests, one granted
    req_i <= {1'b1, 1'b1, 1'b0, 1'b0};
    #10;
    $display("Test case 2: gnt_o = %b", gnt_o);

    // Test case 3: Multiple requests, all granted
    req_i <= {1'b1, 1'b1, 1'b1, 1'b1};
    #10;
    $display("Test case 3: gnt_o = %b", gnt_o);

    // Test case 4: No requests
    req_i <= {1'b0, 1'b0, 1'b0, 1'b0};
    #10;
    $display("Test case 4: gnt_o = %b", gnt_o);

    // Test case 5: Multiple requests, none granted
    req_i <= {1'b1, 1'b1, 1'b1, 1'b1};
    #10;
    req_i <= {1'b0, 1'b0, 1'b0, 1'b0};
    #10;
    $display("Test case 5: gnt_o = %b", gnt_o);

    // End simulation
    $finish;
  end

endmodule
