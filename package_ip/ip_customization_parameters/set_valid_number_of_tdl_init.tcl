# Initial number of TDL from which we want to extract the valid
# VALID_NUMBER_OF_TDL_INIT	:	INTEGER	RANGE 0 TO 15		:=	1;


# ---------------- VALID_NUMBER_OF_TDL_INIT -----------------
set MIN_VALID_NUMBER_OF_TDL_INIT 0
set MAX_VALID_NUMBER_OF_TDL_INIT [expr [get_property value [ipx::get_user_parameters NUMBER_OF_TDL -of_objects [ipx::current_core]]] -1]
set DEFAULT_VALID_NUMBER_OF_TDL_INIT 0

set enablement {True}
set editable {}

set dependency {}

set tooltip "Select the TDL for the valid position (if TDL Debug FALSE) or initalize the TDL to choose the valid position (if TDL Debug TRUE)"
set display_name "Valid Position TDL Initialization"

set_param_long_range "VALID_NUMBER_OF_TDL_INIT" $MIN_VALID_NUMBER_OF_TDL_INIT $MAX_VALID_NUMBER_OF_TDL_INIT $DEFAULT_VALID_NUMBER_OF_TDL_INIT $enablement $editable $dependency $tooltip $display_name
# ----------------------------------------------
