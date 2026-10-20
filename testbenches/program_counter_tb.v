module program_counter_tb();

    reg clk;
    reg rst;
    reg [31:0] next_pc;
    wire [31:0] pc;

    program_counter uut(
        .clk(clk),
        .rst(rst),
        .next_pc(next_pc),
        .pc(pc)
    );

    always #5 clk = ~clk;

    initial begin
        clk = 0;
        rst = 1;
        next_pc = 0;

        #10;                 // rising edge → reset PC to 0

        rst = 0;
        next_pc = 32'd4;
        #10;                 // rising edge → PC = 4

        next_pc = 32'd8;
        #10;                 // rising edge → PC = 8

        next_pc = 32'd12;
        #10;                 // rising edge → PC = 12

        next_pc = 32'd16;
        #10;                 // rising edge → PC = 16

        $finish;
    end

endmodule