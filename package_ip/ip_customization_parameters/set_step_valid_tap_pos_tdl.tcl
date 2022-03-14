# Step used between MAX_VALID_TAP_POS and MIM_VALID_POS for assigned ValidPositionTap
# STEP_VALID_TAP_POS	:	POSITIVE	:=	1;

# ---------------- STEP_VALID_TAP_POS -----------------
set MIN_STEP_VALID_TAP_POS 1
set MAX_STEP_VALID_TAP_POS [expr [get_property value [ipx::get_user_parameters BIT_SMP_TDL -of_objects [ipx::current_core]]] -1]
set DEFAULT_STEP_VALID_TAP_POS 1

set enablement {False}
set editable {$DEBUG_MODE == true}

set dependency {}

set tooltip "Select the step between consecuteve position of the bit of sampled taps of TDL to insert in the MUX using in DEBUGle for valid generation"
set display_name "Step of Valid Position"

set_param_long_range "STEP_VALID_TAP_POS" $MIN_STEP_VALID_TAP_POS $MAX_STEP_VALID_TAP_POS $DEFAULT_STEP_VALID_TAP_POS $enablement $editable $dependency $tooltip $display_name
# ----------------------------------------------
