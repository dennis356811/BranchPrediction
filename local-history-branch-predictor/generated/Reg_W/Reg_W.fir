circuit Reg_W :
  module Reg_W :
    input clock : Clock
    input reset : UInt<1>
    output io : { flip alu_out : UInt<32>, flip ld_data : UInt<32>, out_Reg_W_alu_out : UInt<32>, out_Reg_W_ld_data : UInt<32>}

    reg ALU_OUT_REG : UInt<32>, clock with :
      reset => (reset, UInt<32>("h0")) @[Reg_W.scala 12:40]
    reg LD_DATA_REG : UInt<32>, clock with :
      reset => (reset, UInt<32>("h0")) @[Reg_W.scala 13:40]
    ALU_OUT_REG <= io.alu_out @[Reg_W.scala 15:19]
    LD_DATA_REG <= io.ld_data @[Reg_W.scala 16:19]
    io.out_Reg_W_alu_out <= ALU_OUT_REG @[Reg_W.scala 18:31]
    io.out_Reg_W_ld_data <= LD_DATA_REG @[Reg_W.scala 19:31]

