circuit Reg_PC :
  module Reg_PC :
    input clock : Clock
    input reset : UInt<1>
    output io : { flip stall : UInt<1>, flip next_pc : UInt<32>, current_pc : UInt<32>}

    reg PC_REG : UInt<32>, clock with :
      reset => (reset, UInt<32>("h0")) @[Reg_PC.scala 11:35]
    when io.stall : @[Reg_PC.scala 13:17]
      PC_REG <= PC_REG @[Reg_PC.scala 14:12]
    else :
      PC_REG <= io.next_pc @[Reg_PC.scala 16:12]
    io.current_pc <= PC_REG @[Reg_PC.scala 19:24]

