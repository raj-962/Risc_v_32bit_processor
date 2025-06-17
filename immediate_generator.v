
// Immediate Generator Module
// Generates 32-bit sign-extended immediates based on instruction format (I-type, S-type, B-type)
module Immidiate_generator ( instruction , ImmExt);
           
    input wire [31:0] instruction;     // 32-bit instruction word
    output reg [31:0] ImmExt;      // 32-bit extended immediate output

    always @(*) begin
        case(instruction[6:0])

    7'b0010011: ImmExt = {{20{instruction[31]}}, instruction[31:20]}; // I-type  
    7'b0000011: ImmExt = {{20{instruction[31]}}, instruction[31:20]}; // Load-type
    7'b0100011: ImmExt = {{20{instruction[31]}}, instruction[31:25], instruction[11:7]}; // Store-type
    7'b1100011: ImmExt = {{19{instruction[31]}}, instruction[7], instruction[30:25], instruction[11:8], 1'b0}; // B-type 
    7'b0110111: ImmExt = {instruction[31:12], 12'b0}; // U-type
	7'b0010111: ImmExt = {instruction[31:12], 12'b0}; // U-type
    7'b1101111: ImmExt = {{11{instruction[31]}}, instruction[19:12], instruction[20], instruction[30:21], 1'b0}; // J-type

    default: begin
        ImmExt = 32'b0;
    end

    endcase
    end

endmodule