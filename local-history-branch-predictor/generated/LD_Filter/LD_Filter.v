module LD_Filter(
  input         clock,
  input         reset,
  input  [2:0]  io_func3,
  input  [31:0] io_ld_data,
  output [31:0] io_ld_data_f
);
  wire [23:0] _io_ld_data_f_T_2 = io_ld_data[7] ? 24'hffffff : 24'h0; // @[Bitwise.scala 74:12]
  wire [31:0] _io_ld_data_f_T_4 = {_io_ld_data_f_T_2,io_ld_data[7:0]}; // @[Cat.scala 31:58]
  wire [15:0] _io_ld_data_f_T_7 = io_ld_data[15] ? 16'hffff : 16'h0; // @[Bitwise.scala 74:12]
  wire [31:0] _io_ld_data_f_T_9 = {_io_ld_data_f_T_7,io_ld_data[15:0]}; // @[Cat.scala 31:58]
  wire [31:0] _io_ld_data_f_T_11 = {24'h0,io_ld_data[7:0]}; // @[Cat.scala 31:58]
  wire [31:0] _io_ld_data_f_T_13 = {16'h0,io_ld_data[15:0]}; // @[Cat.scala 31:58]
  wire [31:0] _GEN_0 = 3'h5 == io_func3 ? _io_ld_data_f_T_13 : 32'h0; // @[LD_Filter.scala 13:21 12:25 27:29]
  wire [31:0] _GEN_1 = 3'h4 == io_func3 ? _io_ld_data_f_T_11 : _GEN_0; // @[LD_Filter.scala 13:21 24:29]
  wire [31:0] _GEN_2 = 3'h2 == io_func3 ? io_ld_data : _GEN_1; // @[LD_Filter.scala 13:21 21:29]
  wire [31:0] _GEN_3 = 3'h1 == io_func3 ? _io_ld_data_f_T_9 : _GEN_2; // @[LD_Filter.scala 13:21 18:29]
  assign io_ld_data_f = 3'h0 == io_func3 ? _io_ld_data_f_T_4 : _GEN_3; // @[LD_Filter.scala 13:21 15:29]
endmodule
