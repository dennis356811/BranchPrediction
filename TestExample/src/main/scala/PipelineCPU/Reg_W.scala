import chisel3._
import chisel3.util._

class Reg_W extends Module {
  val io = IO(new Bundle {
    val alu_out             = Input(Bits(32.W))
    val ld_data             = Input(Bits(32.W))

    val out_Reg_W_alu_out   = Output(Bits(32.W))
    val out_Reg_W_ld_data   = Output(Bits(32.W))
  })
  val ALU_OUT_REG            = RegInit (0.U (32.W))
  val LD_DATA_REG            = RegInit (0.U (32.W))

  ALU_OUT_REG     := io.alu_out
  LD_DATA_REG     := io.ld_data 

  io.out_Reg_W_alu_out        := ALU_OUT_REG   
  io.out_Reg_W_ld_data        := LD_DATA_REG
}

object Reg_W extends App {
  (new chisel3.stage.ChiselStage).emitVerilog(new Reg_W, Array("--target-dir", "generated/Reg_W"))
}
