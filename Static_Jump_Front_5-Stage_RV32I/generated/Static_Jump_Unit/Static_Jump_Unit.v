module Static_Jump_Unit(
  input         clock,
  input         reset,
  input  [31:0] io_to_static_jump,
  input  [31:0] io_current_pc,
  input  [31:0] io_inst,
  input  [4:0]  io_E_op,
  input         io_E_alu_out,
  output [31:0] io_out_static_jump
);
  wire [19:0] _target_address_offset_T_2 = io_inst[31] ? 20'hfffff : 20'h0; // @[Bitwise.scala 74:12]
  wire [31:0] target_address_offset = {_target_address_offset_T_2,io_inst[7],io_inst[30:25],io_inst[11:8],1'h0}; // @[Cat.scala 31:58]
  wire [31:0] target_address = io_current_pc + target_address_offset; // @[Static_Jump_Unit.scala 18:48]
  wire  _T_4 = io_E_op == 5'h19; // @[Static_Jump_Unit.scala 24:17]
  wire  _T_5 = io_E_op == 5'h1b | _T_4; // @[Static_Jump_Unit.scala 23:53]
  wire [31:0] _GEN_0 = io_inst[6:2] == 5'h18 ? target_address : io_to_static_jump; // @[Static_Jump_Unit.scala 27:64 28:29 30:29]
  wire [31:0] _GEN_1 = _T_5 ? io_to_static_jump : _GEN_0; // @[Static_Jump_Unit.scala 25:6 26:29]
  assign io_out_static_jump = io_E_op == 5'h18 & ~io_E_alu_out ? io_to_static_jump : _GEN_1; // @[Static_Jump_Unit.scala 20:69 21:29]
endmodule
