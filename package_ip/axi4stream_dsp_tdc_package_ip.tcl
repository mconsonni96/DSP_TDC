
# =========================== SET PATH =========================================
set path "/home/mconsonni/Utility_Ip_Core/ip-repo/AXI4-Stream_HybridTDL/package_ip"
# ==============================================================================



# ============================ Identification ==================================
set vendor "DigiLAB"
set_property vendor $vendor [ipx::current_core]

set library "ip"
set_property library $library [ipx::current_core]

set name "AXI4Stream_HybridTDL"
set_property name $name [ipx::current_core]

set version "1.0"
set_property version $version [ipx::current_core]

set display_name "AXI4-Stream Xilinx Hybrid-TDC"
set_property display_name $display_name [ipx::current_core]

set description "TDC with Carry Chain and Digital Signal Processor with AXI4-Stream interface for the TDC"
set_property description $description [ipx::current_core]

set vendor_display_name {DigiLAB}
set_property vendor_display_name $vendor_display_name [ipx::current_core]

set company_url {}
set_property company_url $company_url [ipx::current_core]

set taxonomy {/TDC_Basic}
set_property taxonomy $taxonomy [ipx::current_core]
# ==============================================================================



# ========================== Import TCL Functions ==============================
#set path [pwd]
#regsub -all {(.)/logs} $path {\1} path
#append path "/Utility_Ip_Core/ip_repo/TDC_Basic/AXI4Stream_X7S_VirtualTDL/package_ip"
# ==============================================================================

# ====================== SET IP CUSTOMIZATION PARAMIETR ========================
set param_path $path
append param_path "/ip_customization_parameters/"
source [join [list $param_path "set_param_fx.tcl"] ""] -notrace

source [join [list $param_path "set_xus_vs_x7s.tcl"] ""] -notrace
source [join [list $param_path "set_type_tdl.tcl"] ""] -notrace
source [join [list $param_path "set_offset_tap_tdl.tcl"] ""] -notrace
source [join [list $param_path "set_debug_mode_tdl.tcl"] ""] -notrace
source [join [list $param_path "set_buffering_stage.tcl"] ""] -notrace
source [join [list $param_path "set_number_of_carry_chains.tcl"] ""] -notrace
source [join [list $param_path "set_number_of_dsp_chains.tcl"] ""] -notrace
source [join [list $param_path "set_num_tap_tdl.tcl"] ""] -notrace
source [join [list $param_path "set_bit_smp_tdl.tcl"] ""] -notrace
source [join [list $param_path "set_num_tap_pre_tdl.tcl"] ""] -notrace
source [join [list $param_path "set_bit_smp_pre_tdl.tcl"] ""] -notrace
source [join [list $param_path "set_valid_number_of_tdl_init.tcl"] ""] -notrace
source [join [list $param_path "set_valid_position_tap_init.tcl"] ""] -notrace
source [join [list $param_path "set_max_valid_tap_pos_tdl.tcl"] ""] -notrace
source [join [list $param_path "set_min_valid_tap_pos_tdl.tcl"] ""] -notrace
source [join [list $param_path "set_step_valid_tap_pos_tdl.tcl"] ""] -notrace
# ==============================================================================
