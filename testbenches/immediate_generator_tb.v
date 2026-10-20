module immediate_generator_tb(

    );

    reg [31:0] instruction;
    reg [2:0] imm_type;
    wire [31:0] immediate;

    immediate_generator uut(
        .instruction(instruction),
        .imm_type(imm_type),
        .immediate(immediate)
    );

    initial begin

        // I-type
        imm_type = 3'b000;
        instruction = 32'h00500000; // +5
        #10;

        instruction = 32'hFFF00000; // -1
        #10;


        // S-type
        imm_type = 3'b001;
        instruction = 32'h00500080; // +1
        #10;

        instruction = 32'hFE000F80; // -1
        #10;


        // B-type
        imm_type = 3'b010;
        instruction = 32'h00000100;
        #10;

        instruction = 32'h80000000;
        #10;


        // U-type
        imm_type = 3'b011;
        instruction = 32'h12345000;
        #10;


        // J-type
        imm_type = 3'b100;
        instruction = 32'h00001000;
        #10;

        instruction = 32'h80000000;
        #10;


        $finish;
    end

endmodule