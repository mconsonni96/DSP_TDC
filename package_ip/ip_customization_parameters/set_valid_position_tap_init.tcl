# Initial position along the TDL from which we want to extract the valid in case of DEBUG_MODE= FALSE
# VALID_POSITION_TAP_INIT		:	INTEGER	RANGE 0 TO 4095		:=	3;


# ---------------- VALID_POSITION_TAP_INIT -----------------
set MIN_VALID_POSITION_TAP_INIT 0
set MAX_VALID_POSITION_TAP_INIT [expr [get_property value [ipx::get_user_parameters BIT_SMP_TDL -of_objects [ipx::current_core]]] -1]
set DEFAULT_VALID_POSITION_TAP_INIT $MAX_VALID_POSITION_TAP_INIT


if {$MAX_VALID_POSITION_TAP_INIT > 31} {
	set DEFAULT_VALID_POSITION_TAP_INIT 31

} else {
	set DEFAULT_VALID_POSITION_TAP_INIT 0

}

set enablement {True}
set editable {}

set dependency {}

set tooltip "Select the tap position for the valid (if TDL Debug FALSE) or initalize the position (if TDL Debug TRUE)"
set display_name "Valid Position Tap Initialization"

set_param_long_range "VALID_POSITION_TAP_INIT" $MIN_VALID_POSITION_TAP_INIT $MAX_VALID_POSITION_TAP_INIT $DEFAULT_VALID_POSITION_TAP_INIT $enablement $editable $dependency $tooltip $display_name
# ----------------------------------------------
