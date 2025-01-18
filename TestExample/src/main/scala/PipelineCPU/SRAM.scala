import chisel3._
import chisel3.util._

class SRAM extends Module {
  val io = IO(new Bundle {
    val w_en = Input(UInt(4.W))
    val address = Input(UInt(16.W))
    val write_data = Input(UInt(32.W))
    val read_data = Output(UInt(32.W))
  })

  val mem = Mem(65536, UInt(8.W))

  // 寫入邏輯
  when(io.w_en =/= 0.U) {
    when(io.w_en(0)) { mem.write(io.address, io.write_data(7, 0)) }
    when(io.w_en(1)) { mem.write(io.address + 1.U, io.write_data(15, 8)) }
    when(io.w_en(2)) { mem.write(io.address + 2.U, io.write_data(23, 16)) }
    when(io.w_en(3)) { mem.write(io.address + 3.U, io.write_data(31, 24)) }
  }

  // 讀取邏輯
  val read_data_bytes = VecInit(Seq.fill(4)(0.U(8.W)))
  read_data_bytes(0) := mem.read(io.address)
  read_data_bytes(1) := mem.read(io.address + 1.U)
  read_data_bytes(2) := mem.read(io.address + 2.U)
  read_data_bytes(3) := mem.read(io.address + 3.U)

  io.read_data := Cat(read_data_bytes.reverse) // 將讀取的位元組組合成 32 位元輸出
}


object SRAM extends App {
  (new chisel3.stage.ChiselStage).emitVerilog(new SRAM, Array("--target-dir", "generated/SRAM"))
}