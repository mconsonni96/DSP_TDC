# Minimal position inside SampledTaps used by ValidPositionTap to extract the valid (MIN = LOW that is RIGTH attribute in downto vect)
# MIN_VALID_TAP_POS	:	NATURAL		:=	1;

# ---------------- MIN_VALID_TAP_POS -----------------
set MIN_MIN_VALID_TAP_POS [expr 0 - [get_property value [ipx::get_user_parameters BIT_SMP_PRE_TDL -of_objects [ipx::current_core]]]]
#set MAX_MIN_VALID_TAP_POS 4096
set MAX_MIN_VALID_TAP_POS [expr [get_property value [ipx::get_user_parameters MAX_VALID_TAP_POS -of_objects [ipx::current_core]]] -1]
#set DEFAULT_MIN_VALID_TAP_POS 0
set DEFAULT_MIN_VALID_TAP_POS 0

set enablement {False}
set editable {$DEBUG_MODE == {true}}

set dependency {}

set tooltip "Select the minimum position of the bit of sampled taps of TDL to insert in the MUX using in DEBUG for valid generation"
set display_name "Minimum Valid Position"

set_param_long_range "MIN_VALID_TAP_POS" $MIN_MIN_VALID_TAP_POS $MAX_MIN_VALID_TAP_POS $DEFAULT_MIN_VALID_TAP_POS $enablement $editable $dependency $tooltip $display_name
# ----------------------------------------------
