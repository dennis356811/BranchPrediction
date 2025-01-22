circuit Reg_M :
  module Reg_M :
    input clock : Clock
    input reset : UInt<1>
    output io : { flip alu_out : UInt<32>, flip rs2_data : UInt<32>, out_Reg_M_alu_out : UInt<32>, out_Reg_M_rs2_data : UInt<32>}

    reg ALU_OUT_REG : UInt<32>, clock with :
      reset => (reset, UInt<32>("h0")) @[Reg_M.scala 12:40]
    reg RS2_DATA_REG : UInt<32>, clock with :
      reset => (reset, UInt<32>("h0")) @[Reg_M.scala 13:40]
    ALU_OUT_REG <= io.alu_out @[Reg_M.scala 15:19]
    RS2_DATA_REG <= io.rs2_data @[Reg_M.scala 16:19]
    io.out_Reg_M_alu_out <= ALU_OUT_REG @[Reg_M.scala 18:31]
    io.out_Reg_M_rs2_data <= RS2_DATA_REG @[Reg_M.scala 19:31]

