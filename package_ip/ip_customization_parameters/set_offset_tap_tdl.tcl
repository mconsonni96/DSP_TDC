# The TDL #i is sampled with an initial offset of bit respect to the Tap step of NUM_TAP_TDL/BIT_SMP_TDL, one different for TDL for more flexibility
# OFFSET_TAP_TDL_i	:	NATURAL		RANGE 0 TO 2047	:=	7;


# ---_OFFSET_TAP_TDL_i -----
for {set i 0} {$i < 16} {incr i} {

	set offset_tap_i "OFFSET_TAP_TDL_"
	append offset_tap_i $i

	set_property value_validation_type range_long [ipx::get_user_parameters $offset_tap_i -of_objects [ipx::current_core]]
	set_property value_validation_range_minimum 0 [ipx::get_user_parameters $offset_tap_i -of_objects [ipx::current_core]]
	set_property value_validation_range_maximum 2047 [ipx::get_user_parameters $offset_tap_i -of_objects [ipx::current_core]]

	set_property tooltip {Offset Taps of TDL [puts $i] Sampled} [ipgui::get_guiparamspec -name $offset_tap_i -component [ipx::current_core] ]



	set MIN_OFFSET_TAP_TDL 0
	# set MAX_OFFSET_TAP_TDL 4095
	set MAX_OFFSET_TAP_TDL [expr [get_property value [ipx::get_user_parameters NUM_TAP_TDL -of_objects [ipx::current_core]]] / [get_property value [ipx::get_user_parameters BIT_SMP_TDL -of_objects [ipx::current_core]]] -1]
	set DEFAULT_OFFSET_TAP_TDL 0

	if {$i < 1} {
		set enablement {True}
	} else {
		set enablement {False}
	}

	set editable "$"
	append editable "NUMBER_OF_CARRY_CHAINS > "
	append editable $i
	append editable "&&"
	append editable "$"
	append editable "BIT_SMP_TDL < "
	append editable "$"
	append editable "NUM_TAP_TDL"

	set dependency {}

	set tooltip "Offset Between consecutive Sampled Taps over the TDL $i"
	set display_name "Offset Sampled Taps TDL $i"

	set_param_long_range $offset_tap_i $MIN_OFFSET_TAP_TDL $MAX_OFFSET_TAP_TDL $DEFAULT_OFFSET_TAP_TDL $enablement $editable $dependency $tooltip $display_name

}
# ---------------------------------------------
