module Decoder(
  input         clock,
  input         reset,
  input  [31:0] io_inst,
  output [4:0]  io_dc_out_opcode,
  output [2:0]  io_dc_out_func3,
  output        io_dc_out_func7,
  output [4:0]  io_dc_out_rs1_index,
  output [4:0]  io_dc_out_rs2_index,
  output [4:0]  io_dc_out_rd_index
);
  assign io_dc_out_opcode = io_inst[6:2]; // @[Deocder.scala 14:30]
  assign io_dc_out_func3 = io_inst[14:12]; // @[Deocder.scala 15:29]
  assign io_dc_out_func7 = io_inst[30]; // @[Deocder.scala 16:29]
  assign io_dc_out_rs1_index = io_inst[19:15]; // @[Deocder.scala 17:33]
  assign io_dc_out_rs2_index = io_inst[24:20]; // @[Deocder.scala 18:33]
  assign io_dc_out_rd_index = io_inst[11:7]; // @[Deocder.scala 19:32]
endmodule
