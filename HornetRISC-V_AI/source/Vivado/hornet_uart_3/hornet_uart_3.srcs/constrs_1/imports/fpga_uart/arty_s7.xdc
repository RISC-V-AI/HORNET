#Constraints for Arty-S7 FPGA Board

#100MHz input clock
set_property -dict {PACKAGE_PIN E3 IOSTANDARD SSTL135} [get_ports M100_clk_i]
#Reset input from switch
set_property -dict {PACKAGE_PIN C12 IOSTANDARD LVCMOS33} [get_ports reset_i]
#Uart RX
set_property -dict {PACKAGE_PIN C4 IOSTANDARD LVCMOS33} [get_ports rx_i]
#Uart TX
#set_property -dict {PACKAGE_PIN C17 IOSTANDARD LVCMOS33} [get_ports temp]
set_property -dict {PACKAGE_PIN D4 IOSTANDARD LVCMOS33} [get_ports tx_o]
set_property -dict {PACKAGE_PIN D14 IOSTANDARD LVCMOS33} [get_ports stb]

#Debug leds
set_property -dict {PACKAGE_PIN H17 IOSTANDARD LVCMOS33} [get_ports led1]
set_property -dict {PACKAGE_PIN K15 IOSTANDARD LVCMOS33} [get_ports led2]
set_property -dict {PACKAGE_PIN J13 IOSTANDARD LVCMOS33} [get_ports led4]
#
set_property -dict {PACKAGE_PIN C17 IOSTANDARD LVCMOS33} [get_ports trigger]
set_property -dict {PACKAGE_PIN G16 IOSTANDARD LVCMOS33} [get_ports clk_o]



#set_property MARK_DEBUG true [get_nets uart0/stb_0]
#create_debug_core u_ila_0 ila
#set_property ALL_PROBE_SAME_MU true [get_debug_cores u_ila_0]
#set_property ALL_PROBE_SAME_MU_CNT 2 [get_debug_cores u_ila_0]
#set_property C_ADV_TRIGGER false [get_debug_cores u_ila_0]
#set_property C_DATA_DEPTH 131072 [get_debug_cores u_ila_0]
#set_property C_EN_STRG_QUAL true [get_debug_cores u_ila_0]
#set_property C_INPUT_PIPE_STAGES 0 [get_debug_cores u_ila_0]
#set_property C_TRIGIN_EN false [get_debug_cores u_ila_0]
#set_property C_TRIGOUT_EN false [get_debug_cores u_ila_0]
#set_property port_width 1 [get_debug_ports u_ila_0/clk]
#connect_debug_port u_ila_0/clk [get_nets [list clkwiz0/inst/clk_out1]]
#set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe0]
#set_property port_width 8 [get_debug_ports u_ila_0/probe0]
#connect_debug_port u_ila_0/probe0 [get_nets [list {uart0/D[0]} {uart0/D[1]} {uart0/D[2]} {uart0/D[3]} {uart0/D[4]} {uart0/D[5]} {uart0/D[6]} {uart0/D[7]}]]
#create_debug_port u_ila_0 probe
#set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe1]
#set_property port_width 1 [get_debug_ports u_ila_0/probe1]
#connect_debug_port u_ila_0/probe1 [get_nets [list uart0/stb_0]]
#create_debug_port u_ila_0 probe
#set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe2]
#set_property port_width 1 [get_debug_ports u_ila_0/probe2]
#connect_debug_port u_ila_0/probe2 [get_nets [list tx_o_OBUF]]
#set_property C_CLK_INPUT_FREQ_HZ 300000000 [get_debug_cores dbg_hub]
#set_property C_ENABLE_CLK_DIVIDER false [get_debug_cores dbg_hub]
#set_property C_USER_SCAN_CHAIN 1 [get_debug_cores dbg_hub]
#connect_debug_port dbg_hub/clk [get_nets clk_i]

