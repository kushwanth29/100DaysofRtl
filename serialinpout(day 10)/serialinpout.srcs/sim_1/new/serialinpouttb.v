module sipo_shift_register_tb;

reg clk;
reg rst;
reg shift_en;
reg data_in;
wire [7:0] data_out;

sipo_shift_register uut (
    .clk(clk),
    .rst(rst),
    .shift_en(shift_en),
    .data_in(data_in),
    .data_out(data_out)
);

initial begin
    clk = 0;
    forever #5 clk = ~clk;
end

initial begin
    rst = 1;
    shift_en = 0;
    data_in = 0;
    #10 rst = 0;
    #10 shift_en = 1;
    #10 data_in = 1;
    #10 data_in = 0;
    #10 data_in = 1;
    #10 data_in = 0;
    #10 shift_en = 0;
    #10 data_in = 1;
    #10 $finish;
end

endmodule
