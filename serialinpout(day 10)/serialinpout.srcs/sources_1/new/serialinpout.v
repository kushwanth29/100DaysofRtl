module sipo_shift_register (
    input clk,
    input rst,
    input shift_en,
    input data_in,
    output reg [7:0] data_out
);

reg [7:0] shift_reg;

always @(posedge clk or posedge rst) begin
    if (rst) begin
        shift_reg <= 0;
    end else if (shift_en) begin
        shift_reg <= {shift_reg[6:0], data_in};
    end
    data_out <= shift_reg;
end

endmodule
