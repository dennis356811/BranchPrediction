module FIR(
  input        clock,
  input        reset,
  input  [7:0] io_data,
  output [7:0] io_out
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
`endif // RANDOMIZE_REG_INIT
  reg [7:0] x0; // @[FIR.scala 9:19]
  reg [7:0] x1; // @[FIR.scala 10:19]
  reg [7:0] x2; // @[FIR.scala 11:19]
  wire [15:0] _io_out_T = io_data * 8'h1; // @[FIR.scala 13:20]
  wire [15:0] _io_out_T_1 = x0 * 8'h1; // @[FIR.scala 13:35]
  wire [15:0] _io_out_T_3 = _io_out_T + _io_out_T_1; // @[FIR.scala 13:31]
  wire [15:0] _io_out_T_4 = x1 * 8'h1; // @[FIR.scala 13:50]
  wire [15:0] _io_out_T_6 = _io_out_T_3 + _io_out_T_4; // @[FIR.scala 13:46]
  wire [15:0] _io_out_T_7 = x2 * 8'h1; // @[FIR.scala 13:65]
  wire [15:0] _io_out_T_9 = _io_out_T_6 + _io_out_T_7; // @[FIR.scala 13:61]
  assign io_out = _io_out_T_9[7:0]; // @[FIR.scala 13:10]
  always @(posedge clock) begin
    if (reset) begin // @[FIR.scala 9:19]
      x0 <= 8'h0; // @[FIR.scala 9:19]
    end else begin
      x0 <= io_data; // @[FIR.scala 9:19]
    end
    if (reset) begin // @[FIR.scala 10:19]
      x1 <= 8'h0; // @[FIR.scala 10:19]
    end else begin
      x1 <= x0; // @[FIR.scala 10:19]
    end
    if (reset) begin // @[FIR.scala 11:19]
      x2 <= 8'h0; // @[FIR.scala 11:19]
    end else begin
      x2 <= x1; // @[FIR.scala 11:19]
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
  x0 = _RAND_0[7:0];
  _RAND_1 = {1{`RANDOM}};
  x1 = _RAND_1[7:0];
  _RAND_2 = {1{`RANDOM}};
  x2 = _RAND_2[7:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
