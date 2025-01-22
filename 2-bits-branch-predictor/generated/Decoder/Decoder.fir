circuit Decoder :
  module Decoder :
    input clock : Clock
    input reset : UInt<1>
    output io : { flip inst : UInt<32>, dc_out_opcode : UInt<5>, dc_out_func3 : UInt<3>, dc_out_func7 : UInt<1>, dc_out_rs1_index : UInt<5>, dc_out_rs2_index : UInt<5>, dc_out_rd_index : UInt<5>}

    node _io_dc_out_opcode_T = bits(io.inst, 6, 2) @[Deocder.scala 14:30]
    io.dc_out_opcode <= _io_dc_out_opcode_T @[Deocder.scala 14:20]
    node _io_dc_out_func3_T = bits(io.inst, 14, 12) @[Deocder.scala 15:29]
    io.dc_out_func3 <= _io_dc_out_func3_T @[Deocder.scala 15:19]
    node _io_dc_out_func7_T = bits(io.inst, 30, 30) @[Deocder.scala 16:29]
    io.dc_out_func7 <= _io_dc_out_func7_T @[Deocder.scala 16:19]
    node _io_dc_out_rs1_index_T = bits(io.inst, 19, 15) @[Deocder.scala 17:33]
    io.dc_out_rs1_index <= _io_dc_out_rs1_index_T @[Deocder.scala 17:23]
    node _io_dc_out_rs2_index_T = bits(io.inst, 24, 20) @[Deocder.scala 18:33]
    io.dc_out_rs2_index <= _io_dc_out_rs2_index_T @[Deocder.scala 18:23]
    node _io_dc_out_rd_index_T = bits(io.inst, 11, 7) @[Deocder.scala 19:32]
    io.dc_out_rd_index <= _io_dc_out_rd_index_T @[Deocder.scala 19:22]

