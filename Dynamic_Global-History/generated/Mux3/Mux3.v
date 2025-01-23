module Mux3(
  input         clock,
  input         reset,
  input  [31:0] io_zeroth,
  input  [31:0] io_first,
  input  [31:0] io_second,
  input  [1:0]  io_control,
  output [31:0] io_result
);
  wire [31:0] _io_result_T_3 = 2'h1 == io_control ? io_first : io_zeroth; // @[Mux.scala 81:58]
  assign io_result = 2'h2 == io_control ? io_second : _io_result_T_3; // @[Mux.scala 81:58]
endmodule
