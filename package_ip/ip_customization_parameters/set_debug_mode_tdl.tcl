# True Active the AXI port for moving the Valid Position (Sampled Tap used) and valid Number (TDL used). It allows us to choose the valid, in case of more TDL in parallel.
# DEBUG_MODE		:	BOOLEAN	:=	TRUE;

# ------------- DEBUG_MODE -------------
set DEFAULT_DEBUG_MODE "FALSE"

set enablement {True}
set editable {}

set dependency {}

set tooltip "Allow to tune in real-time the valid position for its generation"
set display_name "Debug Port V-TDL"

set_param_bool "DEBUG_MODE" $DEFAULT_DEBUG_MODE $enablement $editable $dependency $tooltip $display_name
# ----------------------------------------------
