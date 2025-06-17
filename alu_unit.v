// Alu unit of the bloc perform and or sub etc
module alu_unit ( A , B , control_in , zero , ALU_out );

    input [31:0]A;
    input [31:0]B;
    input [3:0]control_in;
    output reg zero ;
    output reg [31:0] ALU_out;

  

         always @(A or B or control_in) begin
            case (control_in)
             4'b0000: ALU_out = A + B;           		// ADD
             4'b0001: ALU_out = A - B;           		// SUB
             4'b0010: ALU_out = A & B;           		// AND
             4'b0011: ALU_out = A | B;           		// OR
             4'b0100: ALU_out = A ^ B;           		// XOR
             4'b0101: ALU_out = A << B[4:0];     		// SLL (Shift Left Logical)
             4'b0110: ALU_out = A >> B[4:0];     		// SRL (Shift Right Logical)
             4'b0111: ALU_out = $signed(A) >>> B[4:0];    // SRA (Shift Right Arithmetic)
             4'b1000: ALU_out =($signed(A) < $signed(B)) ? 32'b1 : 32'b0;
            default: ALU_out = 32'b0;          		
            endcase

        
        zero = (ALU_out == 32'b0) ? 1 : 0;
    end

    


endmodule //alu_unit