/*import chisel3._
import chisel3.util._

class RegFile extends Module {
  val io = IO(new Bundle {
    val w_en = Input(Bool())
    val wb_data = Input(UInt(32.W))
    val rd_index  = Input(UInt(5.W))
    val rs1_index = Input(UInt(5.W))
    val rs2_index = Input(UInt(5.W))

    val rs1_data_out = Output(UInt(32.W))
    val rs2_data_out = Output(UInt(32.W))
  })

  val registers = Mem(32, UInt(31.W)) 

  // 寫入邏輯
  when(io.w_en && (io.rd_index =/= 0.U)) {
    registers.write(io.rd_index, io.wb_data)
  }

  // 讀取邏輯
  when(io.rs1_index === 0.U){
    io.rs1_data_out          := 0.U(32.W)
  }.otherwise{
    io.rs1_data_out          := registers.read(io.rs1_index)
  }

  when(io.rs2_index === 0.U){
    io.rs2_data_out          := 0.U(32.W)
  }.otherwise{
    io.rs2_data_out          := registers.read(io.rs2_index)
  }
}
*/
import chisel3._
import chisel3.util._

class RegFile extends Module {
  val io = IO(new Bundle {
    val wb_en = Input(Bool())
    val wb_data = Input(UInt(32.W))
    val rd_index = Input(UInt(5.W))
    val rs1_index = Input(UInt(5.W))
    val rs2_index = Input(UInt(5.W))
    val rs1_data_out = Output(UInt(32.W))
    val rs2_data_out = Output(UInt(32.W))
  })

  val registers = RegInit(VecInit(Seq.fill(32)(0.U(32.W))))

  when(io.wb_en && io.rd_index =/= 0.U) {
    registers(io.rd_index) := io.wb_data
  }

  io.rs1_data_out := Mux(io.rs1_index === 0.U, 0.U, registers(io.rs1_index))
  io.rs2_data_out := Mux(io.rs2_index === 0.U, 0.U, registers(io.rs2_index))
}


object RegFile extends App {
  (new chisel3.stage.ChiselStage).emitVerilog(new RegFile, Array("--target-dir", "generated/RegFile"))
}