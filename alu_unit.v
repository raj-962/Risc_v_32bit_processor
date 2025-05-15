// Alu unit of the bloc perform and or sub etc

module alu_unit ( A , B , control_in , zero , ALU_out );

    input [31:0]A,B;
    input [3:0]control_in;
    output reg zero ;
    output reg [31:0] ALU_out;

    always@(*)begin

        case(control_in)

        4'b0000 : begin zero <= 0 ; ALU_out = A & B; end  // and
        4'b0001 : begin zero <= 0 ; ALU_out = A | B;end // or
        4'b0010 : begin zero <= 0 ; ALU_out = A + B;end // add
        4'b0110 : begin 
        if (A == B) begin
                        zero <= 1;
                        ALU_out <= 0;  // Define output explicitly
                     end
        else    begin
                    zero <= 0;
                    ALU_out <= A - B;
                end
        end
        default : begin zero <= 0 ; ALU_out <= 0;end   //added now

        endcase

        end

    


endmodule //alu_unit