import chisel3._
import chisel3.util._

class Reg_M extends Module {
  val io = IO(new Bundle {
    val alu_out             = Input(Bits(32.W))
    val rs2_data            = Input(Bits(32.W))

    val out_Reg_M_alu_out   = Output(Bits(32.W))
    val out_Reg_M_rs2_data  = Output(Bits(32.W))
  })
  val ALU_OUT_REG            = RegInit (0.U (32.W))
  val RS2_DATA_REG           = RegInit (0.U (32.W))

  ALU_OUT_REG     := io.alu_out
  RS2_DATA_REG    := io.rs2_data 

  io.out_Reg_M_alu_out        := ALU_OUT_REG   
  io.out_Reg_M_rs2_data       := RS2_DATA_REG
}

object Reg_M extends App {
  (new chisel3.stage.ChiselStage).emitVerilog(new Reg_M, Array("--target-dir", "generated/Reg_M"))
}
