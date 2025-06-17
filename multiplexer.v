// Multiplexer 1
module mux_1( Sel1 , A1 , B1 , Mux1_out);
    input Sel1;
    input [31:0] A1,B1;
    output [31:0] Mux1_out;

    assign Mux1_out = (Sel1==1'b0)? A1 : B1;

endmodule 

// Multiplexer 2
module mux_2 ( Sel2 , A2 , B2 , Mux2_out);
    input Sel2;
    input [31:0] A2,B2;
    output [31:0] Mux2_out;

    assign Mux2_out = (Sel2==1'b0)? A2 : B2;
endmodule 

// Multiplexer 3
module mux_3 ( Sel3 , A3 , B3 , Mux3_out);
    input Sel3;
    input [31:0] A3,B3;
    output [31:0] Mux3_out;

    assign Mux3_out = (Sel3==1'b0)? A3 : B3;
endmodule 