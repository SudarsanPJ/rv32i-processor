//Not complete. only 2 signals have been done so far to test R and I operations.
module alu_src_mux(
    input [31:0] read_data2,
    input [31:0] immediate,
    input [1:0] alu_src,
    output reg [31:0] operand_b
    );
    always @(*) begin
    case(alu_src)
        2'b00 : operand_b = read_data2;
        2'b01 : operand_b = immediate;
        default : operand_b = read_data2;
    endcase
    end
endmodule
