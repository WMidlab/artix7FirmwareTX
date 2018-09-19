// Copyright 1986-2015 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2015.3 (win64) Build 1368829 Mon Sep 28 20:06:43 MDT 2015
// Date        : Mon Jan 04 14:49:27 2016
// Host        : PC1 running 64-bit Service Pack 1  (build 7601)
// Command     : write_verilog -force -mode synth_stub
//               c:/Users/Kevin/Desktop/KO/ac701_ethernet_rgmii_example_targetx/ac701_ethernet_rgmii_example.srcs/sources_1/ip/blk_mem_gen_v8_3/blk_mem_gen_v8_3_stub.v
// Design      : blk_mem_gen_v8_3
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7a200tfbg676-2
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "blk_mem_gen_v8_3_0,Vivado 2015.3" *)
module blk_mem_gen_v8_3(clka, wea, addra, dina, clkb, addrb, doutb)
/* synthesis syn_black_box black_box_pad_pin="clka,wea[0:0],addra[10:0],dina[11:0],clkb,addrb[10:0],doutb[11:0]" */;
  input clka;
  input [0:0]wea;
  input [10:0]addra;
  input [11:0]dina;
  input clkb;
  input [10:0]addrb;
  output [11:0]doutb;
endmodule
