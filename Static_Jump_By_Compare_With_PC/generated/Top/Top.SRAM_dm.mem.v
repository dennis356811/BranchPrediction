module BindsTo_1_SRAM_dm(
  input         clock,
  input  [3:0]  io_w_en,
  input  [15:0] io_address,
  input  [31:0] io_write_data,
  output [31:0] io_read_data,
  input         io_mem_read_test,
  input  [31:0] io_mem_addr_test,
  output [31:0] io_mem_data_test
);

initial begin
  $readmemh("./src/main/scala/Pipeline/prog0/prog0.hex", SRAM_dm.mem);
end
                      endmodule

bind SRAM_dm BindsTo_1_SRAM_dm BindsTo_1_SRAM_dm_Inst(.*);