# Bit Sampled from the TDL each NUM_TAP_TDL/BIT_SMP_TDL after OFFSET_TAP_TDL, obviously equal in each TDLs.  Basically it is the number of Flip Flops
# BIT_SMP_TDL			:	POSITIVE	RANGE 1 TO 4096	:= 5

# ---------------- BIT_SMP_TDL -----------------
set MIN_BIT_SMP_TDL 1
# set MAX_BIT_SMP_TDL 4096
#set DEFAULT_BIT_SMP_TDL 256

set MAX_BIT_SMP_TDL [get_property value [ipx::get_user_parameters NUM_TAP_TDL -of_objects [ipx::current_core]]]
set DEFAULT_BIT_SMP_TDL $MAX_BIT_SMP_TDL

set enablement {True}
set editable {}

set dependency {}

set tooltip "Number of taps sampled on the TDL"
set display_name "Taps Sampled of the TDL"

set_param_long_range "BIT_SMP_TDL" $MIN_BIT_SMP_TDL $MAX_BIT_SMP_TDL $DEFAULT_BIT_SMP_TDL $enablement $editable $dependency $tooltip $display_name
# ----------------------------------------------
