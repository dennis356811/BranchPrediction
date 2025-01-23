module Reg_D(
  input         clock,
  input         reset,
  input         io_stall,
  input         io_jb,
  input  [31:0] io_pc,
  input  [31:0] io_inst,
  output [31:0] io_out_Reg_D_pc,
  output [31:0] io_out_Reg_D_inst
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
`endif // RANDOMIZE_REG_INIT
  reg [31:0] PC_REG; // @[Reg_D.scala 14:35]
  reg [31:0] INST_REG; // @[Reg_D.scala 15:35]
  assign io_out_Reg_D_pc = PC_REG; // @[Reg_D.scala 27:25]
  assign io_out_Reg_D_inst = INST_REG; // @[Reg_D.scala 28:25]
  always @(posedge clock) begin
    if (reset) begin // @[Reg_D.scala 14:35]
      PC_REG <= 32'h0; // @[Reg_D.scala 14:35]
    end else if (io_jb) begin // @[Reg_D.scala 17:14]
      PC_REG <= 32'h0; // @[Reg_D.scala 18:17]
    end else if (!(io_stall)) begin // @[Reg_D.scala 20:23]
      PC_REG <= io_pc; // @[Reg_D.scala 24:17]
    end
    if (reset) begin // @[Reg_D.scala 15:35]
      INST_REG <= 32'h0; // @[Reg_D.scala 15:35]
    end else if (io_jb) begin // @[Reg_D.scala 17:14]
      INST_REG <= 32'h0; // @[Reg_D.scala 19:17]
    end else if (!(io_stall)) begin // @[Reg_D.scala 20:23]
      INST_REG <= io_inst; // @[Reg_D.scala 25:17]
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
  PC_REG = _RAND_0[31:0];
  _RAND_1 = {1{`RANDOM}};
  INST_REG = _RAND_1[31:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule