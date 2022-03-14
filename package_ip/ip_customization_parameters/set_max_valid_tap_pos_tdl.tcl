# Maximal position inside SampledTaps used by ValidPositionTap to extract the valid (MAX = HIGH that is LEFT attribute downto vect)
# MAX_VALID_TAP_POS	:	NATURAL		:=	3;

# ---------------- MAX_VALID_TAP_POS -----------------
set MIN_MAX_VALID_TAP_POS 0
set MAX_MAX_VALID_TAP_POS [expr [get_property value [ipx::get_user_parameters BIT_SMP_TDL -of_objects [ipx::current_core]]] -1]
set DEFAULT_MAX_VALID_TAP_POS $MAX_MAX_VALID_TAP_POS

set enablement {False}
set editable {$DEBUG_MODE == {true}}

set dependency {}

set tooltip "Select the maximum position of the bit of sampled taps of TDL to insert in the MUX using in DEBUG for valid generation"
set display_name "Maximum Valid Position"

set_param_long_range "MAX_VALID_TAP_POS" $MIN_MAX_VALID_TAP_POS $MAX_MAX_VALID_TAP_POS $DEFAULT_MAX_VALID_TAP_POS $enablement $editable $dependency $tooltip $display_name
# ----------------------------------------------
