module Reg_E(
  input         clock,
  input         reset,
  input         io_stall,
  input         io_jb,
  input  [31:0] io_pc,
  input  [31:0] io_rs1_data,
  input  [31:0] io_rs2_data,
  input  [31:0] io_sext_imme,
  output [31:0] io_out_Reg_E_pc,
  output [31:0] io_out_Reg_E_rs1_data,
  output [31:0] io_out_Reg_E_rs2_data,
  output [31:0] io_out_Reg_E_sext_imme
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
`endif // RANDOMIZE_REG_INIT
  reg [31:0] E_PC_REG; // @[Reg_E.scala 18:43]
  reg [31:0] E_RS1_DATA_REG; // @[Reg_E.scala 19:43]
  reg [31:0] E_RS2_DATA_REG; // @[Reg_E.scala 20:43]
  reg [31:0] E_SEXT_IMME_REG; // @[Reg_E.scala 21:43]
  assign io_out_Reg_E_pc = E_PC_REG; // @[Reg_E.scala 35:28]
  assign io_out_Reg_E_rs1_data = E_RS1_DATA_REG; // @[Reg_E.scala 36:28]
  assign io_out_Reg_E_rs2_data = E_RS2_DATA_REG; // @[Reg_E.scala 37:28]
  assign io_out_Reg_E_sext_imme = E_SEXT_IMME_REG; // @[Reg_E.scala 38:28]
  always @(posedge clock) begin
    if (reset) begin // @[Reg_E.scala 18:43]
      E_PC_REG <= 32'h0; // @[Reg_E.scala 18:43]
    end else if (io_jb | io_stall) begin // @[Reg_E.scala 23:26]
      E_PC_REG <= 32'h0; // @[Reg_E.scala 24:23]
    end else begin
      E_PC_REG <= io_pc; // @[Reg_E.scala 29:23]
    end
    if (reset) begin // @[Reg_E.scala 19:43]
      E_RS1_DATA_REG <= 32'h0; // @[Reg_E.scala 19:43]
    end else if (io_jb | io_stall) begin // @[Reg_E.scala 23:26]
      E_RS1_DATA_REG <= 32'h0; // @[Reg_E.scala 25:23]
    end else begin
      E_RS1_DATA_REG <= io_rs1_data; // @[Reg_E.scala 30:23]
    end
    if (reset) begin // @[Reg_E.scala 20:43]
      E_RS2_DATA_REG <= 32'h0; // @[Reg_E.scala 20:43]
    end else if (io_jb | io_stall) begin // @[Reg_E.scala 23:26]
      E_RS2_DATA_REG <= 32'h0; // @[Reg_E.scala 26:23]
    end else begin
      E_RS2_DATA_REG <= io_rs2_data; // @[Reg_E.scala 31:23]
    end
    if (reset) begin // @[Reg_E.scala 21:43]
      E_SEXT_IMME_REG <= 32'h0; // @[Reg_E.scala 21:43]
    end else if (io_jb | io_stall) begin // @[Reg_E.scala 23:26]
      E_SEXT_IMME_REG <= 32'h0; // @[Reg_E.scala 27:23]
    end else begin
      E_SEXT_IMME_REG <= io_sext_imme; // @[Reg_E.scala 32:23]
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  E_PC_REG = _RAND_0[31:0];
  _RAND_1 = {1{`RANDOM}};
  E_RS1_DATA_REG = _RAND_1[31:0];
  _RAND_2 = {1{`RANDOM}};
  E_RS2_DATA_REG = _RAND_2[31:0];
  _RAND_3 = {1{`RANDOM}};
  E_SEXT_IMME_REG = _RAND_3[31:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
