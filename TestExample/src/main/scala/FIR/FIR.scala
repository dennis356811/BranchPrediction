import chisel3._

class FIR(b0: Int, b1: Int, b2: Int, b3: Int) extends Module {
  val io = IO(new Bundle {
    val data = Input(UInt(8.W))
    val out = Output(UInt(8.W))
  })    

  val x0 = RegNext(io.data, 0.U)
  val x1 = RegNext(x0, 0.U)
  val x2 = RegNext(x1, 0.U)

  io.out := io.data*b0.U(8.W) + x0*b1.U(8.W) + x1*b2.U(8.W) + x2*b3.U(8.W)
}

object FIR extends App {
  (new chisel3.stage.ChiselStage).emitVerilog(new FIR(1,1,1,1), Array("--target-dir", "generated/FIR"))
}
