# Number of Carry chains in parallel
# NUMBER_OF_CARRY_CHAINS	:	POSITIVE	RANGE 1 TO 16 	:= 5;

# ---------------- NUMBER_OF_CARRY_CHAINS -----------------
set MIN_NUMBER_OF_CARRY_CHAINS 0
set MAX_NUMBER_OF_CARRY_CHAINS 16
set DEFAULT_NUMBER_OF_CARRY_CHAINS $MAX_NUMBER_OF_CARRY_CHAINS

set enablement {True}
set editable {}

set dependency {}

set tooltip "Number of Carry chains sub-Interpolated in each TDC channel"
set display_name "Number of CARRY Chains"

set_param_long_range "NUMBER_OF_CARRY_CHAINS" $MIN_NUMBER_OF_CARRY_CHAINS $MAX_NUMBER_OF_CARRY_CHAINS $DEFAULT_NUMBER_OF_CARRY_CHAINS $enablement $editable $dependency $tooltip $display_name
# ----------------------------------------------
