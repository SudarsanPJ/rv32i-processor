module program_counter(
    input clk, rst,
    input [31:0] next_pc,
    output reg [31:0] pc
    );
    always @(posedge clk) begin
    if(rst) pc <= 0;
    else pc <= next_pc;
    end
endmodule
