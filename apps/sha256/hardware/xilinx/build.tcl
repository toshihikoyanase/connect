open_project ../../../../platform/hardware/xilinx/stream_shell/stream_shell_prj/stream_shell_prj.xpr
update_compile_order -fileset sources_1
open_bd_design {../../../../platform/hardware/xilinx/stream_shell/stream_shell_prj/stream_shell_prj.srcs/sources_1/bd/design_1/design_1.bd}
set_property  ip_repo_paths  {../../../../platform/hardware/xilinx/modules/axis_network_interface/axis_network_interface_prj/solution1/impl/ip ./format/sha256_format_prj/solution1/impl/ip ./logic/sha256_prj/solution1/impl/ip ../../../../platform/hardware/xilinx/modules/axis_timer/axis_timer_prj/solution1/impl/ip ../../../../platform/hardware/xilinx/modules/data_router/data_router_prj/solution1/impl/ip ../../../../platform/hardware/xilinx/modules/logic_state/logic_state_prj/solution1/impl/ip ../../../../platform/hardware/xilinx/modules/task_manager/task_manager_prj/solution1/impl/ip ../../../../platform/hardware/xilinx/modules/mac_uart/mac_uart_prj/solution1/impl/ip} [current_project]
update_ip_catalog
startgroup
create_bd_cell -type ip -vlnv xilinx.com:hls:sha256:1.0 sha256_0
create_bd_cell -type ip -vlnv xilinx.com:hls:sha256_format:1.0 sha256_format_0
endgroup
connect_bd_intf_net [get_bd_intf_pins axis_register_slice_prepare_start/M_AXIS] [get_bd_intf_pins sha256_0/prepare_start_V_V]
connect_bd_intf_net [get_bd_intf_pins axis_register_slice_rx/M_AXIS] [get_bd_intf_pins sha256_format_0/rxDataIn_V]
connect_bd_intf_net [get_bd_intf_pins axis_register_slice_prepare_done/S_AXIS] [get_bd_intf_pins sha256_0/prepare_done_V_V]
connect_bd_intf_net [get_bd_intf_pins axis_register_slice_tx/S_AXIS] [get_bd_intf_pins sha256_format_0/txDataOut_V]
connect_bd_intf_net [get_bd_intf_pins sha256_format_0/rxEventOut_V_V] [get_bd_intf_pins axis_register_slice_format2logic/S_AXIS]
connect_bd_intf_net [get_bd_intf_pins axis_register_slice_format2logic/M_AXIS] [get_bd_intf_pins sha256_0/eventIn_V_V]
connect_bd_intf_net [get_bd_intf_pins sha256_0/resultOut_V_V] [get_bd_intf_pins axis_register_slice_logic2format/S_AXIS]
connect_bd_intf_net [get_bd_intf_pins axis_register_slice_logic2format/M_AXIS] [get_bd_intf_pins sha256_format_0/txEventIn_V_V]
startgroup
apply_bd_automation -rule xilinx.com:bd_rule:clkrst -config {Clk "/clk_wiz_0/clk_out1 (100 MHz)" }  [get_bd_pins axis_register_slice_logic2format/aclk]
apply_bd_automation -rule xilinx.com:bd_rule:clkrst -config {Clk "/clk_wiz_0/clk_out1 (100 MHz)" }  [get_bd_pins axis_register_slice_format2logic/aclk]
endgroup
make_wrapper -files [get_files ../../../../platform/hardware/xilinx/stream_shell/stream_shell_prj/stream_shell_prj.srcs/sources_1/bd/design_1/design_1.bd] -top
add_files -norecurse ../../../../platform/hardware/xilinx/stream_shell/stream_shell_prj/stream_shell_prj.srcs/sources_1/bd/design_1/hdl/design_1_wrapper.v
launch_runs impl_1 -to_step write_bitstream -jobs 4
wait_on_run impl_1
#open_hw
#connect_hw_server
#open_hw_target
#current_hw_device [get_hw_devices xc7a35t_0]
#refresh_hw_device -update_hw_probes false [lindex [get_hw_devices xc7a35t_0] 0]
#set_property PROBES.FILE {} [get_hw_devices xc7a35t_0]
#set_property FULL_PROBES.FILE {} [get_hw_devices xc7a35t_0]
#set_property PROGRAM.FILE {../../../../platform/hardware/xilinx/stream_shell/stream_shell_prj/stream_shell_prj.runs/impl_1/design_1_wrapper.bit} [get_hw_devices xc7a35t_0]
#program_hw_devices [get_hw_devices xc7a35t_0]
#refresh_hw_device [lindex [get_hw_devices xc7a35t_0] 0]
exit
