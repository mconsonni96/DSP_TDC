# Number of TDL in parallel
# NUMBER_OF_TDL	:	POSITIVE	RANGE 1 TO 16 	:= 5;

# ---------------- NUMBER_OF_TDL -----------------
set MIN_NUMBER_OF_TDL 1
set MAX_NUMBER_OF_TDL 16
set DEFAULT_NUMBER_OF_TDL $MIN_NUMBER_OF_TDL

set enablement {True}
set editable {}

set dependency {}

set tooltip "Number of TDL sub-Interpolated in each TDC channel"
set display_name "Number of TDL"

set_param_long_range "NUMBER_OF_TDL" $MIN_NUMBER_OF_TDL $MAX_NUMBER_OF_TDL $DEFAULT_NUMBER_OF_TDL $enablement $editable $dependency $tooltip $display_name
# ----------------------------------------------
