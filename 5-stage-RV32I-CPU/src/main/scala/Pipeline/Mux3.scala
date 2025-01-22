package Pipeline
import chisel3._
import chisel3.util._

class Mux3 extends Module {
    val io = IO(new Bundle {
        val zeroth      = Input(Bits(32.W))
        val first       = Input(Bits(32.W))
        val second      = Input(Bits(32.W))
        val control     = Input(Bits(2.W))
        
        val result      = Output(Bits(32.W))
    })
    io.result           := MuxLookup(io.control, io.zeroth, Array(
        (0.U(2.W)) -> io.zeroth,
        (1.U(2.W)) -> io.first,
        (2.U(2.W)) -> io.second
    ))
}

object Mux3 extends App {
  (new chisel3.stage.ChiselStage).emitVerilog(new Mux3, Array("--target-dir", "generated/Mux3"))
}
