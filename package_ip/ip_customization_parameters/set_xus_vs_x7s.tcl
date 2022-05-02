# Ultrascale or 7-Series
# XUS_VS_X7S	:	STRING(1 To 3)	:= "XUS";

# --------------XUS_VS_X7S---------------
set name "XUS_VS_X7S"

set LIST_XUS_VS_X7S {XUS X7S}
set DEFAULT_XUS_VS_X7S "XUS"

set enablement {True}
set editable {}

set dependency {}


set tooltip "Use TDL for Xilinx Ultrascale or 7-Series"
set display_name "XUS vs X7S"

ipgui::add_param -name $name -component [ipx::current_core] -display_name $display_name -show_label {true} -show_range {true} -widget {}
set_param_string_list $name $LIST_XUS_VS_X7S $DEFAULT_XUS_VS_X7S $enablement $editable $dependency $tooltip $display_name
# ----------------------------------------------
