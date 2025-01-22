module Reg_W(
  input         clock,
  input         reset,
  input  [31:0] io_alu_out,
  input  [31:0] io_ld_data,
  output [31:0] io_out_Reg_W_alu_out,
  output [31:0] io_out_Reg_W_ld_data
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
`endif // RANDOMIZE_REG_INIT
  reg [31:0] ALU_OUT_REG; // @[Reg_W.scala 12:40]
  reg [31:0] LD_DATA_REG; // @[Reg_W.scala 13:40]
  assign io_out_Reg_W_alu_out = ALU_OUT_REG; // @[Reg_W.scala 18:31]
  assign io_out_Reg_W_ld_data = LD_DATA_REG; // @[Reg_W.scala 19:31]
  always @(posedge clock) begin
    if (reset) begin // @[Reg_W.scala 12:40]
      ALU_OUT_REG <= 32'h0; // @[Reg_W.scala 12:40]
    end else begin
      ALU_OUT_REG <= io_alu_out; // @[Reg_W.scala 15:19]
    end
    if (reset) begin // @[Reg_W.scala 13:40]
      LD_DATA_REG <= 32'h0; // @[Reg_W.scala 13:40]
    end else begin
      LD_DATA_REG <= io_ld_data; // @[Reg_W.scala 16:19]
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
  ALU_OUT_REG = _RAND_0[31:0];
  _RAND_1 = {1{`RANDOM}};
  LD_DATA_REG = _RAND_1[31:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
