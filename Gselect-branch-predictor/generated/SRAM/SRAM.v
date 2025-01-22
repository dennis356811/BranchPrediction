module SRAM(
  input         clock,
  input         reset,
  input  [3:0]  io_w_en,
  input  [15:0] io_address,
  input  [31:0] io_write_data,
  output [31:0] io_read_data
);
`ifdef RANDOMIZE_MEM_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_MEM_INIT
  reg [7:0] mem [0:65535]; // @[SRAM.scala 12:16]
  wire  mem_read_data_bytes_0_MPORT_en; // @[SRAM.scala 12:16]
  wire [15:0] mem_read_data_bytes_0_MPORT_addr; // @[SRAM.scala 12:16]
  wire [7:0] mem_read_data_bytes_0_MPORT_data; // @[SRAM.scala 12:16]
  wire  mem_read_data_bytes_1_MPORT_en; // @[SRAM.scala 12:16]
  wire [15:0] mem_read_data_bytes_1_MPORT_addr; // @[SRAM.scala 12:16]
  wire [7:0] mem_read_data_bytes_1_MPORT_data; // @[SRAM.scala 12:16]
  wire  mem_read_data_bytes_2_MPORT_en; // @[SRAM.scala 12:16]
  wire [15:0] mem_read_data_bytes_2_MPORT_addr; // @[SRAM.scala 12:16]
  wire [7:0] mem_read_data_bytes_2_MPORT_data; // @[SRAM.scala 12:16]
  wire  mem_read_data_bytes_3_MPORT_en; // @[SRAM.scala 12:16]
  wire [15:0] mem_read_data_bytes_3_MPORT_addr; // @[SRAM.scala 12:16]
  wire [7:0] mem_read_data_bytes_3_MPORT_data; // @[SRAM.scala 12:16]
  wire [7:0] mem_MPORT_data; // @[SRAM.scala 12:16]
  wire [15:0] mem_MPORT_addr; // @[SRAM.scala 12:16]
  wire  mem_MPORT_mask; // @[SRAM.scala 12:16]
  wire  mem_MPORT_en; // @[SRAM.scala 12:16]
  wire [7:0] mem_MPORT_1_data; // @[SRAM.scala 12:16]
  wire [15:0] mem_MPORT_1_addr; // @[SRAM.scala 12:16]
  wire  mem_MPORT_1_mask; // @[SRAM.scala 12:16]
  wire  mem_MPORT_1_en; // @[SRAM.scala 12:16]
  wire [7:0] mem_MPORT_2_data; // @[SRAM.scala 12:16]
  wire [15:0] mem_MPORT_2_addr; // @[SRAM.scala 12:16]
  wire  mem_MPORT_2_mask; // @[SRAM.scala 12:16]
  wire  mem_MPORT_2_en; // @[SRAM.scala 12:16]
  wire [7:0] mem_MPORT_3_data; // @[SRAM.scala 12:16]
  wire [15:0] mem_MPORT_3_addr; // @[SRAM.scala 12:16]
  wire  mem_MPORT_3_mask; // @[SRAM.scala 12:16]
  wire  mem_MPORT_3_en; // @[SRAM.scala 12:16]
  wire  _T = io_w_en != 4'h0; // @[SRAM.scala 15:16]
  wire [7:0] read_data_bytes_1 = mem_read_data_bytes_1_MPORT_data; // @[SRAM.scala 23:32 25:22]
  wire [7:0] read_data_bytes_0 = mem_read_data_bytes_0_MPORT_data; // @[SRAM.scala 23:32 24:22]
  wire [15:0] io_read_data_lo = {read_data_bytes_1,read_data_bytes_0}; // @[Cat.scala 31:58]
  wire [7:0] read_data_bytes_3 = mem_read_data_bytes_3_MPORT_data; // @[SRAM.scala 23:32 27:22]
  wire [7:0] read_data_bytes_2 = mem_read_data_bytes_2_MPORT_data; // @[SRAM.scala 23:32 26:22]
  wire [15:0] io_read_data_hi = {read_data_bytes_3,read_data_bytes_2}; // @[Cat.scala 31:58]
  assign mem_read_data_bytes_0_MPORT_en = 1'h1;
  assign mem_read_data_bytes_0_MPORT_addr = io_address;
  assign mem_read_data_bytes_0_MPORT_data = mem[mem_read_data_bytes_0_MPORT_addr]; // @[SRAM.scala 12:16]
  assign mem_read_data_bytes_1_MPORT_en = 1'h1;
  assign mem_read_data_bytes_1_MPORT_addr = io_address + 16'h1;
  assign mem_read_data_bytes_1_MPORT_data = mem[mem_read_data_bytes_1_MPORT_addr]; // @[SRAM.scala 12:16]
  assign mem_read_data_bytes_2_MPORT_en = 1'h1;
  assign mem_read_data_bytes_2_MPORT_addr = io_address + 16'h2;
  assign mem_read_data_bytes_2_MPORT_data = mem[mem_read_data_bytes_2_MPORT_addr]; // @[SRAM.scala 12:16]
  assign mem_read_data_bytes_3_MPORT_en = 1'h1;
  assign mem_read_data_bytes_3_MPORT_addr = io_address + 16'h3;
  assign mem_read_data_bytes_3_MPORT_data = mem[mem_read_data_bytes_3_MPORT_addr]; // @[SRAM.scala 12:16]
  assign mem_MPORT_data = io_write_data[7:0];
  assign mem_MPORT_addr = io_address;
  assign mem_MPORT_mask = 1'h1;
  assign mem_MPORT_en = _T & io_w_en[0];
  assign mem_MPORT_1_data = io_write_data[15:8];
  assign mem_MPORT_1_addr = io_address + 16'h1;
  assign mem_MPORT_1_mask = 1'h1;
  assign mem_MPORT_1_en = _T & io_w_en[1];
  assign mem_MPORT_2_data = io_write_data[23:16];
  assign mem_MPORT_2_addr = io_address + 16'h2;
  assign mem_MPORT_2_mask = 1'h1;
  assign mem_MPORT_2_en = _T & io_w_en[2];
  assign mem_MPORT_3_data = io_write_data[31:24];
  assign mem_MPORT_3_addr = io_address + 16'h3;
  assign mem_MPORT_3_mask = 1'h1;
  assign mem_MPORT_3_en = _T & io_w_en[3];
  assign io_read_data = {io_read_data_hi,io_read_data_lo}; // @[Cat.scala 31:58]
  always @(posedge clock) begin
    if (mem_MPORT_en & mem_MPORT_mask) begin
      mem[mem_MPORT_addr] <= mem_MPORT_data; // @[SRAM.scala 12:16]
    end
    if (mem_MPORT_1_en & mem_MPORT_1_mask) begin
      mem[mem_MPORT_1_addr] <= mem_MPORT_1_data; // @[SRAM.scala 12:16]
    end
    if (mem_MPORT_2_en & mem_MPORT_2_mask) begin
      mem[mem_MPORT_2_addr] <= mem_MPORT_2_data; // @[SRAM.scala 12:16]
    end
    if (mem_MPORT_3_en & mem_MPORT_3_mask) begin
      mem[mem_MPORT_3_addr] <= mem_MPORT_3_data; // @[SRAM.scala 12:16]
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
`ifdef RANDOMIZE_MEM_INIT
  _RAND_0 = {1{`RANDOM}};
  for (initvar = 0; initvar < 65536; initvar = initvar+1)
    mem[initvar] = _RAND_0[7:0];
`endif // RANDOMIZE_MEM_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
