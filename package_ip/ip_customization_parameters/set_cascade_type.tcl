# Type of TDL
# 	C_VS_O	:	STRING(1 To 1)	:= "O";

# --------------C_VS_O---------------
set LIST_CASCADE_TYPE {B CARRY}
set DEFAULT_CASCADE_TYPE "B"

set enablement {True}
set editable {}

set dependency {}


set tooltip "Use B or CARRY cascade"
set display_name "CASCADE TYPE"

set_param_string_list "CASCADE_TYPE" $LIST_CASCADE_TYPE $DEFAULT_CASCADE_TYPE $enablement $editable $dependency $tooltip $display_name

