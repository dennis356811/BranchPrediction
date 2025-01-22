module JB_Unit(
  input         clock,
  input         reset,
  input  [31:0] io_operand1,
  input  [31:0] io_operand2,
  output [31:0] io_jb_out
);
  assign io_jb_out = io_operand1 + io_operand2; // @[JB_Unit.scala 11:32]
endmodule
