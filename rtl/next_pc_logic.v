module next_pc_logic(
    input [31:0] pc,
    input [31:0] read_data1,
    input [31:0] immediate,
    input branch,
    input [1:0] next_pc_sel,
    output reg [31:0] next_pc,
    output [31:0] pcplus4
    );
    assign pcplus4 = pc + 32'd4;
    always @(*) begin
    case(next_pc_sel)
    2'b00 : next_pc = pc + 32'd4;
    2'b01 : begin if(branch) next_pc = pc + immediate;
            else next_pc = pc + 4;
            end
    2'b10 : next_pc = pc + immediate;
    2'b11 : next_pc = (read_data1 + immediate) & ~32'd1;
    default: next_pc = pc + 32'd4;
    endcase
    end
endmodule
