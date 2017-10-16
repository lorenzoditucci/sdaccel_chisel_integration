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

module AXILiteControl(
  input         ap_clk,
  input         ap_rst_n,
  output        io_sl_writeAddr_ready,
  input         io_sl_writeAddr_valid,
  input  [63:0] io_sl_writeAddr_bits_addr,
  output        io_sl_writeData_ready,
  input         io_sl_writeData_valid,
  input  [31:0] io_sl_writeData_bits_data,
  input  [3:0]  io_sl_writeData_bits_strb,
  input         io_sl_writeResp_ready,
  output        io_sl_writeResp_valid,
  output        io_sl_readAddr_ready,
  input         io_sl_readAddr_valid,
  input  [63:0] io_sl_readAddr_bits_addr,
  input         io_sl_readData_ready,
  output        io_sl_readData_valid,
  output [31:0] io_sl_readData_bits_data
);
  reg  ap_start;
  reg [31:0] _RAND_0;
  reg  auto_restart;
  reg [31:0] _RAND_1;
  reg  ap_idle;
  reg [31:0] _RAND_2;
  reg  ap_done;
  reg [31:0] _RAND_3;
  reg  ap_start_r;
  reg [31:0] _RAND_4;
  wire  _T_51;
  wire  ap_start_pulse;
  wire  _GEN_0;
  wire  _T_54;
  wire  _T_55;
  wire  _GEN_1;
  wire  _T_60;
  wire  _T_61;
  wire  _GEN_2;
  reg [2:0] stateSlaveWrite;
  reg [31:0] _RAND_5;
  reg [5:0] writeAddr;
  reg [31:0] _RAND_6;
  reg [2:0] stateSlaveRead;
  reg [31:0] _RAND_7;
  reg [31:0] readData;
  reg [31:0] _RAND_8;
  wire  _T_69;
  wire  _T_70;
  wire  _T_71;
  wire  _T_117;
  wire  addrwr_handshake;
  wire  write_handshake;
  wire [63:0] _GEN_3;
  wire [2:0] _GEN_4;
  wire  _T_120;
  wire [2:0] _GEN_5;
  wire [2:0] _GEN_6;
  wire  _T_123;
  wire  _T_124;
  wire [2:0] _GEN_7;
  wire  _T_126;
  wire [2:0] _GEN_8;
  wire [2:0] _GEN_9;
  wire  _T_131;
  wire  _T_132;
  wire  _T_133;
  wire [2:0] _GEN_10;
  wire  _T_135;
  wire [2:0] _GEN_11;
  wire [2:0] _GEN_12;
  wire  _T_142;
  wire  _T_143;
  wire [2:0] _GEN_13;
  wire  _T_144;
  wire  _T_145;
  wire  _T_146;
  wire  addrrd_handshake;
  wire [2:0] _GEN_14;
  wire  _T_149;
  wire [2:0] _GEN_15;
  wire [2:0] _GEN_16;
  wire  _T_152;
  wire  _T_153;
  wire  _T_154;
  wire [2:0] _GEN_17;
  wire  _T_156;
  wire [2:0] _GEN_18;
  wire [2:0] _GEN_19;
  wire  _T_160;
  wire  _T_161;
  wire [2:0] _GEN_20;
  wire  _T_162;
  wire [1:0] _GEN_27;
  wire [1:0] _T_163;
  wire [1:0] _GEN_28;
  wire [1:0] _T_164;
  wire [2:0] _GEN_29;
  wire [2:0] _T_165;
  wire [2:0] _GEN_30;
  wire [2:0] _T_166;
  wire [3:0] _GEN_31;
  wire [3:0] _T_167;
  wire [3:0] _GEN_32;
  wire [3:0] _T_168;
  wire [7:0] _GEN_33;
  wire [7:0] _T_169;
  wire [7:0] _GEN_34;
  wire [7:0] _T_170;
  wire [31:0] _GEN_21;
  wire [31:0] _GEN_22;
  wire  _T_171;
  wire  _T_172;
  wire  _T_173;
  wire  _T_174;
  wire  _T_175;
  wire  _T_176;
  wire  _GEN_23;
  wire  _T_179;
  wire  _T_180;
  wire  _GEN_24;
  wire  _T_182;
  wire  _GEN_25;
  wire  _T_188;
  wire  _GEN_26;
  assign io_sl_writeAddr_ready = _T_70;
  assign io_sl_writeData_ready = _T_71;
  assign io_sl_writeResp_valid = _T_117;
  assign io_sl_readAddr_ready = _T_145;
  assign io_sl_readData_valid = _T_146;
  assign io_sl_readData_bits_data = readData;
  assign _T_51 = ap_start_r == 1'h0;
  assign ap_start_pulse = ap_start & _T_51;
  assign _GEN_0 = ap_done ? 1'h1 : ap_idle;
  assign _T_54 = ap_done == 1'h0;
  assign _T_55 = _T_54 & ap_start_pulse;
  assign _GEN_1 = _T_55 ? 1'h0 : _GEN_0;
  assign _T_60 = ap_start_pulse == 1'h0;
  assign _T_61 = _T_54 & _T_60;
  assign _GEN_2 = _T_61 ? ap_idle : _GEN_1;
  assign _T_69 = stateSlaveWrite == 3'h0;
  assign _T_70 = ap_rst_n & _T_69;
  assign _T_71 = stateSlaveWrite == 3'h1;
  assign _T_117 = stateSlaveWrite == 3'h2;
  assign addrwr_handshake = io_sl_writeAddr_valid & io_sl_writeAddr_ready;
  assign write_handshake = io_sl_writeData_valid & io_sl_writeData_ready;
  assign _GEN_3 = addrwr_handshake ? io_sl_writeAddr_bits_addr : {{58'd0}, writeAddr};
  assign _GEN_4 = io_sl_writeAddr_valid ? 3'h1 : stateSlaveWrite;
  assign _T_120 = io_sl_writeAddr_valid == 1'h0;
  assign _GEN_5 = _T_120 ? 3'h0 : _GEN_4;
  assign _GEN_6 = _T_69 ? _GEN_5 : stateSlaveWrite;
  assign _T_123 = _T_69 == 1'h0;
  assign _T_124 = _T_123 & _T_71;
  assign _GEN_7 = io_sl_writeData_valid ? 3'h2 : _GEN_6;
  assign _T_126 = io_sl_writeData_valid == 1'h0;
  assign _GEN_8 = _T_126 ? 3'h1 : _GEN_7;
  assign _GEN_9 = _T_124 ? _GEN_8 : _GEN_6;
  assign _T_131 = _T_71 == 1'h0;
  assign _T_132 = _T_123 & _T_131;
  assign _T_133 = _T_132 & _T_117;
  assign _GEN_10 = io_sl_writeResp_ready ? 3'h0 : _GEN_9;
  assign _T_135 = io_sl_writeResp_ready == 1'h0;
  assign _GEN_11 = _T_135 ? 3'h2 : _GEN_10;
  assign _GEN_12 = _T_133 ? _GEN_11 : _GEN_9;
  assign _T_142 = _T_117 == 1'h0;
  assign _T_143 = _T_132 & _T_142;
  assign _GEN_13 = _T_143 ? 3'h0 : _GEN_12;
  assign _T_144 = stateSlaveRead == 3'h0;
  assign _T_145 = ap_rst_n & _T_144;
  assign _T_146 = stateSlaveRead == 3'h3;
  assign addrrd_handshake = io_sl_readAddr_valid & io_sl_readAddr_ready;
  assign _GEN_14 = io_sl_readAddr_valid ? 3'h3 : stateSlaveRead;
  assign _T_149 = io_sl_readAddr_valid == 1'h0;
  assign _GEN_15 = _T_149 ? 3'h0 : _GEN_14;
  assign _GEN_16 = _T_144 ? _GEN_15 : stateSlaveRead;
  assign _T_152 = _T_144 == 1'h0;
  assign _T_153 = _T_152 & _T_146;
  assign _T_154 = io_sl_readData_valid & io_sl_readData_ready;
  assign _GEN_17 = _T_154 ? 3'h0 : _GEN_16;
  assign _T_156 = _T_154 == 1'h0;
  assign _GEN_18 = _T_156 ? 3'h3 : _GEN_17;
  assign _GEN_19 = _T_153 ? _GEN_18 : _GEN_16;
  assign _T_160 = _T_146 == 1'h0;
  assign _T_161 = _T_152 & _T_160;
  assign _GEN_20 = _T_161 ? 3'h0 : _GEN_19;
  assign _T_162 = io_sl_readAddr_bits_addr == 64'h0;
  assign _GEN_27 = {{1'd0}, ap_done};
  assign _T_163 = _GEN_27 << 1;
  assign _GEN_28 = {{1'd0}, ap_start};
  assign _T_164 = _GEN_28 | _T_163;
  assign _GEN_29 = {{2'd0}, ap_idle};
  assign _T_165 = _GEN_29 << 2;
  assign _GEN_30 = {{1'd0}, _T_164};
  assign _T_166 = _GEN_30 | _T_165;
  assign _GEN_31 = {{3'd0}, ap_done};
  assign _T_167 = _GEN_31 << 3;
  assign _GEN_32 = {{1'd0}, _T_166};
  assign _T_168 = _GEN_32 | _T_167;
  assign _GEN_33 = {{7'd0}, auto_restart};
  assign _T_169 = _GEN_33 << 7;
  assign _GEN_34 = {{4'd0}, _T_168};
  assign _T_170 = _GEN_34 | _T_169;
  assign _GEN_21 = _T_162 ? {{24'd0}, _T_170} : readData;
  assign _GEN_22 = addrrd_handshake ? _GEN_21 : readData;
  assign _T_171 = writeAddr == 6'h0;
  assign _T_172 = write_handshake & _T_171;
  assign _T_173 = io_sl_writeData_bits_strb[0];
  assign _T_174 = _T_172 & _T_173;
  assign _T_175 = io_sl_writeData_bits_data[0];
  assign _T_176 = _T_174 & _T_175;
  assign _GEN_23 = _T_176 ? 1'h1 : ap_start;
  assign _T_179 = _T_176 == 1'h0;
  assign _T_180 = _T_179 & ap_done;
  assign _GEN_24 = _T_180 ? auto_restart : _GEN_23;
  assign _T_182 = addrrd_handshake & _T_162;
  assign _GEN_25 = _T_182 ? 1'h0 : 1'h1;
  assign _T_188 = io_sl_writeData_bits_data[7];
  assign _GEN_26 = _T_174 ? _T_188 : auto_restart;
`ifdef RANDOMIZE
  integer initvar;
  initial begin
    `ifndef verilator
      #0.002 begin end
    `endif
  `ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{$random}};
  ap_start = _RAND_0[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {1{$random}};
  auto_restart = _RAND_1[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_2 = {1{$random}};
  ap_idle = _RAND_2[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_3 = {1{$random}};
  ap_done = _RAND_3[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_4 = {1{$random}};
  ap_start_r = _RAND_4[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_5 = {1{$random}};
  stateSlaveWrite = _RAND_5[2:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_6 = {1{$random}};
  writeAddr = _RAND_6[5:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_7 = {1{$random}};
  stateSlaveRead = _RAND_7[2:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_8 = {1{$random}};
  readData = _RAND_8[31:0];
  `endif // RANDOMIZE_REG_INIT
  end
`endif // RANDOMIZE
  always @(posedge ap_clk) begin
    if (!ap_rst_n) begin
      ap_start <= 1'h0;
    end else begin
      if (_T_180) begin
        ap_start <= auto_restart;
      end else begin
        if (_T_176) begin
          ap_start <= 1'h1;
        end
      end
    end
    if (!ap_rst_n) begin
      auto_restart <= 1'h0;
    end else begin
      if (_T_174) begin
        auto_restart <= _T_188;
      end
    end
    if (!ap_rst_n) begin
      ap_idle <= 1'h1;
    end else begin
      if (!(_T_61)) begin
        if (_T_55) begin
          ap_idle <= 1'h0;
        end else begin
          if (ap_done) begin
            ap_idle <= 1'h1;
          end
        end
      end
    end
    if (!ap_rst_n) begin
      ap_done <= 1'h0;
    end else begin
      if (_T_182) begin
        ap_done <= 1'h0;
      end else begin
        ap_done <= 1'h1;
      end
    end
    if (!ap_rst_n) begin
      ap_start_r <= 1'h0;
    end else begin
      ap_start_r <= ap_start;
    end
    if (!ap_rst_n) begin
      stateSlaveWrite <= 3'h0;
    end else begin
      if (_T_143) begin
        stateSlaveWrite <= 3'h0;
      end else begin
        if (_T_133) begin
          if (_T_135) begin
            stateSlaveWrite <= 3'h2;
          end else begin
            if (io_sl_writeResp_ready) begin
              stateSlaveWrite <= 3'h0;
            end else begin
              if (_T_124) begin
                if (_T_126) begin
                  stateSlaveWrite <= 3'h1;
                end else begin
                  if (io_sl_writeData_valid) begin
                    stateSlaveWrite <= 3'h2;
                  end else begin
                    if (_T_69) begin
                      if (_T_120) begin
                        stateSlaveWrite <= 3'h0;
                      end else begin
                        if (io_sl_writeAddr_valid) begin
                          stateSlaveWrite <= 3'h1;
                        end
                      end
                    end
                  end
                end
              end else begin
                if (_T_69) begin
                  if (_T_120) begin
                    stateSlaveWrite <= 3'h0;
                  end else begin
                    if (io_sl_writeAddr_valid) begin
                      stateSlaveWrite <= 3'h1;
                    end
                  end
                end
              end
            end
          end
        end else begin
          if (_T_124) begin
            if (_T_126) begin
              stateSlaveWrite <= 3'h1;
            end else begin
              if (io_sl_writeData_valid) begin
                stateSlaveWrite <= 3'h2;
              end else begin
                if (_T_69) begin
                  if (_T_120) begin
                    stateSlaveWrite <= 3'h0;
                  end else begin
                    if (io_sl_writeAddr_valid) begin
                      stateSlaveWrite <= 3'h1;
                    end
                  end
                end
              end
            end
          end else begin
            if (_T_69) begin
              if (_T_120) begin
                stateSlaveWrite <= 3'h0;
              end else begin
                if (io_sl_writeAddr_valid) begin
                  stateSlaveWrite <= 3'h1;
                end
              end
            end
          end
        end
      end
    end
    if (!ap_rst_n) begin
      writeAddr <= 6'h0;
    end else begin
      writeAddr <= _GEN_3[5:0];
    end
    if (!ap_rst_n) begin
      stateSlaveRead <= 3'h0;
    end else begin
      if (_T_161) begin
        stateSlaveRead <= 3'h0;
      end else begin
        if (_T_153) begin
          if (_T_156) begin
            stateSlaveRead <= 3'h3;
          end else begin
            if (_T_154) begin
              stateSlaveRead <= 3'h0;
            end else begin
              if (_T_144) begin
                if (_T_149) begin
                  stateSlaveRead <= 3'h0;
                end else begin
                  if (io_sl_readAddr_valid) begin
                    stateSlaveRead <= 3'h3;
                  end
                end
              end
            end
          end
        end else begin
          if (_T_144) begin
            if (_T_149) begin
              stateSlaveRead <= 3'h0;
            end else begin
              if (io_sl_readAddr_valid) begin
                stateSlaveRead <= 3'h3;
              end
            end
          end
        end
      end
    end
    if (!ap_rst_n) begin
      readData <= 32'h0;
    end else begin
      if (addrrd_handshake) begin
        if (_T_162) begin
          readData <= {{24'd0}, _T_170};
        end
      end
    end
  end
endmodule
module AdderAxi(
  input          ap_clk,
  input          ap_rst_n,
  input          m_axi_gmem_AWREADY,
  output         m_axi_gmem_AWVALID,
  output [63:0]  m_axi_gmem_AWADDR,
  output [2:0]   m_axi_gmem_AWSIZE,
  output [7:0]   m_axi_gmem_AWLEN,
  output [1:0]   m_axi_gmem_AWBURST,
  output         m_axi_gmem_AWID,
  output         m_axi_gmem_AWLOCK,
  output [3:0]   m_axi_gmem_AWCACHE,
  output [2:0]   m_axi_gmem_AWPROT,
  output [3:0]   m_axi_gmem_AWQOS,
  input          m_axi_gmem_WREADY,
  output         m_axi_gmem_WVALID,
  output [511:0] m_axi_gmem_WDATA,
  output [63:0]  m_axi_gmem_WSTRB,
  output         m_axi_gmem_WLAST,
  output         m_axi_gmem_BREADY,
  input          m_axi_gmem_BVALID,
  input          m_axi_gmem_BID,
  input  [1:0]   m_axi_gmem_BRESP,
  input          m_axi_gmem_ARREADY,
  output         m_axi_gmem_ARVALID,
  output [63:0]  m_axi_gmem_ARADDR,
  output [2:0]   m_axi_gmem_ARSIZE,
  output [7:0]   m_axi_gmem_ARLEN,
  output [1:0]   m_axi_gmem_ARBURST,
  output         m_axi_gmem_ARID,
  output         m_axi_gmem_ARLOCK,
  output [3:0]   m_axi_gmem_ARCACHE,
  output [2:0]   m_axi_gmem_ARPROT,
  output [3:0]   m_axi_gmem_ARQOS,
  output         m_axi_gmem_RREADY,
  input          m_axi_gmem_RVALID,
  input  [511:0] m_axi_gmem_RDATA,
  input          m_axi_gmem_RID,
  input          m_axi_gmem_RLAST,
  input  [1:0]   m_axi_gmem_RRESP,
  output         S_AXI_CONTROL_AWREADY,
  input          S_AXI_CONTROL_AWVALID,
  input  [63:0]  S_AXI_CONTROL_AWADDR,
  input  [2:0]   S_AXI_CONTROL_AWPROT,
  output         S_AXI_CONTROL_WREADY,
  input          S_AXI_CONTROL_WVALID,
  input  [31:0]  S_AXI_CONTROL_WDATA,
  input  [3:0]   S_AXI_CONTROL_WSTRB,
  input          S_AXI_CONTROL_BREADY,
  output         S_AXI_CONTROL_BVALID,
  output [1:0]   S_AXI_CONTROL_BRESP,
  output         S_AXI_CONTROL_ARREADY,
  input          S_AXI_CONTROL_ARVALID,
  input  [63:0]  S_AXI_CONTROL_ARADDR,
  input  [2:0]   S_AXI_CONTROL_ARPROT,
  input          S_AXI_CONTROL_RREADY,
  output         S_AXI_CONTROL_RVALID,
  output [31:0]  S_AXI_CONTROL_RDATA,
  output [1:0]   S_AXI_CONTROL_RRESP
);
  wire  slave_fsm_ap_clk;
  wire  slave_fsm_reset;
  wire  slave_fsm_io_sl_writeAddr_ready;
  wire  slave_fsm_io_sl_writeAddr_valid;
  wire [63:0] slave_fsm_io_sl_writeAddr_bits_addr;
  wire  slave_fsm_io_sl_writeData_ready;
  wire  slave_fsm_io_sl_writeData_valid;
  wire [31:0] slave_fsm_io_sl_writeData_bits_data;
  wire [3:0] slave_fsm_io_sl_writeData_bits_strb;
  wire  slave_fsm_io_sl_writeResp_ready;
  wire  slave_fsm_io_sl_writeResp_valid;
  wire  slave_fsm_io_sl_readAddr_ready;
  wire  slave_fsm_io_sl_readAddr_valid;
  wire [63:0] slave_fsm_io_sl_readAddr_bits_addr;
  wire  slave_fsm_io_sl_readData_ready;
  wire  slave_fsm_io_sl_readData_valid;
  wire [31:0] slave_fsm_io_sl_readData_bits_data;
  AXILiteControl slave_fsm (
    .ap_clk(slave_fsm_ap_clk),
    .reset(slave_fsm_reset),
    .io_sl_writeAddr_ready(slave_fsm_io_sl_writeAddr_ready),
    .io_sl_writeAddr_valid(slave_fsm_io_sl_writeAddr_valid),
    .io_sl_writeAddr_bits_addr(slave_fsm_io_sl_writeAddr_bits_addr),
    .io_sl_writeData_ready(slave_fsm_io_sl_writeData_ready),
    .io_sl_writeData_valid(slave_fsm_io_sl_writeData_valid),
    .io_sl_writeData_bits_data(slave_fsm_io_sl_writeData_bits_data),
    .io_sl_writeData_bits_strb(slave_fsm_io_sl_writeData_bits_strb),
    .io_sl_writeResp_ready(slave_fsm_io_sl_writeResp_ready),
    .io_sl_writeResp_valid(slave_fsm_io_sl_writeResp_valid),
    .io_sl_readAddr_ready(slave_fsm_io_sl_readAddr_ready),
    .io_sl_readAddr_valid(slave_fsm_io_sl_readAddr_valid),
    .io_sl_readAddr_bits_addr(slave_fsm_io_sl_readAddr_bits_addr),
    .io_sl_readData_ready(slave_fsm_io_sl_readData_ready),
    .io_sl_readData_valid(slave_fsm_io_sl_readData_valid),
    .io_sl_readData_bits_data(slave_fsm_io_sl_readData_bits_data)
  );
  assign m_axi_gmem_AWVALID = 1'h0;
  assign m_axi_gmem_AWADDR = 64'h0;
  assign m_axi_gmem_AWSIZE = 3'h0;
  assign m_axi_gmem_AWLEN = 8'h0;
  assign m_axi_gmem_AWBURST = 2'h0;
  assign m_axi_gmem_AWID = 1'h0;
  assign m_axi_gmem_AWLOCK = 1'h0;
  assign m_axi_gmem_AWCACHE = 4'h0;
  assign m_axi_gmem_AWPROT = 3'h0;
  assign m_axi_gmem_AWQOS = 4'h0;
  assign m_axi_gmem_WVALID = 1'h0;
  assign m_axi_gmem_WDATA = 512'h0;
  assign m_axi_gmem_WSTRB = 64'h0;
  assign m_axi_gmem_WLAST = 1'h0;
  assign m_axi_gmem_BREADY = 1'h0;
  assign m_axi_gmem_ARVALID = 1'h0;
  assign m_axi_gmem_ARADDR = 64'h0;
  assign m_axi_gmem_ARSIZE = 3'h0;
  assign m_axi_gmem_ARLEN = 8'h0;
  assign m_axi_gmem_ARBURST = 2'h0;
  assign m_axi_gmem_ARID = 1'h0;
  assign m_axi_gmem_ARLOCK = 1'h0;
  assign m_axi_gmem_ARCACHE = 4'h0;
  assign m_axi_gmem_ARPROT = 3'h0;
  assign m_axi_gmem_ARQOS = 4'h0;
  assign m_axi_gmem_RREADY = 1'h0;
  assign S_AXI_CONTROL_AWREADY = slave_fsm_io_sl_writeAddr_ready;
  assign S_AXI_CONTROL_WREADY = slave_fsm_io_sl_writeData_ready;
  assign S_AXI_CONTROL_BVALID = slave_fsm_io_sl_writeResp_valid;
  assign S_AXI_CONTROL_BRESP = 2'h0;
  assign S_AXI_CONTROL_ARREADY = slave_fsm_io_sl_readAddr_ready;
  assign S_AXI_CONTROL_RVALID = slave_fsm_io_sl_readData_valid;
  assign S_AXI_CONTROL_RDATA = slave_fsm_io_sl_readData_bits_data;
  assign S_AXI_CONTROL_RRESP = 2'h0;
  assign slave_fsm_ap_clk = ap_clk;
  assign slave_fsm_reset = ap_rst_n;
  assign slave_fsm_io_sl_writeAddr_valid = S_AXI_CONTROL_AWVALID;
  assign slave_fsm_io_sl_writeAddr_bits_addr = S_AXI_CONTROL_AWADDR;
  assign slave_fsm_io_sl_writeData_valid = S_AXI_CONTROL_WVALID;
  assign slave_fsm_io_sl_writeData_bits_data = S_AXI_CONTROL_WDATA;
  assign slave_fsm_io_sl_writeData_bits_strb = S_AXI_CONTROL_WSTRB;
  assign slave_fsm_io_sl_writeResp_ready = S_AXI_CONTROL_BREADY;
  assign slave_fsm_io_sl_readAddr_valid = S_AXI_CONTROL_ARVALID;
  assign slave_fsm_io_sl_readAddr_bits_addr = S_AXI_CONTROL_ARADDR;
  assign slave_fsm_io_sl_readData_ready = slave_fsm_io_sl_readData_ready;
endmodule
