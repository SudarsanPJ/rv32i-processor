module branch_unit(
    input [2:0] funct3,
    input [31:0] read_data1,
    input [31:0] read_data2,
    output reg branch
    );
    always @(*) begin
    case(funct3)
    3'b000: branch = (read_data1 == read_data2); //BEQ
    3'b001: branch = (read_data1 != read_data2); //BNE
    3'b100: branch = ($signed(read_data1) < $signed(read_data2)); //BLT
    3'b101: branch = ($signed(read_data1) >= $signed(read_data2)); //BGE
    3'b110: branch = (read_data1 < read_data2); //BLTU
    3'b111: branch = (read_data1 >= read_data2); //BGEU
    default: branch = 1'b0;
    endcase
    end
endmodule
