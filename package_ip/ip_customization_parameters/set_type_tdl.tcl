# Type of TDL
# 	C_VS_O	:	STRING(1 To 1)	:= "O";

# --------------C_VS_O---------------
set LIST_TYPE_TDL {C O}
set DEFAULT_TYPE_TDL "O"

set enablement {True}
set editable {}

set dependency {}


set tooltip "Use C or O sampling"
set display_name "TYPE TDL"

set_param_string_list "TYPE_TDL_0" $LIST_TYPE_TDL $DEFAULT_TYPE_TDL $enablement $editable $dependency $tooltip $display_name

