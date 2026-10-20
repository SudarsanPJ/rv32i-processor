// all invalid instructions send a 4'b1111 right now. maybe can be used later.
//ALU cant handle it right now. maybe add that as well later.
//requires funct7 validation for remaining R types. right now, if funct3 val is correct. it will work no matter
// the funct7 value. doesnt seem too important right now. maybe needed later.
// I type dont need funct7 validation, except for SRLI/SRAI
module alu_controller(
    input [1:0] alu_op,
    input [2:0] funct3,
    input [6:0] funct7,
    output reg [3:0] alu_control
    );
    always @(*) begin
    case(alu_op)
        2'b00 : alu_control = 4'b0000; // force add.
        2'b01 : begin // R type. check funct3
            case(funct3)
                3'b000 : begin // ADD or SUB. check funct7
                if (funct7 == 7'b0000000) alu_control = 4'd0;
                else if(funct7 == 7'b0100000) alu_control = 4'd1;
                else alu_control = 4'b1111;
                end
                3'b001 : alu_control = 4'd5; //SLL
                3'b010 : alu_control = 4'd8; //SLT
                3'b011 : alu_control = 4'd9; //SLTU
                3'b100 : alu_control = 4'd4; //XOR
                3'b101 : begin //SRL or SRA. check funct7
                if (funct7 == 7'b0000000) alu_control = 4'd6;
                else if(funct7 == 7'b0100000) alu_control = 4'd7;
                else alu_control = 4'b1111;
                end
                3'b110 : alu_control = 4'd3; //OR
                3'b111 : alu_control = 4'd2; //AND
                default : alu_control = 4'b1111;
            endcase
        end
        2'b10 : begin // I type. check funct3
        case(funct3)
            3'b000 : alu_control = 4'd0; //ADDI 
            3'b010 : alu_control = 4'd8; //SLTI
            3'b011 : alu_control = 4'd9; //SLTIU
            3'b100 : alu_control = 4'd4; //XORI
            3'b110 : alu_control = 4'd3; //ORI
            3'b111 : alu_control = 4'd2; //ANDI
            3'b001 : alu_control = 4'd5; // SLLI
            3'b101 : begin //SRAI or SRLI
            if(funct7 == 7'b0000000) alu_control = 4'd6; // SRLI
            else if(funct7 == 7'b0100000) alu_control = 4'd7; // SRAI
            else alu_control = 4'b1111;
            end
            default : alu_control = 4'b1111;
        endcase
        end
        2'b11 : alu_control = 4'b0001; // SUB for BEQ
        default: alu_control = 4'b1111;
    endcase
    end
endmodule
