// Data memory used to stroe the data

//tb related data commented in this chj

module data_memory ( clk , rst , Mem_Write , Mem_Read , Read_addr , Write_Data , Mem_data_out );

    input clk , rst, Mem_Write , Mem_Read;
    input [31:0] Read_addr , Write_Data;
    output reg [31:0] Mem_data_out;

    integer i;

    reg [31:0] D_Memory [63:0];


    always @(posedge clk or posedge rst) begin
        if (rst) begin
                for (i=0; i<64 ; i = i+1 )
                D_Memory[i] <= 32'b00;
        end
        else if (Mem_Write)
            D_Memory[Read_addr] <= Write_Data;
        
       
        Mem_data_out <= (Mem_Read) ? D_Memory[Read_addr] : 32'b0;
    end 
    
 
            
endmodule //data_memory