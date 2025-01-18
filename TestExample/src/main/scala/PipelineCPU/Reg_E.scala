import chisel3._
import chisel3.util._

class Reg_E extends Module {
  val io = IO(new Bundle {
    val stall               = Input(Bool())
    val jb                  = Input(Bool())
    val pc                  = Input(Bits(32.W))
    val rs1_data            = Input(Bits(32.W))
    val rs2_data            = Input(Bits(32.W))
    val sext_imme           = Input(Bits(32.W))

    val out_Reg_E_pc        = Output(Bits(32.W))
    val out_Reg_E_rs1_data  = Output(Bits(32.W))
    val out_Reg_E_rs2_data  = Output(Bits(32.W))
    val out_Reg_E_sext_imme = Output(Bits(32.W))
  })
  val E_PC_REG                  = RegInit (0.U (32.W))
  val E_RS1_DATA_REG            = RegInit (0.U (32.W))
  val E_RS2_DATA_REG            = RegInit (0.U (32.W))
  val E_SEXT_IMME_REG           = RegInit (0.U (32.W))

  when(io.jb || io.stall){
    E_PC_REG          := 0.U(32.W)
    E_RS1_DATA_REG    := 0.U(32.W)
    E_RS2_DATA_REG    := 0.U(32.W)
    E_SEXT_IMME_REG   := 0.U(32.W)
  }.otherwise{
    E_PC_REG          := io.pc
    E_RS1_DATA_REG    := io.rs1_data
    E_RS2_DATA_REG    := io.rs2_data
    E_SEXT_IMME_REG   := io.sext_imme
  }

  io.out_Reg_E_pc          := E_PC_REG   
  io.out_Reg_E_rs1_data    := E_RS1_DATA_REG 
  io.out_Reg_E_rs2_data    := E_RS2_DATA_REG 
  io.out_Reg_E_sext_imme   := E_SEXT_IMME_REG
}

object Reg_E extends App {
  (new chisel3.stage.ChiselStage).emitVerilog(new Reg_E, Array("--target-dir", "generated/Reg_E"))
}
