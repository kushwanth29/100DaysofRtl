module shift_register (
    input clk,
    input rst,
    input shift_en,
    input [7:0] data_in,
    output reg [7:0] data_out
);

reg [7:0] shift_reg;

always @(posedge clk or posedge rst) begin
    if (rst) begin
        shift_reg <= 0;
    end else if (shift_en) begin
        shift_reg <= {data_in, shift_reg[7:1]};
    end
    data_out <= shift_reg;
end

endmodule
