package Pipeline
import chisel3._

class Decoder extends Module {
  val io = IO(new Bundle {
    val inst = Input(Bits(32.W))

    val dc_out_opcode = Output(Bits(5.W))
    val dc_out_func3 = Output(Bits(3.W))
    val dc_out_func7  = Output(Bits(1.W))
    val dc_out_rs1_index = Output(Bits(5.W))
    val dc_out_rs2_index = Output(Bits(5.W))
    val dc_out_rd_index = Output(Bits(5.W))
  })    
  io.dc_out_opcode := io.inst(6, 2)
  io.dc_out_func3 := io.inst(14, 12)
  io.dc_out_func7 := io.inst(30)
  io.dc_out_rs1_index := io.inst(19,15)
  io.dc_out_rs2_index := io.inst(24, 20)
  io.dc_out_rd_index := io.inst(11, 7)
}

object Decoder extends App {
  (new chisel3.stage.ChiselStage).emitVerilog(new Decoder, Array("--target-dir", "generated/Decoder"))
}
