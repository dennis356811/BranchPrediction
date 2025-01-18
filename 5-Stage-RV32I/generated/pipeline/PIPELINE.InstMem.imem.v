module BindsTo_0_InstMem(
  input         clock,
  input  [31:0] io_addr,
  output [31:0] io_data
);

  
initial begin
  $readmemh("/mnt/c/Linux/5-Stage-RV32I/src/main/scala/Pipeline/test.txt", InstMem.imem);
end
                      endmodule

bind InstMem BindsTo_0_InstMem BindsTo_0_InstMem_Inst(.*);