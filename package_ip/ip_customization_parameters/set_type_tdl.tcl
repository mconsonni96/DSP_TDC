# CO vs O Sampling TDL #i
# TYPE_TDL_i		:	STRING	:= "C";

# ---------------- TYPE_TDL_0_i --------------------

for {set i 0} {$i < 16} {incr i} {

	set type_tdl_i "TYPE_TDL_"
	append type_tdl_i $i


	set LIST_TYPE_TDL {C O}
	set DEFAULT_TYPE_TDL "C"

	if {$i < 1} {
		set enablement {True}
	} else {
		set enablement {False}
	}

	set editable "$"
	append editable "NUMBER_OF_CARRY_CHAINS > "
	append editable $i
	set dependency {}

	set tooltip "CO vs O Sampling TDL $i"
	set display_name "Type TDL $i"

	set_param_string_list $type_tdl_i $LIST_TYPE_TDL $DEFAULT_TYPE_TDL $enablement $editable $dependency $tooltip $display_name

}
# ---------------------------------------------
