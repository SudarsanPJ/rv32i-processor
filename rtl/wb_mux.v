module wb_mux(
    input [1:0] wb_sel,
    input [31:0] pcplus4,
    input [31:0] alu_result,
    output reg [31:0] write_data
    );
    always @(*) begin
    case(wb_sel)
        2'b00: write_data = alu_result;
        2'b10: write_data = pcplus4;
        default: write_data = 32'd0;
    endcase
    end
endmodule
