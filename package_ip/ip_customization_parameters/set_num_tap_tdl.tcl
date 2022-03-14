# Bit of the Tapped Delay-Line (number of buffers in the TDL)
# NUM_TAP_TDL		:	POSITIVE	RANGE 4 TO 4096	:= 32;

# ---------------- NUM_TAP_TDL -----------------
set MIN_NUM_TAP_TDL 4
set MAX_NUM_TAP_TDL 4096
set DEFAULT_NUM_TAP_TDL 256

set enablement {True}
set editable {}

set dependency {}

set tooltip "Number of Taps in each TDL"
set display_name "Number of Taps"

set_param_long_range "NUM_TAP_TDL" $MIN_NUM_TAP_TDL $MAX_NUM_TAP_TDL $DEFAULT_NUM_TAP_TDL $enablement $editable $dependency $tooltip $display_name
# ----------------------------------------------
