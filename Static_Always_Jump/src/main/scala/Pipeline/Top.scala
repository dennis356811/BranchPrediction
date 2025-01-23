package Pipeline
import chisel3._
import chisel3.util._
import chisel3.util.experimental.loadMemoryFromFile
import scala.io.Source
import firrtl.annotations.MemoryLoadFileType

class Top(prog_filename: String) extends Module {
    val io = IO(new Bundle {
        //val pc_out = Output (Bits(32.W))
        val mem_read_test = Input(Bool())
        val mem_addr_test = Input(UInt(32.W))
        val mem_data_test = Output(UInt(32.W))
        val miss_test     = Output(Bool())
        val E_op_test     = Output(UInt(5.W))
    })
    // submodules
    val static_jump     = Module(new Static_Jump_Unit)
    val reg_pc          = Module(new Reg_PC)
    val im              = Module(new SRAM)
    val reg_d           = Module(new Reg_D)
    val decoder         = Module(new Decoder)
    val imm_ext         = Module(new Imm_Ext)
    val regfile         = Module(new RegFile)
    val reg_e           = Module(new Reg_E)
    val alu             = Module(new ALU)
    val jb_unit         = Module(new JB_Unit)
    val reg_m           = Module(new Reg_M)
    val dm              = Module(new SRAM_dm)
    val reg_w           = Module(new Reg_W)
    val Ld_filter       = Module(new LD_Filter)
    val controller      = Module(new Controller)

    loadMemoryFromFile(im.mem, prog_filename, MemoryLoadFileType.Hex)
    loadMemoryFromFile(dm.mem, prog_filename, MemoryLoadFileType.Hex)

    // connections
    val to_pc_reg               = Wire(UInt(32.W))
    val to_static_jump          = Wire(UInt(32.W))
    val out_pc_reg              = Wire(UInt(32.W))
    val out_Reg_D_pc            = Wire(UInt(32.W))
    val out_Reg_E_pc            = Wire(UInt(32.W))

    val inst_to_Reg_D           = Wire(UInt(32.W))
    val inst_out_Reg_D          = Wire(UInt(32.W))

    val opcode                  = Wire(UInt(5.W))
    val func3                   = Wire(UInt(3.W))
    val func7                   = Wire(Bool())
    val rs1_index               = Wire(UInt(5.W))
    val rs2_index               = Wire(UInt(5.W))
    val rd_index                = Wire(UInt(5.W))

    val to_Reg_E_sext_imme      = Wire(UInt(32.W))
    val out_Reg_E_sext_imme     = Wire(UInt(32.W))

    val out_reg_file_rs1_data   = Wire(UInt(32.W))
    val out_reg_file_rs2_data   = Wire(UInt(32.W))
    val to_Reg_E_rs1_data       = Wire(UInt(32.W))
    val to_Reg_E_rs2_data       = Wire(UInt(32.W))
    val rs1_data                = Wire(UInt(32.W))
    val rs2_data                = Wire(UInt(32.W))

    val rs1_data_final          = Wire(UInt(32.W))
    val rs2_data_final          = Wire(UInt(32.W))

    val alu_out                 = Wire(UInt(32.W))
    val alu_out_forward         = Wire(UInt(32.W))

    val out_Reg_M_rs2_data      = Wire(UInt(32.W))

    val to_Reg_W_ld_data        = Wire(UInt(32.W))
    val out_Reg_W_ld_data       = Wire(UInt(32.W))
    val out_Reg_W_alu_out       = Wire(UInt(32.W))
    val ld_data_f               = Wire(UInt(32.W))
    val wb_data                 = Wire(UInt(32.W))
    val jb_pc                   = Wire(UInt(32.W))
    val alu_src1_mux            = Wire(UInt(32.W))
    val alu_src2_mux            = Wire(UInt(32.W))
    val jb_src_mux              = Wire(UInt(32.W))

    // Controller signals
    val next_pc_sel             = Wire(Bool())
    val stall                   = Wire(Bool())
    val F_im_w_en               = Wire(UInt(4.W))
    val D_rs1_data_sel          = Wire(Bool())
    val D_rs2_data_sel          = Wire(Bool())

    val E_rs1_data_sel          = Wire(UInt(2.W))
    val E_rs2_data_sel          = Wire(UInt(2.W))
    val E_jb_op1_sel            = Wire(Bool())
    val E_alu_op1_sel           = Wire(Bool())
    val E_alu_op2_sel           = Wire(Bool())
    val E_op                    = Wire(UInt(5.W))
    val E_f3                    = Wire(UInt(3.W))
    val E_f7                    = Wire(Bool())

    val M_dm_w_en               = Wire(UInt(4.W))

    val W_wb_en                 = Wire(Bool())
    val W_rd_index              = Wire(UInt(5.W))
    val W_f3                    = Wire(UInt(3.W))
    val W_wb_sel                = Wire(Bool())

    // static_jump
    to_static_jump                := Mux(next_pc_sel, jb_pc, out_pc_reg + 4.U)
    static_jump.io.to_static_jump := to_static_jump
    static_jump.io.current_pc     := out_pc_reg
    static_jump.io.inst           := inst_to_Reg_D
    static_jump.io.next_pc_sel    := next_pc_sel
    to_pc_reg                     := static_jump.io.out_static_jump


    // reg_pc
    reg_pc.io.stall             := stall
    reg_pc.io.next_pc           := to_pc_reg
    out_pc_reg                  := reg_pc.io.current_pc

    //im
    im.io.w_en                  := F_im_w_en
    im.io.address               := out_pc_reg(15, 0)
    im.io.write_data            := 0.U(32.W)
    inst_to_Reg_D               := im.io.read_data

    //reg_d
    reg_d.io.stall              := stall
    reg_d.io.jb                 := next_pc_sel
    reg_d.io.pc                 := out_pc_reg
    reg_d.io.inst               := inst_to_Reg_D
    out_Reg_D_pc                := reg_d.io.out_Reg_D_pc
    inst_out_Reg_D              := reg_d.io.out_Reg_D_inst

    //decoder
    decoder.io.inst             := inst_out_Reg_D
    opcode                      := decoder.io.dc_out_opcode
    func3                       := decoder.io.dc_out_func3
    func7                       := decoder.io.dc_out_func7
    rs1_index                   := decoder.io.dc_out_rs1_index
    rs2_index                   := decoder.io.dc_out_rs2_index
    rd_index                    := decoder.io.dc_out_rd_index

    //imm_ext
    imm_ext.io.inst             := inst_out_Reg_D
    to_Reg_E_sext_imme          := imm_ext.io.imm_ext_out

    //regfile
    wb_data                     := Mux(W_wb_sel, out_Reg_W_alu_out, ld_data_f)
    regfile.io.wb_en            := W_wb_en
    regfile.io.wb_data          := wb_data
    regfile.io.rd_index         := W_rd_index
    regfile.io.rs1_index        := rs1_index
    regfile.io.rs2_index        := rs2_index
    out_reg_file_rs1_data       := regfile.io.rs1_data_out
    out_reg_file_rs2_data       := regfile.io.rs2_data_out

    //reg_e
    to_Reg_E_rs1_data           := Mux(D_rs1_data_sel, wb_data, out_reg_file_rs1_data)
    to_Reg_E_rs2_data           := Mux(D_rs2_data_sel, wb_data, out_reg_file_rs2_data)
    reg_e.io.stall              := stall
    reg_e.io.jb                 := next_pc_sel
    reg_e.io.pc                 := out_Reg_D_pc
    reg_e.io.rs1_data           := to_Reg_E_rs1_data
    reg_e.io.rs2_data           := to_Reg_E_rs2_data
    reg_e.io.sext_imme          := to_Reg_E_sext_imme
    out_Reg_E_pc                := reg_e.io.out_Reg_E_pc       
    rs1_data                    := reg_e.io.out_Reg_E_rs1_data 
    rs2_data                    := reg_e.io.out_Reg_E_rs2_data 
    out_Reg_E_sext_imme         := reg_e.io.out_Reg_E_sext_imme

    //mux before alu
    rs1_data_final              := MuxLookup(E_rs1_data_sel, wb_data, Array(
        (0.U(2.W)) -> wb_data,
        (1.U(2.W)) -> alu_out_forward,
        (2.U(2.W)) -> rs1_data
    ))
    rs2_data_final              := MuxLookup(E_rs2_data_sel, wb_data, Array(
        (0.U(2.W)) -> wb_data,
        (1.U(2.W)) -> alu_out_forward,
        (2.U(2.W)) -> rs2_data
    ))
    alu_src1_mux                := Mux(E_alu_op1_sel, rs1_data_final, out_Reg_E_pc)
    alu_src2_mux                := Mux(E_alu_op2_sel, rs2_data_final, out_Reg_E_sext_imme)

    //alu
    alu.io.opcode               := E_op
    alu.io.func3                := E_f3
    alu.io.func7                := E_f7
    alu.io.operand1             := alu_src1_mux
    alu.io.operand2             := alu_src2_mux
    alu_out                     := alu.io.alu_out

    jb_src_mux                  := Mux(E_jb_op1_sel, rs1_data_final, out_Reg_E_pc)

    //jb_unit
    jb_unit.io.opcode           := E_op
    jb_unit.io.operand1         := jb_src_mux
    jb_unit.io.operand2         := out_Reg_E_sext_imme
    jb_pc                       := jb_unit.io.jb_out

    //reg_m
    reg_m.io.alu_out            := alu_out
    reg_m.io.rs2_data           := rs2_data_final
    alu_out_forward             := reg_m.io.out_Reg_M_alu_out
    out_Reg_M_rs2_data          := reg_m.io.out_Reg_M_rs2_data

    //dm
    dm.io.w_en                  := M_dm_w_en
    dm.io.address               := alu_out_forward(15, 0)
    dm.io.write_data            := out_Reg_M_rs2_data
    to_Reg_W_ld_data            := dm.io.read_data

    //reg_w
    reg_w.io.alu_out            := alu_out_forward
    reg_w.io.ld_data            := to_Reg_W_ld_data
    out_Reg_W_alu_out           := reg_w.io.out_Reg_W_alu_out
    out_Reg_W_ld_data           := reg_w.io.out_Reg_W_ld_data

    //Ld_filter
    Ld_filter.io.func3          := W_f3
    Ld_filter.io.ld_data        := out_Reg_W_ld_data
    ld_data_f                   := Ld_filter.io.ld_data_f

    //controller
    controller.io.op            := opcode
    controller.io.f3            := func3
    controller.io.rd            := rd_index
    controller.io.rs1           := rs1_index
    controller.io.rs2           := rs2_index
    controller.io.f7            := func7
    controller.io.alu_out       := alu_out(0)
    stall                       := controller.io.stall         
    next_pc_sel                 := controller.io.next_pc_sel   
    F_im_w_en                   := controller.io.F_im_w_en     
    D_rs1_data_sel              := controller.io.D_rs1_data_sel
    D_rs2_data_sel              := controller.io.D_rs2_data_sel
    E_rs1_data_sel              := controller.io.E_rs1_data_sel
    E_rs2_data_sel              := controller.io.E_rs2_data_sel
    E_jb_op1_sel                := controller.io.E_jb_op1_sel  
    E_alu_op1_sel               := controller.io.E_alu_op1_sel 
    E_alu_op2_sel               := controller.io.E_alu_op2_sel 
    E_op                        := controller.io.E_op          
    E_f3                        := controller.io.E_f3          
    E_f7                        := controller.io.E_f7          
    M_dm_w_en                   := controller.io.M_dm_w_en     
    W_wb_en                     := controller.io.W_wb_en       
    W_rd_index                  := controller.io.W_rd_index    
    W_f3                        := controller.io.W_f3          
    W_wb_sel                    := controller.io.W_wb_data_sel 


    // for testing
    dm.io.mem_read_test         := io.mem_read_test
    dm.io.mem_addr_test         := io.mem_addr_test
    io.mem_data_test            := dm.io.mem_data_test
    io.E_op_test                := E_op
    io.miss_test                := next_pc_sel
}

object Top extends App {
    val default_prog_filename = "./src/main/scala/Pipeline/prog0/prog0.hex"
    (new chisel3.stage.ChiselStage).emitVerilog(new Top(default_prog_filename), Array("--target-dir", "generated/Top"))
}
