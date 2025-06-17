
// Data memory used to store the data
module data_memory ( clk , rst , Mem_Write , Mem_Read , Read_addr , Write_Data , Mem_data_out );

input clk , rst, Mem_Write , Mem_Read;
input [31:0] Read_addr , Write_Data;
output  [31:0] Mem_data_out;

reg [31:0] D_Memory [63:0];
integer i;

  assign Mem_data_out = (Mem_Read) ? D_Memory[Read_addr] : 32'b00;

always @(posedge clk) begin
	D_Memory[17] = 56;
	D_Memory[15] = 65;
  D_Memory[28] = 88;
end

always @(posedge clk or posedge rst) begin
    if (rst ) begin
      for (i = 0; i < 64; i = i + 1) begin
        D_Memory[i] = 32'b00;
      end
    end else if (Mem_Write) begin
      D_Memory[Read_addr] = Write_Data;
    end
  end
               
endmodule //data_memory
