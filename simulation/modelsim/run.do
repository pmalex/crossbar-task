transcript on

vlib work

vlog ../../crossbar.v
vlog ../../arbiter.v
vlog crossbar.vt

vsim -t 1ns crossbar_vlg_tst

add wave -hexadecimal -label clk clk

add wave -hexadecimal -label reset reset

add wave -group master_0 -label master_0_req master_0_req
add wave -group master_0 -label master_0_ack master_0_ack
add wave -group master_0 -label master_0_cmd master_0_cmd
add wave -group master_0 -label master_0_resp master_0_resp
add wave -group master_0 -hexadecimal -label master_0_addr master_0_addr
add wave -group master_0 -hexadecimal -label master_0_wdata master_0_wdata
add wave -group master_0 -hexadecimal -label master_0_rdata master_0_rdata

add wave -group master_1 -label master_1_req master_1_req
add wave -group master_1 -label master_1_ack master_1_ack
add wave -group master_1 -label master_1_cmd master_1_cmd
add wave -group master_1 -label master_1_resp master_1_resp
add wave -group master_1 -hexadecimal -label master_1_addr master_1_addr
add wave -group master_1 -hexadecimal -label master_1_wdata master_1_wdata
add wave -group master_1 -hexadecimal -label master_1_rdata master_1_rdata

add wave -group master_2 -label master_2_req master_2_req
add wave -group master_2 -label master_2_ack master_2_ack
add wave -group master_2 -label master_2_cmd master_2_cmd
add wave -group master_2 -label master_2_resp master_2_resp
add wave -group master_2 -hexadecimal -label master_2_addr master_2_addr
add wave -group master_2 -hexadecimal -label master_2_wdata master_2_wdata
add wave -group master_2 -hexadecimal -label master_2_rdata master_2_rdata

add wave -group master_3 -label master_3_req master_3_req
add wave -group master_3 -label master_3_ack master_3_ack
add wave -group master_3 -label master_3_cmd master_3_cmd
add wave -group master_3 -label master_3_resp master_3_resp
add wave -group master_3 -hexadecimal -label master_3_addr master_3_addr
add wave -group master_3 -hexadecimal -label master_3_wdata master_3_wdata
add wave -group master_3 -hexadecimal -label master_3_rdata master_3_rdata

add wave -group slave_0 -hexadecimal -label slave_0_req slave_0_req
add wave -group slave_0 -hexadecimal -label slave_0_ack slave_0_ack
add wave -group slave_0 -hexadecimal -label slave_0_cmd slave_0_cmd
add wave -group slave_0 -hexadecimal -label slave_0_resp slave_0_resp
add wave -group slave_0 -hexadecimal -label slave_0_addr slave_0_addr
add wave -group slave_0 -hexadecimal -label slave_0_wdata slave_0_wdata
add wave -group slave_0 -hexadecimal -label slave_0_rdata slave_0_rdata

add wave -group slave_1 -hexadecimal -label slave_1_req slave_1_req
add wave -group slave_1 -hexadecimal -label slave_1_ack slave_1_ack
add wave -group slave_1 -hexadecimal -label slave_1_cmd slave_1_cmd
add wave -group slave_1 -hexadecimal -label slave_1_resp slave_1_resp
add wave -group slave_1 -hexadecimal -label slave_1_addr slave_1_addr
add wave -group slave_1 -hexadecimal -label slave_1_wdata slave_1_wdata
add wave -group slave_1 -hexadecimal -label slave_1_rdata slave_1_rdata

add wave -group slave_2 -hexadecimal -label slave_2_req slave_2_req
add wave -group slave_2 -hexadecimal -label slave_2_ack slave_2_ack
add wave -group slave_2 -hexadecimal -label slave_2_cmd slave_2_cmd
add wave -group slave_2 -hexadecimal -label slave_2_resp slave_2_resp
add wave -group slave_2 -hexadecimal -label slave_2_addr slave_2_addr
add wave -group slave_2 -hexadecimal -label slave_2_wdata slave_2_wdata
add wave -group slave_2 -hexadecimal -label slave_2_rdata slave_2_rdata

add wave -group slave_3 -hexadecimal -label slave_3_req slave_3_req
add wave -group slave_3 -hexadecimal -label slave_3_ack slave_3_ack
add wave -group slave_3 -hexadecimal -label slave_3_cmd slave_3_cmd
add wave -group slave_3 -hexadecimal -label slave_3_resp slave_3_resp
add wave -group slave_3 -hexadecimal -label slave_3_addr slave_3_addr
add wave -group slave_3 -hexadecimal -label slave_3_wdata slave_3_wdata
add wave -group slave_3 -hexadecimal -label slave_3_rdata slave_3_rdata

add wave -label crossbar/master i1/master
add wave -label crossbar/master_read i1/master_read


run 300

wave zoom full
