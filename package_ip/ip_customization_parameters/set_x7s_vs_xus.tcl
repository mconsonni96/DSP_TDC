# 7-Series or Ultrascale
# X7S_VS_XUS	:	STRING(1 To 3)	:= "XUS";

# --------------XUS_VS_X7S---------------
set name "X7S_VS_XUS"

set LIST_X7S_VS_XUS {X7S XUS}
set DEFAULT_X7S_VS_XUS "XUS"

set enablement {True}
set editable {}

set dependency {}


set tooltip "Use TDL for Xilinx Xilinx 7-Series or Ultrascale"
set display_name "X7S vs XUS"

ipgui::add_param -name $name -component [ipx::current_core] -display_name $display_name -show_label {true} -show_range {true} -widget {}
set_param_string_list $name $LIST_X7S_VS_XUS $DEFAULT_X7S_VS_XUS $enablement $editable $dependency $tooltip $display_name
# ----------------------------------------------
