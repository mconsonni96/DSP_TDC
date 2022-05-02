# Buffering stage for the valid synch, it allows us to allign the data and the corresponding valid to the same clock pulse
# BUFFERING_STAGE	:	BOOLEAN	:= TRUE;

# ------------- BUFFERING_STAGE ----------
set DEFAULT_BUFFERING_STAGE "FALSE"

set enablement {True}
set editable {}

set dependency {}

set tooltip "Insertion of a further buffering stage between TDL and decoder for bufferazing the generation of the valid"
set display_name "Buffering Stage inside TDL"

set_param_bool "BUFFERING_STAGE" $DEFAULT_BUFFERING_STAGE $enablement $editable $dependency $tooltip $display_name
# ----------------------------------------------
