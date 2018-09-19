// Copyright 1986-2015 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2015.3 (win64) Build 1368829 Mon Sep 28 20:06:43 MDT 2015
// Date        : Mon Mar 19 15:43:43 2018
// Host        : DESKTOP-2IK74EL running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub {C:/Users/Jose
//               Idlabs/Documents/ac701_ethernet_rgmii_example_targetx/ac701_ethernet_rgmii_example.srcs/sources_1/ip/srout_bram_blkmem/srout_bram_blkmem_stub.v}
// Design      : srout_bram_blkmem
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7a200tfbg676-2
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "blk_mem_gen_v8_3_0,Vivado 2015.3" *)
module srout_bram_blkmem(clka, wea, addra, dina, douta, clkb, web, addrb, dinb, doutb)
/* synthesis syn_black_box black_box_pad_pin="clka,wea[0:0],addra[10:0],dina[19:0],douta[19:0],clkb,web[0:0],addrb[10:0],dinb[19:0],doutb[19:0]" */;
  input clka;
  input [0:0]wea;
  input [10:0]addra;
  input [19:0]dina;
  output [19:0]douta;
  input clkb;
  input [0:0]web;
  input [10:0]addrb;
  input [19:0]dinb;
  output [19:0]doutb;
endmodule
