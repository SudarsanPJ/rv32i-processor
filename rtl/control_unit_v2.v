module control_unit_v2(
    input  [6:0] opcode,

    output reg [1:0] alu_op,
    output reg [1:0] alu_src,
    output reg       reg_write,
    output reg       mem_read,
    output reg       mem_write,
    output reg [1:0] wb_sel,
    output reg [1:0] next_pc_sel,
    output reg [2:0] imm_type
    );
    always @(*) begin
        //default values so that i dont have to change every output in each case
        alu_op = 2'b00;
        alu_src = 2'b00;
        reg_write = 1'b0;
        mem_read = 1'b0;
        mem_write = 1'b0;
        wb_sel = 2'b00;
        next_pc_sel = 2'b00;
        imm_type = 3'b000;
        case(opcode)
            7'h33: begin //R
            alu_op = 2'b01;
            reg_write = 1'b1;
            end
            
            7'h13: begin //I
            alu_op = 2'b10;
            alu_src = 2'b01;
            reg_write = 1'b1;
            end
            
            7'h03: begin //LW
            alu_src = 2'b01;
            reg_write = 1'b1;
            mem_read = 1'b1;
            wb_sel = 2'b01;
            end
            
            7'h23: begin //SW
            alu_src = 2'b01;
            mem_write = 1'b1;
            imm_type = 3'b001;
            end
            
            7'h63: begin //B type
            alu_op = 2'b11;
            imm_type = 3'b010;
            next_pc_sel = 2'b01;
            end
            
            7'h37: begin //U LUI
            alu_src = 2'b10;
            reg_write = 1'b1;
            imm_type = 3'b011;
            end
            
            7'h17: begin //U AUIPC
            alu_src = 2'b11;
            reg_write = 1'b1;
            imm_type = 3'b011;
            end
            
            7'h6F: begin // JAL
            reg_write = 1'b1;
            wb_sel = 2'b10;
            next_pc_sel = 2'b10;
            imm_type = 3'b100;
            end
            
            7'h67: begin // JALR
            alu_src = 2'b01;
            reg_write = 1'b1;
            wb_sel = 2'b10;
            next_pc_sel = 2'b11;
            imm_type = 3'b000; //idk why this is needed but let it be.
            end
        endcase
    end
endmodule