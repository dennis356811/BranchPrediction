circuit Reg_D :
  module Reg_D :
    input clock : Clock
    input reset : UInt<1>
    output io : { flip stall : UInt<1>, flip jb : UInt<1>, flip pc : UInt<32>, flip inst : UInt<32>, out_Reg_D_pc : UInt<32>, out_Reg_D_inst : UInt<32>}

    reg PC_REG : UInt<32>, clock with :
      reset => (reset, UInt<32>("h0")) @[Reg_D.scala 14:35]
    reg INST_REG : UInt<32>, clock with :
      reset => (reset, UInt<32>("h0")) @[Reg_D.scala 15:35]
    when io.jb : @[Reg_D.scala 17:14]
      PC_REG <= UInt<32>("h0") @[Reg_D.scala 18:17]
      INST_REG <= UInt<32>("h0") @[Reg_D.scala 19:17]
    else :
      when io.stall : @[Reg_D.scala 20:23]
        PC_REG <= PC_REG @[Reg_D.scala 21:17]
        INST_REG <= INST_REG @[Reg_D.scala 22:17]
      else :
        PC_REG <= io.pc @[Reg_D.scala 24:17]
        INST_REG <= io.inst @[Reg_D.scala 25:17]
    io.out_Reg_D_pc <= PC_REG @[Reg_D.scala 27:25]
    io.out_Reg_D_inst <= INST_REG @[Reg_D.scala 28:25]

