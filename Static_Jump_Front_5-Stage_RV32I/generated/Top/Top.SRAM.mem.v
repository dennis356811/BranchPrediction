module BindsTo_0_SRAM(
  input         clock,
  input  [15:0] io_address,
  output [31:0] io_read_data
);

initial begin
  $readmemh("./src/main/scala/Pipeline/prog0/prog0.hex", SRAM.mem);
end
                      endmodule

bind SRAM BindsTo_0_SRAM BindsTo_0_SRAM_Inst(.*);