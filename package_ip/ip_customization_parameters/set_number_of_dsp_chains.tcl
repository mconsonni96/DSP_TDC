# Number of DSP chains in parallel
# NUMBER_OF_DSP_CHAINS	:	POSITIVE	RANGE 1 TO 16 	:= 5;

# ---------------- NUMBER_OF_DSP_CHAINS -----------------
set MIN_NUMBER_OF_DSP_CHAINS 0
set MAX_NUMBER_OF_DSP_CHAINS 16
set DEFAULT_NUMBER_OF_DSP_CHAINS $MAX_NUMBER_OF_DSP_CHAINS

set enablement {True}
set editable {}

set dependency {}

set tooltip "Number of DSP chains sub-Interpolated in each TDC channel"
set display_name "Number of DSP Chains"

set_param_long_range "NUMBER_OF_DSP_CHAINS" $MIN_NUMBER_OF_DSP_CHAINS $MAX_NUMBER_OF_DSP_CHAINS $DEFAULT_NUMBER_OF_DSP_CHAINS $enablement $editable $dependency $tooltip $display_name
# ----------------------------------------------
