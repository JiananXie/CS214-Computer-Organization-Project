# 
# Synthesis run script generated by Vivado
# 

proc create_report { reportName command } {
  set status "."
  append status $reportName ".fail"
  if { [file exists $status] } {
    eval file delete [glob $status]
  }
  send_msg_id runtcl-4 info "Executing : $command"
  set retval [eval catch { $command } msg]
  if { $retval != 0 } {
    set fp [open $status w]
    close $fp
    send_msg_id runtcl-5 warning "$msg"
  }
}
set_param xicom.use_bs_reader 1
set_param project.vivado.isBlockSynthRun true
set_msg_config -msgmgr_mode ooc_run
create_project -in_memory -part xc7a100tfgg484-1

set_param project.singleFileAddWarning.threshold 0
set_param project.compositeFile.enableAutoGeneration 0
set_param synth.vivado.isSynthRun true
set_msg_config -source 4 -id {IP_Flow 19-2162} -severity warning -new_severity info
set_property webtalk.parent_dir P:/CS214-Computer-Organization/Project-uart/verilog/verilog.cache/wt [current_project]
set_property parent.project_path P:/CS214-Computer-Organization/Project-uart/verilog/verilog.xpr [current_project]
set_property XPM_LIBRARIES {XPM_CDC XPM_MEMORY} [current_project]
set_property default_lib xil_defaultlib [current_project]
set_property target_language Verilog [current_project]
set_property ip_repo_paths p:/CS214-Computer-Organization/Project-uart/verilog/SEU_CSE_507_user_uart_bmpg_1.3 [current_project]
set_property ip_output_repo p:/CS214-Computer-Organization/Project-uart/verilog/verilog.cache/ip [current_project]
set_property ip_cache_permissions {read write} [current_project]
read_ip -quiet p:/CS214-Computer-Organization/Project-uart/verilog/verilog.srcs/sources_1/ip/clkout_upg/clkout_upg.xci
set_property used_in_implementation false [get_files -all p:/CS214-Computer-Organization/Project-uart/verilog/verilog.srcs/sources_1/ip/clkout_upg/clkout_upg_board.xdc]
set_property used_in_implementation false [get_files -all p:/CS214-Computer-Organization/Project-uart/verilog/verilog.srcs/sources_1/ip/clkout_upg/clkout_upg.xdc]
set_property used_in_implementation false [get_files -all p:/CS214-Computer-Organization/Project-uart/verilog/verilog.srcs/sources_1/ip/clkout_upg/clkout_upg_ooc.xdc]

# Mark all dcp files as not used in implementation to prevent them from being
# stitched into the results of this synthesis run. Any black boxes in the
# design are intentionally left as such for best results. Dcp files will be
# stitched into the design at a later time, either when this synthesis run is
# opened, or when it is stitched into a dependent implementation run.
foreach dcp [get_files -quiet -all -filter file_type=="Design\ Checkpoint"] {
  set_property used_in_implementation false $dcp
}
read_xdc dont_touch.xdc
set_property used_in_implementation false [get_files dont_touch.xdc]

set cached_ip [config_ip_cache -export -no_bom -use_project_ipc -dir P:/CS214-Computer-Organization/Project-uart/verilog/verilog.runs/clkout_upg_synth_1 -new_name clkout_upg -ip [get_ips clkout_upg]]

if { $cached_ip eq {} } {

synth_design -top clkout_upg -part xc7a100tfgg484-1 -mode out_of_context

#---------------------------------------------------------
# Generate Checkpoint/Stub/Simulation Files For IP Cache
#---------------------------------------------------------
# disable binary constraint mode for IPCache checkpoints
set_param constraints.enableBinaryConstraints false

catch {
 write_checkpoint -force -noxdef -rename_prefix clkout_upg_ clkout_upg.dcp

 set ipCachedFiles {}
 write_verilog -force -mode synth_stub -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ clkout_upg_stub.v
 lappend ipCachedFiles clkout_upg_stub.v

 write_vhdl -force -mode synth_stub -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ clkout_upg_stub.vhdl
 lappend ipCachedFiles clkout_upg_stub.vhdl

 write_verilog -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ clkout_upg_sim_netlist.v
 lappend ipCachedFiles clkout_upg_sim_netlist.v

 write_vhdl -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ clkout_upg_sim_netlist.vhdl
 lappend ipCachedFiles clkout_upg_sim_netlist.vhdl

 config_ip_cache -add -dcp clkout_upg.dcp -move_files $ipCachedFiles -use_project_ipc -ip [get_ips clkout_upg]
}

rename_ref -prefix_all clkout_upg_

# disable binary constraint mode for synth run checkpoints
set_param constraints.enableBinaryConstraints false
write_checkpoint -force -noxdef clkout_upg.dcp
create_report "clkout_upg_synth_1_synth_report_utilization_0" "report_utilization -file clkout_upg_utilization_synth.rpt -pb clkout_upg_utilization_synth.pb"

if { [catch {
  file copy -force P:/CS214-Computer-Organization/Project-uart/verilog/verilog.runs/clkout_upg_synth_1/clkout_upg.dcp p:/CS214-Computer-Organization/Project-uart/verilog/verilog.srcs/sources_1/ip/clkout_upg/clkout_upg.dcp
} _RESULT ] } { 
  send_msg_id runtcl-3 error "ERROR: Unable to successfully create or copy the sub-design checkpoint file."
  error "ERROR: Unable to successfully create or copy the sub-design checkpoint file."
}

if { [catch {
  write_verilog -force -mode synth_stub p:/CS214-Computer-Organization/Project-uart/verilog/verilog.srcs/sources_1/ip/clkout_upg/clkout_upg_stub.v
} _RESULT ] } { 
  puts "CRITICAL WARNING: Unable to successfully create a Verilog synthesis stub for the sub-design. This may lead to errors in top level synthesis of the design. Error reported: $_RESULT"
}

if { [catch {
  write_vhdl -force -mode synth_stub p:/CS214-Computer-Organization/Project-uart/verilog/verilog.srcs/sources_1/ip/clkout_upg/clkout_upg_stub.vhdl
} _RESULT ] } { 
  puts "CRITICAL WARNING: Unable to successfully create a VHDL synthesis stub for the sub-design. This may lead to errors in top level synthesis of the design. Error reported: $_RESULT"
}

if { [catch {
  write_verilog -force -mode funcsim p:/CS214-Computer-Organization/Project-uart/verilog/verilog.srcs/sources_1/ip/clkout_upg/clkout_upg_sim_netlist.v
} _RESULT ] } { 
  puts "CRITICAL WARNING: Unable to successfully create the Verilog functional simulation sub-design file. Post-Synthesis Functional Simulation with this file may not be possible or may give incorrect results. Error reported: $_RESULT"
}

if { [catch {
  write_vhdl -force -mode funcsim p:/CS214-Computer-Organization/Project-uart/verilog/verilog.srcs/sources_1/ip/clkout_upg/clkout_upg_sim_netlist.vhdl
} _RESULT ] } { 
  puts "CRITICAL WARNING: Unable to successfully create the VHDL functional simulation sub-design file. Post-Synthesis Functional Simulation with this file may not be possible or may give incorrect results. Error reported: $_RESULT"
}


} else {


if { [catch {
  file copy -force P:/CS214-Computer-Organization/Project-uart/verilog/verilog.runs/clkout_upg_synth_1/clkout_upg.dcp p:/CS214-Computer-Organization/Project-uart/verilog/verilog.srcs/sources_1/ip/clkout_upg/clkout_upg.dcp
} _RESULT ] } { 
  send_msg_id runtcl-3 error "ERROR: Unable to successfully create or copy the sub-design checkpoint file."
  error "ERROR: Unable to successfully create or copy the sub-design checkpoint file."
}

if { [catch {
  file rename -force P:/CS214-Computer-Organization/Project-uart/verilog/verilog.runs/clkout_upg_synth_1/clkout_upg_stub.v p:/CS214-Computer-Organization/Project-uart/verilog/verilog.srcs/sources_1/ip/clkout_upg/clkout_upg_stub.v
} _RESULT ] } { 
  puts "CRITICAL WARNING: Unable to successfully create a Verilog synthesis stub for the sub-design. This may lead to errors in top level synthesis of the design. Error reported: $_RESULT"
}

if { [catch {
  file rename -force P:/CS214-Computer-Organization/Project-uart/verilog/verilog.runs/clkout_upg_synth_1/clkout_upg_stub.vhdl p:/CS214-Computer-Organization/Project-uart/verilog/verilog.srcs/sources_1/ip/clkout_upg/clkout_upg_stub.vhdl
} _RESULT ] } { 
  puts "CRITICAL WARNING: Unable to successfully create a VHDL synthesis stub for the sub-design. This may lead to errors in top level synthesis of the design. Error reported: $_RESULT"
}

if { [catch {
  file rename -force P:/CS214-Computer-Organization/Project-uart/verilog/verilog.runs/clkout_upg_synth_1/clkout_upg_sim_netlist.v p:/CS214-Computer-Organization/Project-uart/verilog/verilog.srcs/sources_1/ip/clkout_upg/clkout_upg_sim_netlist.v
} _RESULT ] } { 
  puts "CRITICAL WARNING: Unable to successfully create the Verilog functional simulation sub-design file. Post-Synthesis Functional Simulation with this file may not be possible or may give incorrect results. Error reported: $_RESULT"
}

if { [catch {
  file rename -force P:/CS214-Computer-Organization/Project-uart/verilog/verilog.runs/clkout_upg_synth_1/clkout_upg_sim_netlist.vhdl p:/CS214-Computer-Organization/Project-uart/verilog/verilog.srcs/sources_1/ip/clkout_upg/clkout_upg_sim_netlist.vhdl
} _RESULT ] } { 
  puts "CRITICAL WARNING: Unable to successfully create the VHDL functional simulation sub-design file. Post-Synthesis Functional Simulation with this file may not be possible or may give incorrect results. Error reported: $_RESULT"
}

}; # end if cached_ip 

if {[file isdir P:/CS214-Computer-Organization/Project-uart/verilog/verilog.ip_user_files/ip/clkout_upg]} {
  catch { 
    file copy -force p:/CS214-Computer-Organization/Project-uart/verilog/verilog.srcs/sources_1/ip/clkout_upg/clkout_upg_stub.v P:/CS214-Computer-Organization/Project-uart/verilog/verilog.ip_user_files/ip/clkout_upg
  }
}

if {[file isdir P:/CS214-Computer-Organization/Project-uart/verilog/verilog.ip_user_files/ip/clkout_upg]} {
  catch { 
    file copy -force p:/CS214-Computer-Organization/Project-uart/verilog/verilog.srcs/sources_1/ip/clkout_upg/clkout_upg_stub.vhdl P:/CS214-Computer-Organization/Project-uart/verilog/verilog.ip_user_files/ip/clkout_upg
  }
}