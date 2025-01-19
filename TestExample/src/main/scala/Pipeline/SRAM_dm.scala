package Pipeline
import chisel3._
import chisel3.util._

class SRAM_dm extends Module {
  val io = IO(new Bundle {
    val w_en = Input(UInt(4.W))
    val address = Input(UInt(16.W))
    val write_data = Input(UInt(32.W))
    val read_data = Output(UInt(32.W))
    // testing
    val mem_read_test = Input(Bool())
    val mem_addr_test = Input(UInt(32.W))
    val mem_data_test = Output(UInt(32.W))
  })

  val mem = Mem(65536, UInt(8.W))

  // write
  when(io.w_en =/= 0.U) {
    when(io.w_en(0)) { mem.write(io.address, io.write_data(7, 0)) }
    when(io.w_en(1)) { mem.write(io.address + 1.U, io.write_data(15, 8)) }
    when(io.w_en(2)) { mem.write(io.address + 2.U, io.write_data(23, 16)) }
    when(io.w_en(3)) { mem.write(io.address + 3.U, io.write_data(31, 24)) }
  }

  // read logic
  val read_data_bytes = VecInit(Seq.fill(4)(0.U(8.W)))
  read_data_bytes(0) := mem.read(io.address)
  read_data_bytes(1) := mem.read(io.address + 1.U)
  read_data_bytes(2) := mem.read(io.address + 2.U)
  read_data_bytes(3) := mem.read(io.address + 3.U)

  io.read_data := Cat(read_data_bytes.reverse) 

  // for testing
  val test_data_bytes = VecInit(Seq.fill(4)(0.U(8.W)))
  test_data_bytes(0) := mem.read(io.mem_addr_test)
  test_data_bytes(1) := mem.read(io.mem_addr_test + 1.U)
  test_data_bytes(2) := mem.read(io.mem_addr_test + 2.U)
  test_data_bytes(3) := mem.read(io.mem_addr_test + 3.U)

  io.mem_data_test := 0.U
  when(io.mem_read_test){
    io.mem_data_test := Cat(test_data_bytes.reverse) 
  }
}


object SRAM_dm extends App {
  (new chisel3.stage.ChiselStage).emitVerilog(new SRAM_dm, Array("--target-dir", "generated/SRAM_dm"))
}