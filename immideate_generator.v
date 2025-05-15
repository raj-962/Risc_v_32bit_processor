// Immediate Generator Module
// Generates 32-bit sign-extended immediates based on instruction format (I-type, S-type, B-type)

module Immidiate_generator ( Opcode , instruction , ImmExt);
    input wire [6:0] Opcode;           // 7-bit Opcode field from instruction to identify format
    input wire [31:0] instruction;     // 32-bit instruction word
    output reg [31:0] ImmExt;      // 32-bit extended immediate output

    always @(*) begin
        casez (Opcode)

            7'b0000011: begin
                // I-type (e.g., lw)
                ImmExt = {{20{instruction[31]}}, instruction[31:20]};
            end

            7'b0100011: begin
                // S-type (e.g., sw)
                ImmExt = {{20{instruction[31]}}, instruction[31:25], instruction[11:7]};
            end

            7'b1100011: begin
                // B-type (e.g., beq)
                ImmExt = {{19{instruction[31]}}, instruction[31], instruction[7],
                          instruction[30:25], instruction[11:8], 1'b0};
            end

            default: begin
                ImmExt = 32'b0;
            end

        endcase
    end

endmodule
