import chisel3._
import chisel3.util._

class Reg_PC extends Module {
  val io = IO(new Bundle {
    val stall               = Input(Bool())
    val next_pc             = Input(Bits(32.W))

    val current_pc          = Output(Bits(32.W))
  })
  val PC_REG            = RegInit (0.U (32.W))
  
  when(io.stall){
    PC_REG := PC_REG
  }.otherwise{
    PC_REG := io.next_pc
  }

  io.current_pc        := PC_REG
}

object Reg_PC extends App {
  (new chisel3.stage.ChiselStage).emitVerilog(new Reg_PC, Array("--target-dir", "generated/Reg_PC"))
}
