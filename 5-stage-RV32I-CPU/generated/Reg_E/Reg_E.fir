circuit Reg_E :
  module Reg_E :
    input clock : Clock
    input reset : UInt<1>
    output io : { flip stall : UInt<1>, flip jb : UInt<1>, flip pc : UInt<32>, flip rs1_data : UInt<32>, flip rs2_data : UInt<32>, flip sext_imme : UInt<32>, out_Reg_E_pc : UInt<32>, out_Reg_E_rs1_data : UInt<32>, out_Reg_E_rs2_data : UInt<32>, out_Reg_E_sext_imme : UInt<32>}

    reg E_PC_REG : UInt<32>, clock with :
      reset => (reset, UInt<32>("h0")) @[Reg_E.scala 18:43]
    reg E_RS1_DATA_REG : UInt<32>, clock with :
      reset => (reset, UInt<32>("h0")) @[Reg_E.scala 19:43]
    reg E_RS2_DATA_REG : UInt<32>, clock with :
      reset => (reset, UInt<32>("h0")) @[Reg_E.scala 20:43]
    reg E_SEXT_IMME_REG : UInt<32>, clock with :
      reset => (reset, UInt<32>("h0")) @[Reg_E.scala 21:43]
    node _T = or(io.jb, io.stall) @[Reg_E.scala 23:14]
    when _T : @[Reg_E.scala 23:26]
      E_PC_REG <= UInt<32>("h0") @[Reg_E.scala 24:23]
      E_RS1_DATA_REG <= UInt<32>("h0") @[Reg_E.scala 25:23]
      E_RS2_DATA_REG <= UInt<32>("h0") @[Reg_E.scala 26:23]
      E_SEXT_IMME_REG <= UInt<32>("h0") @[Reg_E.scala 27:23]
    else :
      E_PC_REG <= io.pc @[Reg_E.scala 29:23]
      E_RS1_DATA_REG <= io.rs1_data @[Reg_E.scala 30:23]
      E_RS2_DATA_REG <= io.rs2_data @[Reg_E.scala 31:23]
      E_SEXT_IMME_REG <= io.sext_imme @[Reg_E.scala 32:23]
    io.out_Reg_E_pc <= E_PC_REG @[Reg_E.scala 35:28]
    io.out_Reg_E_rs1_data <= E_RS1_DATA_REG @[Reg_E.scala 36:28]
    io.out_Reg_E_rs2_data <= E_RS2_DATA_REG @[Reg_E.scala 37:28]
    io.out_Reg_E_sext_imme <= E_SEXT_IMME_REG @[Reg_E.scala 38:28]

