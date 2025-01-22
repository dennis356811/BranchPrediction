circuit JB_Unit :
  module JB_Unit :
    input clock : Clock
    input reset : UInt<1>
    output io : { flip operand1 : UInt<32>, flip operand2 : UInt<32>, jb_out : UInt<32>}

    node _io_jb_out_T = add(io.operand1, io.operand2) @[JB_Unit.scala 11:32]
    node _io_jb_out_T_1 = tail(_io_jb_out_T, 1) @[JB_Unit.scala 11:32]
    node _io_jb_out_T_2 = and(_io_jb_out_T_1, UInt<32>("hffffffff")) @[JB_Unit.scala 11:47]
    io.jb_out <= _io_jb_out_T_2 @[JB_Unit.scala 11:15]

