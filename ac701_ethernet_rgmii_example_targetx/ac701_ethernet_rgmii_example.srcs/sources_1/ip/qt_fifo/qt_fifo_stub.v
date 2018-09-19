// Copyright 1986-2015 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2015.3 (win64) Build 1368829 Mon Sep 28 20:06:43 MDT 2015
// Date        : Mon Jan 04 14:57:04 2016
// Host        : PC1 running 64-bit Service Pack 1  (build 7601)
// Command     : write_verilog -force -mode synth_stub
//               c:/Users/Kevin/Desktop/KO/ac701_ethernet_rgmii_example_targetx/ac701_ethernet_rgmii_example.srcs/sources_1/ip/qt_fifo/qt_fifo_stub.v
// Design      : qt_fifo
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7a200tfbg676-2
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "fifo_generator_v13_0_0,Vivado 2015.3" *)
module qt_fifo(rst, wr_clk, rd_clk, din, wr_en, rd_en, dout, full, empty, almost_empty)
/* synthesis syn_black_box black_box_pad_pin="rst,wr_clk,rd_clk,din[17:0],wr_en,rd_en,dout[17:0],full,empty,almost_empty" */;
  input rst;
  input wr_clk;
  input rd_clk;
  input [17:0]din;
  input wr_en;
  input rd_en;
  output [17:0]dout;
  output full;
  output empty;
  output almost_empty;
endmodule
