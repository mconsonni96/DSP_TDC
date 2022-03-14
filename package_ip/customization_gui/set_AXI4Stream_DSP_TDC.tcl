# ---------------------------- FILE_PATH_NAME_DELAY -----------------------------
proc update_PARAM_VALUE.FILE_PATH_NAME_CO_DELAY { PARAM_VALUE.FILE_PATH_NAME_CO_DELAY PARAM_VALUE.SIM_VS_IMP } {
	# Procedure called to update FILE_PATH_NAME_CO_DELAY when any of the dependent parameters in the arguments change

	set FILE_PATH_NAME_CO_DELAY ${PARAM_VALUE.FILE_PATH_NAME_CO_DELAY}
	set SIM_VS_IMP ${PARAM_VALUE.SIM_VS_IMP}
	set values(SIM_VS_IMP) [get_property value $SIM_VS_IMP]
	if { [gen_USERPARAMETER_FILE_PATH_NAME_CO_DELAY_ENABLEMENT $values(SIM_VS_IMP)] } {
		set_property enabled true $FILE_PATH_NAME_CO_DELAY
	} else {
		set_property enabled false $FILE_PATH_NAME_CO_DELAY
	}
}

proc validate_PARAM_VALUE.FILE_PATH_NAME_CO_DELAY { PARAM_VALUE.FILE_PATH_NAME_CO_DELAY } {
	# Procedure called to validate FILE_PATH_NAME_CO_DELAY
	return true
}

proc update_MODELPARAM_VALUE.FILE_PATH_NAME_CO_DELAY { MODELPARAM_VALUE.FILE_PATH_NAME_CO_DELAY PARAM_VALUE.FILE_PATH_NAME_CO_DELAY } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.FILE_PATH_NAME_CO_DELAY}] ${MODELPARAM_VALUE.FILE_PATH_NAME_CO_DELAY}
}

proc update_PARAM_VALUE.FILE_PATH_NAME_O_DELAY { PARAM_VALUE.FILE_PATH_NAME_O_DELAY PARAM_VALUE.SIM_VS_IMP } {
	# Procedure called to update FILE_PATH_NAME_O_DELAY when any of the dependent parameters in the arguments change

	set FILE_PATH_NAME_O_DELAY ${PARAM_VALUE.FILE_PATH_NAME_O_DELAY}
	set SIM_VS_IMP ${PARAM_VALUE.SIM_VS_IMP}
	set values(SIM_VS_IMP) [get_property value $SIM_VS_IMP]
	if { [gen_USERPARAMETER_FILE_PATH_NAME_O_DELAY_ENABLEMENT $values(SIM_VS_IMP)] } {
		set_property enabled true $FILE_PATH_NAME_O_DELAY
	} else {
		set_property enabled false $FILE_PATH_NAME_O_DELAY
	}
}

proc validate_PARAM_VALUE.FILE_PATH_NAME_O_DELAY { PARAM_VALUE.FILE_PATH_NAME_O_DELAY } {
	# Procedure called to validate FILE_PATH_NAME_O_DELAY
	return true
}

proc update_MODELPARAM_VALUE.FILE_PATH_NAME_O_DELAY { MODELPARAM_VALUE.FILE_PATH_NAME_O_DELAY PARAM_VALUE.FILE_PATH_NAME_O_DELAY } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.FILE_PATH_NAME_O_DELAY}] ${MODELPARAM_VALUE.FILE_PATH_NAME_O_DELAY}
}
# ------------------------------------------------------------------------------


# ----------------------------- MAX_VALID_TAP_POS ------------------------------
proc update_PARAM_VALUE.MAX_VALID_TAP_POS { PARAM_VALUE.MAX_VALID_TAP_POS PARAM_VALUE.DEBUG_MODE PARAM_VALUE.BIT_SMP_TDL} {
	# Procedure called to update MAX_VALID_TAP_POS when any of the dependent parameters in the arguments change

	set MAX_VALID_TAP_POS ${PARAM_VALUE.MAX_VALID_TAP_POS}
	set DEBUG_MODE ${PARAM_VALUE.DEBUG_MODE}
    set BIT_SMP_TDL ${PARAM_VALUE.BIT_SMP_TDL}


	set values(DEBUG_MODE) [get_property value $DEBUG_MODE]
    set values(MAX_VALID_TAP_POS) [get_property value $MAX_VALID_TAP_POS]
    set values(BIT_SMP_TDL) [get_property value $BIT_SMP_TDL]

    # Refresh the new range
    set MIN_MAX_VALID_TAP_POS 0
    set MAX_MAX_VALID_TAP_POS [expr $values(BIT_SMP_TDL) -1]
    set_property range  "$MIN_MAX_VALID_TAP_POS,$MAX_MAX_VALID_TAP_POS" $MAX_VALID_TAP_POS
    # Procedure called to update MIN_VALID_TAP_POS when any of the dependent parameters in the arguments change

	if { [gen_USERPARAMETER_MAX_VALID_TAP_POS_ENABLEMENT $values(DEBUG_MODE)] } {
		set_property enabled true $MAX_VALID_TAP_POS
	} else {
		set_property enabled false $MAX_VALID_TAP_POS
	}

}

proc validate_PARAM_VALUE.MAX_VALID_TAP_POS { PARAM_VALUE.MAX_VALID_TAP_POS } {
	# Procedure called to validate MAX_VALID_TAP_POS
	return true
}

proc update_MODELPARAM_VALUE.MAX_VALID_TAP_POS { MODELPARAM_VALUE.MAX_VALID_TAP_POS PARAM_VALUE.MAX_VALID_TAP_POS } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.MAX_VALID_TAP_POS}] ${MODELPARAM_VALUE.MAX_VALID_TAP_POS}
}
# ------------------------------------------------------------------------------


# ---------------------------- MIN_VALID_TAP_POS ------------------------------
proc update_PARAM_VALUE.MIN_VALID_TAP_POS { PARAM_VALUE.MIN_VALID_TAP_POS PARAM_VALUE.DEBUG_MODE PARAM_VALUE.MAX_VALID_TAP_POS PARAM_VALUE.BIT_SMP_PRE_TDL} {
	# Procedure called to update MIN_VALID_TAP_POS when any of the dependent parameters in the arguments change

	set MIN_VALID_TAP_POS ${PARAM_VALUE.MIN_VALID_TAP_POS}
	set DEBUG_MODE ${PARAM_VALUE.DEBUG_MODE}
    set MAX_VALID_TAP_POS ${PARAM_VALUE.MAX_VALID_TAP_POS}
	set BIT_SMP_PRE_TDL ${PARAM_VALUE.BIT_SMP_PRE_TDL}

    set values(MIN_VALID_TAP_POS) [get_property value $MIN_VALID_TAP_POS]
    set values(DEBUG_MODE) [get_property value $DEBUG_MODE]
    set values(MAX_VALID_TAP_POS) [get_property value $MAX_VALID_TAP_POS]
    set values(BIT_SMP_PRE_TDL) [get_property value $BIT_SMP_PRE_TDL]

    # Refresh the new range
    set MIN_MIN_VALID_TAP_POS [expr 0 - $values(BIT_SMP_PRE_TDL)]

	if {$values(MAX_VALID_TAP_POS) > 0} {
    	set MAX_MIN_VALID_TAP_POS [expr $values(MAX_VALID_TAP_POS) -1]
	} else {
		set MAX_MIN_VALID_TAP_POS 0
	}

    set_property range  "$MIN_MIN_VALID_TAP_POS,$MAX_MIN_VALID_TAP_POS" $MIN_VALID_TAP_POS
    # Procedure called to update MIN_VALID_TAP_POS when any of the dependent parameters in the arguments change

	if { [gen_USERPARAMETER_MIN_VALID_TAP_POS_ENABLEMENT $values(DEBUG_MODE)] } {
		set_property enabled true $MIN_VALID_TAP_POS
	} else {
		set_property enabled false $MIN_VALID_TAP_POS
	}

}

proc validate_PARAM_VALUE.MIN_VALID_TAP_POS { PARAM_VALUE.MIN_VALID_TAP_POS } {
	# Procedure called to validate MIN_VALID_TAP_POS
	return true
}

proc update_MODELPARAM_VALUE.MIN_VALID_TAP_POS { MODELPARAM_VALUE.MIN_VALID_TAP_POS PARAM_VALUE.MIN_VALID_TAP_POS } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.MIN_VALID_TAP_POS}] ${MODELPARAM_VALUE.MIN_VALID_TAP_POS}
}
# ------------------------------------------------------------------------------

# ----------------------------- OFFSET_TAP_TDL_i -------------------------------
proc update_PARAM_VALUE.OFFSET_TAP_TDL_0 { PARAM_VALUE.OFFSET_TAP_TDL_0 PARAM_VALUE.NUMBER_OF_TDL PARAM_VALUE.BIT_SMP_TDL PARAM_VALUE.NUM_TAP_TDL } {
	# Procedure called to update OFFSET_TAP_TDL_0 when any of the dependent parameters in the arguments change

	set OFFSET_TAP_TDL_0 ${PARAM_VALUE.OFFSET_TAP_TDL_0}
	set NUMBER_OF_TDL ${PARAM_VALUE.NUMBER_OF_TDL}
	set BIT_SMP_TDL ${PARAM_VALUE.BIT_SMP_TDL}
	set NUM_TAP_TDL ${PARAM_VALUE.NUM_TAP_TDL}
	set values(NUMBER_OF_TDL) [get_property value $NUMBER_OF_TDL]
	set values(BIT_SMP_TDL) [get_property value $BIT_SMP_TDL]
	set values(NUM_TAP_TDL) [get_property value $NUM_TAP_TDL]

	set MIN_OFFSET_TAP_TDL_0 0
	set MAX_OFFSET_TAP_TDL_0 [expr $values(NUM_TAP_TDL) / $values(BIT_SMP_TDL) + $values(NUM_TAP_TDL) % $values(BIT_SMP_TDL)  -1]
	set_property range  "$MIN_OFFSET_TAP_TDL_0,$MAX_OFFSET_TAP_TDL_0" $OFFSET_TAP_TDL_0
	# Procedure called to update MIN_VALID_TAP_POS when any of the dependent parameters in the arguments change

	if { [gen_USERPARAMETER_OFFSET_TAP_TDL_0_ENABLEMENT $values(NUMBER_OF_TDL) $values(BIT_SMP_TDL) $values(NUM_TAP_TDL)] } {
		set_property enabled true $OFFSET_TAP_TDL_0
	} else {
		set_property enabled false $OFFSET_TAP_TDL_0
	}
}

proc validate_PARAM_VALUE.OFFSET_TAP_TDL_0 { PARAM_VALUE.OFFSET_TAP_TDL_0 } {
	# Procedure called to validate OFFSET_TAP_TDL_0
	return true
}

proc update_MODELPARAM_VALUE.OFFSET_TAP_TDL_0 { MODELPARAM_VALUE.OFFSET_TAP_TDL_0 PARAM_VALUE.OFFSET_TAP_TDL_0 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.OFFSET_TAP_TDL_0}] ${MODELPARAM_VALUE.OFFSET_TAP_TDL_0}
}

proc update_PARAM_VALUE.OFFSET_TAP_TDL_1 { PARAM_VALUE.OFFSET_TAP_TDL_1 PARAM_VALUE.NUMBER_OF_TDL PARAM_VALUE.BIT_SMP_TDL PARAM_VALUE.NUM_TAP_TDL } {
	# Procedure called to update OFFSET_TAP_TDL_1 when any of the dependent parameters in the arguments change

	set OFFSET_TAP_TDL_1 ${PARAM_VALUE.OFFSET_TAP_TDL_1}
	set NUMBER_OF_TDL ${PARAM_VALUE.NUMBER_OF_TDL}
	set BIT_SMP_TDL ${PARAM_VALUE.BIT_SMP_TDL}
	set NUM_TAP_TDL ${PARAM_VALUE.NUM_TAP_TDL}
	set values(NUMBER_OF_TDL) [get_property value $NUMBER_OF_TDL]
	set values(BIT_SMP_TDL) [get_property value $BIT_SMP_TDL]
	set values(NUM_TAP_TDL) [get_property value $NUM_TAP_TDL]

	set MIN_OFFSET_TAP_TDL_1 0
	set MAX_OFFSET_TAP_TDL_1 [expr $values(NUM_TAP_TDL) / $values(BIT_SMP_TDL) + $values(NUM_TAP_TDL) % $values(BIT_SMP_TDL)  -1]
	set_property range  "$MIN_OFFSET_TAP_TDL_1,$MAX_OFFSET_TAP_TDL_1" $OFFSET_TAP_TDL_1
	# Procedure called to update MIN_VALID_TAP_POS when any of the dependent parameters in the arguments change

	if { [gen_USERPARAMETER_OFFSET_TAP_TDL_1_ENABLEMENT $values(NUMBER_OF_TDL) $values(BIT_SMP_TDL) $values(NUM_TAP_TDL)] } {
		set_property enabled true $OFFSET_TAP_TDL_1
	} else {
		set_property enabled false $OFFSET_TAP_TDL_1
	}
}

proc validate_PARAM_VALUE.OFFSET_TAP_TDL_1 { PARAM_VALUE.OFFSET_TAP_TDL_1 } {
	# Procedure called to validate OFFSET_TAP_TDL_1
	return true
}

proc update_MODELPARAM_VALUE.OFFSET_TAP_TDL_1 { MODELPARAM_VALUE.OFFSET_TAP_TDL_1 PARAM_VALUE.OFFSET_TAP_TDL_1 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.OFFSET_TAP_TDL_1}] ${MODELPARAM_VALUE.OFFSET_TAP_TDL_1}
}

proc update_PARAM_VALUE.OFFSET_TAP_TDL_2 { PARAM_VALUE.OFFSET_TAP_TDL_2 PARAM_VALUE.NUMBER_OF_TDL PARAM_VALUE.BIT_SMP_TDL PARAM_VALUE.NUM_TAP_TDL } {
	# Procedure called to update OFFSET_TAP_TDL_2 when any of the dependent parameters in the arguments change

	set OFFSET_TAP_TDL_2 ${PARAM_VALUE.OFFSET_TAP_TDL_2}
	set NUMBER_OF_TDL ${PARAM_VALUE.NUMBER_OF_TDL}
	set BIT_SMP_TDL ${PARAM_VALUE.BIT_SMP_TDL}
	set NUM_TAP_TDL ${PARAM_VALUE.NUM_TAP_TDL}
	set values(NUMBER_OF_TDL) [get_property value $NUMBER_OF_TDL]
	set values(BIT_SMP_TDL) [get_property value $BIT_SMP_TDL]
	set values(NUM_TAP_TDL) [get_property value $NUM_TAP_TDL]

	set MIN_OFFSET_TAP_TDL_2 0
	set MAX_OFFSET_TAP_TDL_2 [expr $values(NUM_TAP_TDL) / $values(BIT_SMP_TDL) + $values(NUM_TAP_TDL) % $values(BIT_SMP_TDL)  -1]
	set_property range  "$MIN_OFFSET_TAP_TDL_2,$MAX_OFFSET_TAP_TDL_2" $OFFSET_TAP_TDL_2
	# Procedure called to update MIN_VALID_TAP_POS when any of the dependent parameters in the arguments change

	if { [gen_USERPARAMETER_OFFSET_TAP_TDL_2_ENABLEMENT $values(NUMBER_OF_TDL) $values(BIT_SMP_TDL) $values(NUM_TAP_TDL)] } {
		set_property enabled true $OFFSET_TAP_TDL_2
	} else {
		set_property enabled false $OFFSET_TAP_TDL_2
	}
}

proc validate_PARAM_VALUE.OFFSET_TAP_TDL_2 { PARAM_VALUE.OFFSET_TAP_TDL_2 } {
	# Procedure called to validate OFFSET_TAP_TDL_2
	return true
}

proc update_MODELPARAM_VALUE.OFFSET_TAP_TDL_2 { MODELPARAM_VALUE.OFFSET_TAP_TDL_2 PARAM_VALUE.OFFSET_TAP_TDL_2 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.OFFSET_TAP_TDL_2}] ${MODELPARAM_VALUE.OFFSET_TAP_TDL_2}
}

proc update_PARAM_VALUE.OFFSET_TAP_TDL_3 { PARAM_VALUE.OFFSET_TAP_TDL_3 PARAM_VALUE.NUMBER_OF_TDL PARAM_VALUE.BIT_SMP_TDL PARAM_VALUE.NUM_TAP_TDL } {
	# Procedure called to update OFFSET_TAP_TDL_3 when any of the dependent parameters in the arguments change

	set OFFSET_TAP_TDL_3 ${PARAM_VALUE.OFFSET_TAP_TDL_3}
	set NUMBER_OF_TDL ${PARAM_VALUE.NUMBER_OF_TDL}
	set BIT_SMP_TDL ${PARAM_VALUE.BIT_SMP_TDL}
	set NUM_TAP_TDL ${PARAM_VALUE.NUM_TAP_TDL}
	set values(NUMBER_OF_TDL) [get_property value $NUMBER_OF_TDL]
	set values(BIT_SMP_TDL) [get_property value $BIT_SMP_TDL]
	set values(NUM_TAP_TDL) [get_property value $NUM_TAP_TDL]

	set MIN_OFFSET_TAP_TDL_3 0
	set MAX_OFFSET_TAP_TDL_3 [expr $values(NUM_TAP_TDL) / $values(BIT_SMP_TDL) + $values(NUM_TAP_TDL) % $values(BIT_SMP_TDL)  -1]
	set_property range  "$MIN_OFFSET_TAP_TDL_3,$MAX_OFFSET_TAP_TDL_3" $OFFSET_TAP_TDL_3
	# Procedure called to update MIN_VALID_TAP_POS when any of the dependent parameters in the arguments change

	if { [gen_USERPARAMETER_OFFSET_TAP_TDL_3_ENABLEMENT $values(NUMBER_OF_TDL) $values(BIT_SMP_TDL) $values(NUM_TAP_TDL)] } {
		set_property enabled true $OFFSET_TAP_TDL_3
	} else {
		set_property enabled false $OFFSET_TAP_TDL_3
	}
}

proc validate_PARAM_VALUE.OFFSET_TAP_TDL_3 { PARAM_VALUE.OFFSET_TAP_TDL_3 } {
	# Procedure called to validate OFFSET_TAP_TDL_3
	return true
}


proc update_MODELPARAM_VALUE.OFFSET_TAP_TDL_3 { MODELPARAM_VALUE.OFFSET_TAP_TDL_3 PARAM_VALUE.OFFSET_TAP_TDL_3 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.OFFSET_TAP_TDL_3}] ${MODELPARAM_VALUE.OFFSET_TAP_TDL_3}
}

proc update_PARAM_VALUE.OFFSET_TAP_TDL_4 { PARAM_VALUE.OFFSET_TAP_TDL_4 PARAM_VALUE.NUMBER_OF_TDL PARAM_VALUE.BIT_SMP_TDL PARAM_VALUE.NUM_TAP_TDL } {
	# Procedure called to update OFFSET_TAP_TDL_4 when any of the dependent parameters in the arguments change

	set OFFSET_TAP_TDL_4 ${PARAM_VALUE.OFFSET_TAP_TDL_4}
	set NUMBER_OF_TDL ${PARAM_VALUE.NUMBER_OF_TDL}
	set BIT_SMP_TDL ${PARAM_VALUE.BIT_SMP_TDL}
	set NUM_TAP_TDL ${PARAM_VALUE.NUM_TAP_TDL}
	set values(NUMBER_OF_TDL) [get_property value $NUMBER_OF_TDL]
	set values(BIT_SMP_TDL) [get_property value $BIT_SMP_TDL]
	set values(NUM_TAP_TDL) [get_property value $NUM_TAP_TDL]

	set MIN_OFFSET_TAP_TDL_4 0
	set MAX_OFFSET_TAP_TDL_4 [expr $values(NUM_TAP_TDL) / $values(BIT_SMP_TDL) + $values(NUM_TAP_TDL) % $values(BIT_SMP_TDL)  -1]
	set_property range  "$MIN_OFFSET_TAP_TDL_4,$MAX_OFFSET_TAP_TDL_4" $OFFSET_TAP_TDL_4
	# Procedure called to update MIN_VALID_TAP_POS when any of the dependent parameters in the arguments change

	if { [gen_USERPARAMETER_OFFSET_TAP_TDL_4_ENABLEMENT $values(NUMBER_OF_TDL) $values(BIT_SMP_TDL) $values(NUM_TAP_TDL)] } {
		set_property enabled true $OFFSET_TAP_TDL_4
	} else {
		set_property enabled false $OFFSET_TAP_TDL_4
	}
}

proc validate_PARAM_VALUE.OFFSET_TAP_TDL_4 { PARAM_VALUE.OFFSET_TAP_TDL_4 } {
	# Procedure called to validate OFFSET_TAP_TDL_4
	return true
}

proc update_MODELPARAM_VALUE.OFFSET_TAP_TDL_4 { MODELPARAM_VALUE.OFFSET_TAP_TDL_4 PARAM_VALUE.OFFSET_TAP_TDL_4 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.OFFSET_TAP_TDL_4}] ${MODELPARAM_VALUE.OFFSET_TAP_TDL_4}
}

proc update_PARAM_VALUE.OFFSET_TAP_TDL_5 { PARAM_VALUE.OFFSET_TAP_TDL_5 PARAM_VALUE.NUMBER_OF_TDL PARAM_VALUE.BIT_SMP_TDL PARAM_VALUE.NUM_TAP_TDL } {
	# Procedure called to update OFFSET_TAP_TDL_5 when any of the dependent parameters in the arguments change

	set OFFSET_TAP_TDL_5 ${PARAM_VALUE.OFFSET_TAP_TDL_5}
	set NUMBER_OF_TDL ${PARAM_VALUE.NUMBER_OF_TDL}
	set BIT_SMP_TDL ${PARAM_VALUE.BIT_SMP_TDL}
	set NUM_TAP_TDL ${PARAM_VALUE.NUM_TAP_TDL}
	set values(NUMBER_OF_TDL) [get_property value $NUMBER_OF_TDL]
	set values(BIT_SMP_TDL) [get_property value $BIT_SMP_TDL]
	set values(NUM_TAP_TDL) [get_property value $NUM_TAP_TDL]

	set MIN_OFFSET_TAP_TDL_5 0
	set MAX_OFFSET_TAP_TDL_5 [expr $values(NUM_TAP_TDL) / $values(BIT_SMP_TDL) + $values(NUM_TAP_TDL) % $values(BIT_SMP_TDL)  -1]
	set_property range  "$MIN_OFFSET_TAP_TDL_5,$MAX_OFFSET_TAP_TDL_5" $OFFSET_TAP_TDL_5
	# Procedure called to update MIN_VALID_TAP_POS when any of the dependent parameters in the arguments change

	if { [gen_USERPARAMETER_OFFSET_TAP_TDL_5_ENABLEMENT $values(NUMBER_OF_TDL) $values(BIT_SMP_TDL) $values(NUM_TAP_TDL)] } {
		set_property enabled true $OFFSET_TAP_TDL_5
	} else {
		set_property enabled false $OFFSET_TAP_TDL_5
	}
}

proc validate_PARAM_VALUE.OFFSET_TAP_TDL_5 { PARAM_VALUE.OFFSET_TAP_TDL_5 } {
	# Procedure called to validate OFFSET_TAP_TDL_5
	return true
}

proc update_MODELPARAM_VALUE.OFFSET_TAP_TDL_5 { MODELPARAM_VALUE.OFFSET_TAP_TDL_5 PARAM_VALUE.OFFSET_TAP_TDL_5 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.OFFSET_TAP_TDL_5}] ${MODELPARAM_VALUE.OFFSET_TAP_TDL_5}
}

proc update_PARAM_VALUE.OFFSET_TAP_TDL_6 { PARAM_VALUE.OFFSET_TAP_TDL_6 PARAM_VALUE.NUMBER_OF_TDL PARAM_VALUE.BIT_SMP_TDL PARAM_VALUE.NUM_TAP_TDL } {
	# Procedure called to update OFFSET_TAP_TDL_6 when any of the dependent parameters in the arguments change

	set OFFSET_TAP_TDL_6 ${PARAM_VALUE.OFFSET_TAP_TDL_6}
	set NUMBER_OF_TDL ${PARAM_VALUE.NUMBER_OF_TDL}
	set BIT_SMP_TDL ${PARAM_VALUE.BIT_SMP_TDL}
	set NUM_TAP_TDL ${PARAM_VALUE.NUM_TAP_TDL}
	set values(NUMBER_OF_TDL) [get_property value $NUMBER_OF_TDL]
	set values(BIT_SMP_TDL) [get_property value $BIT_SMP_TDL]
	set values(NUM_TAP_TDL) [get_property value $NUM_TAP_TDL]

	set MIN_OFFSET_TAP_TDL_6 0
	set MAX_OFFSET_TAP_TDL_6 [expr $values(NUM_TAP_TDL) / $values(BIT_SMP_TDL) + $values(NUM_TAP_TDL) % $values(BIT_SMP_TDL)  -1]
	set_property range  "$MIN_OFFSET_TAP_TDL_6,$MAX_OFFSET_TAP_TDL_6" $OFFSET_TAP_TDL_6
	# Procedure called to update MIN_VALID_TAP_POS when any of the dependent parameters in the arguments change

	if { [gen_USERPARAMETER_OFFSET_TAP_TDL_6_ENABLEMENT $values(NUMBER_OF_TDL) $values(BIT_SMP_TDL) $values(NUM_TAP_TDL)] } {
		set_property enabled true $OFFSET_TAP_TDL_6
	} else {
		set_property enabled false $OFFSET_TAP_TDL_6
	}
}

proc validate_PARAM_VALUE.OFFSET_TAP_TDL_6 { PARAM_VALUE.OFFSET_TAP_TDL_6 } {
	# Procedure called to validate OFFSET_TAP_TDL_6
	return true
}

proc update_MODELPARAM_VALUE.OFFSET_TAP_TDL_6 { MODELPARAM_VALUE.OFFSET_TAP_TDL_6 PARAM_VALUE.OFFSET_TAP_TDL_6 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.OFFSET_TAP_TDL_6}] ${MODELPARAM_VALUE.OFFSET_TAP_TDL_6}
}

proc update_PARAM_VALUE.OFFSET_TAP_TDL_7 { PARAM_VALUE.OFFSET_TAP_TDL_7 PARAM_VALUE.NUMBER_OF_TDL PARAM_VALUE.BIT_SMP_TDL PARAM_VALUE.NUM_TAP_TDL } {
	# Procedure called to update OFFSET_TAP_TDL_7 when any of the dependent parameters in the arguments change

	set OFFSET_TAP_TDL_7 ${PARAM_VALUE.OFFSET_TAP_TDL_7}
	set NUMBER_OF_TDL ${PARAM_VALUE.NUMBER_OF_TDL}
	set BIT_SMP_TDL ${PARAM_VALUE.BIT_SMP_TDL}
	set NUM_TAP_TDL ${PARAM_VALUE.NUM_TAP_TDL}
	set values(NUMBER_OF_TDL) [get_property value $NUMBER_OF_TDL]
	set values(BIT_SMP_TDL) [get_property value $BIT_SMP_TDL]
	set values(NUM_TAP_TDL) [get_property value $NUM_TAP_TDL]

	set MIN_OFFSET_TAP_TDL_7 0
	set MAX_OFFSET_TAP_TDL_7 [expr $values(NUM_TAP_TDL) / $values(BIT_SMP_TDL) + $values(NUM_TAP_TDL) % $values(BIT_SMP_TDL)  -1]
	set_property range  "$MIN_OFFSET_TAP_TDL_7,$MAX_OFFSET_TAP_TDL_7" $OFFSET_TAP_TDL_7
	# Procedure called to update MIN_VALID_TAP_POS when any of the dependent parameters in the arguments change

	if { [gen_USERPARAMETER_OFFSET_TAP_TDL_7_ENABLEMENT $values(NUMBER_OF_TDL) $values(BIT_SMP_TDL) $values(NUM_TAP_TDL)] } {
		set_property enabled true $OFFSET_TAP_TDL_7
	} else {
		set_property enabled false $OFFSET_TAP_TDL_7
	}
}

proc validate_PARAM_VALUE.OFFSET_TAP_TDL_7 { PARAM_VALUE.OFFSET_TAP_TDL_7 } {
	# Procedure called to validate OFFSET_TAP_TDL_7
	return true
}

proc update_MODELPARAM_VALUE.OFFSET_TAP_TDL_7 { MODELPARAM_VALUE.OFFSET_TAP_TDL_7 PARAM_VALUE.OFFSET_TAP_TDL_7 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.OFFSET_TAP_TDL_7}] ${MODELPARAM_VALUE.OFFSET_TAP_TDL_7}
}

proc update_PARAM_VALUE.OFFSET_TAP_TDL_8 { PARAM_VALUE.OFFSET_TAP_TDL_8 PARAM_VALUE.NUMBER_OF_TDL PARAM_VALUE.BIT_SMP_TDL PARAM_VALUE.NUM_TAP_TDL } {
	# Procedure called to update OFFSET_TAP_TDL_8 when any of the dependent parameters in the arguments change

	set OFFSET_TAP_TDL_8 ${PARAM_VALUE.OFFSET_TAP_TDL_8}
	set NUMBER_OF_TDL ${PARAM_VALUE.NUMBER_OF_TDL}
	set BIT_SMP_TDL ${PARAM_VALUE.BIT_SMP_TDL}
	set NUM_TAP_TDL ${PARAM_VALUE.NUM_TAP_TDL}
	set values(NUMBER_OF_TDL) [get_property value $NUMBER_OF_TDL]
	set values(BIT_SMP_TDL) [get_property value $BIT_SMP_TDL]
	set values(NUM_TAP_TDL) [get_property value $NUM_TAP_TDL]

	set MIN_OFFSET_TAP_TDL_8 0
	set MAX_OFFSET_TAP_TDL_8 [expr $values(NUM_TAP_TDL) / $values(BIT_SMP_TDL) + $values(NUM_TAP_TDL) % $values(BIT_SMP_TDL)  -1]
	set_property range  "$MIN_OFFSET_TAP_TDL_8,$MAX_OFFSET_TAP_TDL_8" $OFFSET_TAP_TDL_8
	# Procedure called to update MIN_VALID_TAP_POS when any of the dependent parameters in the arguments change

	if { [gen_USERPARAMETER_OFFSET_TAP_TDL_8_ENABLEMENT $values(NUMBER_OF_TDL) $values(BIT_SMP_TDL) $values(NUM_TAP_TDL)] } {
		set_property enabled true $OFFSET_TAP_TDL_8
	} else {
		set_property enabled false $OFFSET_TAP_TDL_8
	}
}

proc validate_PARAM_VALUE.OFFSET_TAP_TDL_8 { PARAM_VALUE.OFFSET_TAP_TDL_8 } {
	# Procedure called to validate OFFSET_TAP_TDL_8
	return true
}

proc update_MODELPARAM_VALUE.OFFSET_TAP_TDL_8 { MODELPARAM_VALUE.OFFSET_TAP_TDL_8 PARAM_VALUE.OFFSET_TAP_TDL_8 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.OFFSET_TAP_TDL_8}] ${MODELPARAM_VALUE.OFFSET_TAP_TDL_8}
}

proc update_PARAM_VALUE.OFFSET_TAP_TDL_9 { PARAM_VALUE.OFFSET_TAP_TDL_9 PARAM_VALUE.NUMBER_OF_TDL PARAM_VALUE.BIT_SMP_TDL PARAM_VALUE.NUM_TAP_TDL } {
	# Procedure called to update OFFSET_TAP_TDL_9 when any of the dependent parameters in the arguments change

	set OFFSET_TAP_TDL_9 ${PARAM_VALUE.OFFSET_TAP_TDL_9}
	set NUMBER_OF_TDL ${PARAM_VALUE.NUMBER_OF_TDL}
	set BIT_SMP_TDL ${PARAM_VALUE.BIT_SMP_TDL}
	set NUM_TAP_TDL ${PARAM_VALUE.NUM_TAP_TDL}
	set values(NUMBER_OF_TDL) [get_property value $NUMBER_OF_TDL]
	set values(BIT_SMP_TDL) [get_property value $BIT_SMP_TDL]
	set values(NUM_TAP_TDL) [get_property value $NUM_TAP_TDL]

	set MIN_OFFSET_TAP_TDL_9 0
	set MAX_OFFSET_TAP_TDL_9 [expr $values(NUM_TAP_TDL) / $values(BIT_SMP_TDL) + $values(NUM_TAP_TDL) % $values(BIT_SMP_TDL)  -1]
	set_property range  "$MIN_OFFSET_TAP_TDL_9,$MAX_OFFSET_TAP_TDL_9" $OFFSET_TAP_TDL_9
	# Procedure called to update MIN_VALID_TAP_POS when any of the dependent parameters in the arguments change

	if { [gen_USERPARAMETER_OFFSET_TAP_TDL_9_ENABLEMENT $values(NUMBER_OF_TDL) $values(BIT_SMP_TDL) $values(NUM_TAP_TDL)] } {
		set_property enabled true $OFFSET_TAP_TDL_9
	} else {
		set_property enabled false $OFFSET_TAP_TDL_9
	}
}

proc validate_PARAM_VALUE.OFFSET_TAP_TDL_9 { PARAM_VALUE.OFFSET_TAP_TDL_9 } {
	# Procedure called to validate OFFSET_TAP_TDL_9
	return true
}

proc update_MODELPARAM_VALUE.OFFSET_TAP_TDL_9 { MODELPARAM_VALUE.OFFSET_TAP_TDL_9 PARAM_VALUE.OFFSET_TAP_TDL_9 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.OFFSET_TAP_TDL_9}] ${MODELPARAM_VALUE.OFFSET_TAP_TDL_9}
}

proc update_PARAM_VALUE.OFFSET_TAP_TDL_10 { PARAM_VALUE.OFFSET_TAP_TDL_10 PARAM_VALUE.NUMBER_OF_TDL PARAM_VALUE.BIT_SMP_TDL PARAM_VALUE.NUM_TAP_TDL } {
	# Procedure called to update OFFSET_TAP_TDL_10 when any of the dependent parameters in the arguments change

	set OFFSET_TAP_TDL_10 ${PARAM_VALUE.OFFSET_TAP_TDL_10}
	set NUMBER_OF_TDL ${PARAM_VALUE.NUMBER_OF_TDL}
	set BIT_SMP_TDL ${PARAM_VALUE.BIT_SMP_TDL}
	set NUM_TAP_TDL ${PARAM_VALUE.NUM_TAP_TDL}
	set values(NUMBER_OF_TDL) [get_property value $NUMBER_OF_TDL]
	set values(BIT_SMP_TDL) [get_property value $BIT_SMP_TDL]
	set values(NUM_TAP_TDL) [get_property value $NUM_TAP_TDL]

	set MIN_OFFSET_TAP_TDL_10 0
	set MAX_OFFSET_TAP_TDL_10 [expr $values(NUM_TAP_TDL) / $values(BIT_SMP_TDL) + $values(NUM_TAP_TDL) % $values(BIT_SMP_TDL)  -1]
	set_property range  "$MIN_OFFSET_TAP_TDL_10,$MAX_OFFSET_TAP_TDL_10" $OFFSET_TAP_TDL_10
	# Procedure called to update MIN_VALID_TAP_POS when any of the dependent parameters in the arguments change

	if { [gen_USERPARAMETER_OFFSET_TAP_TDL_10_ENABLEMENT $values(NUMBER_OF_TDL) $values(BIT_SMP_TDL) $values(NUM_TAP_TDL)] } {
		set_property enabled true $OFFSET_TAP_TDL_10
	} else {
		set_property enabled false $OFFSET_TAP_TDL_10
	}
}

proc validate_PARAM_VALUE.OFFSET_TAP_TDL_10 { PARAM_VALUE.OFFSET_TAP_TDL_10 } {
	# Procedure called to validate OFFSET_TAP_TDL_10
	return true
}

proc update_MODELPARAM_VALUE.OFFSET_TAP_TDL_10 { MODELPARAM_VALUE.OFFSET_TAP_TDL_10 PARAM_VALUE.OFFSET_TAP_TDL_10 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.OFFSET_TAP_TDL_10}] ${MODELPARAM_VALUE.OFFSET_TAP_TDL_10}
}

proc update_PARAM_VALUE.OFFSET_TAP_TDL_11 { PARAM_VALUE.OFFSET_TAP_TDL_11 PARAM_VALUE.NUMBER_OF_TDL PARAM_VALUE.BIT_SMP_TDL PARAM_VALUE.NUM_TAP_TDL } {
	# Procedure called to update OFFSET_TAP_TDL_11 when any of the dependent parameters in the arguments change

	set OFFSET_TAP_TDL_11 ${PARAM_VALUE.OFFSET_TAP_TDL_11}
	set NUMBER_OF_TDL ${PARAM_VALUE.NUMBER_OF_TDL}
	set BIT_SMP_TDL ${PARAM_VALUE.BIT_SMP_TDL}
	set NUM_TAP_TDL ${PARAM_VALUE.NUM_TAP_TDL}
	set values(NUMBER_OF_TDL) [get_property value $NUMBER_OF_TDL]
	set values(BIT_SMP_TDL) [get_property value $BIT_SMP_TDL]
	set values(NUM_TAP_TDL) [get_property value $NUM_TAP_TDL]

	set MIN_OFFSET_TAP_TDL_11 0
	set MAX_OFFSET_TAP_TDL_11 [expr $values(NUM_TAP_TDL) / $values(BIT_SMP_TDL) + $values(NUM_TAP_TDL) % $values(BIT_SMP_TDL)  -1]
	set_property range  "$MIN_OFFSET_TAP_TDL_11,$MAX_OFFSET_TAP_TDL_11" $OFFSET_TAP_TDL_11
	# Procedure called to update MIN_VALID_TAP_POS when any of the dependent parameters in the arguments change

	if { [gen_USERPARAMETER_OFFSET_TAP_TDL_11_ENABLEMENT $values(NUMBER_OF_TDL) $values(BIT_SMP_TDL) $values(NUM_TAP_TDL)] } {
		set_property enabled true $OFFSET_TAP_TDL_11
	} else {
		set_property enabled false $OFFSET_TAP_TDL_11
	}
}

proc validate_PARAM_VALUE.OFFSET_TAP_TDL_11 { PARAM_VALUE.OFFSET_TAP_TDL_11 } {
	# Procedure called to validate OFFSET_TAP_TDL_11
	return true
}

proc update_MODELPARAM_VALUE.OFFSET_TAP_TDL_11 { MODELPARAM_VALUE.OFFSET_TAP_TDL_11 PARAM_VALUE.OFFSET_TAP_TDL_11 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.OFFSET_TAP_TDL_11}] ${MODELPARAM_VALUE.OFFSET_TAP_TDL_11}
}

proc update_PARAM_VALUE.OFFSET_TAP_TDL_12 { PARAM_VALUE.OFFSET_TAP_TDL_12 PARAM_VALUE.NUMBER_OF_TDL PARAM_VALUE.BIT_SMP_TDL PARAM_VALUE.NUM_TAP_TDL } {
	# Procedure called to update OFFSET_TAP_TDL_12 when any of the dependent parameters in the arguments change

	set OFFSET_TAP_TDL_12 ${PARAM_VALUE.OFFSET_TAP_TDL_12}
	set NUMBER_OF_TDL ${PARAM_VALUE.NUMBER_OF_TDL}
	set BIT_SMP_TDL ${PARAM_VALUE.BIT_SMP_TDL}
	set NUM_TAP_TDL ${PARAM_VALUE.NUM_TAP_TDL}
	set values(NUMBER_OF_TDL) [get_property value $NUMBER_OF_TDL]
	set values(BIT_SMP_TDL) [get_property value $BIT_SMP_TDL]
	set values(NUM_TAP_TDL) [get_property value $NUM_TAP_TDL]

	set MIN_OFFSET_TAP_TDL_12 0
	set MAX_OFFSET_TAP_TDL_12 [expr $values(NUM_TAP_TDL) / $values(BIT_SMP_TDL) + $values(NUM_TAP_TDL) % $values(BIT_SMP_TDL)  -1]
	set_property range  "$MIN_OFFSET_TAP_TDL_12,$MAX_OFFSET_TAP_TDL_12" $OFFSET_TAP_TDL_12
	# Procedure called to update MIN_VALID_TAP_POS when any of the dependent parameters in the arguments change

	if { [gen_USERPARAMETER_OFFSET_TAP_TDL_12_ENABLEMENT $values(NUMBER_OF_TDL) $values(BIT_SMP_TDL) $values(NUM_TAP_TDL)] } {
		set_property enabled true $OFFSET_TAP_TDL_12
	} else {
		set_property enabled false $OFFSET_TAP_TDL_12
	}
}

proc validate_PARAM_VALUE.OFFSET_TAP_TDL_12 { PARAM_VALUE.OFFSET_TAP_TDL_12 } {
	# Procedure called to validate OFFSET_TAP_TDL_12
	return true
}

proc update_MODELPARAM_VALUE.OFFSET_TAP_TDL_12 { MODELPARAM_VALUE.OFFSET_TAP_TDL_12 PARAM_VALUE.OFFSET_TAP_TDL_12 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.OFFSET_TAP_TDL_12}] ${MODELPARAM_VALUE.OFFSET_TAP_TDL_12}
}

proc update_PARAM_VALUE.OFFSET_TAP_TDL_13 { PARAM_VALUE.OFFSET_TAP_TDL_13 PARAM_VALUE.NUMBER_OF_TDL PARAM_VALUE.BIT_SMP_TDL PARAM_VALUE.NUM_TAP_TDL } {
	# Procedure called to update OFFSET_TAP_TDL_13 when any of the dependent parameters in the arguments change

	set OFFSET_TAP_TDL_13 ${PARAM_VALUE.OFFSET_TAP_TDL_13}
	set NUMBER_OF_TDL ${PARAM_VALUE.NUMBER_OF_TDL}
	set BIT_SMP_TDL ${PARAM_VALUE.BIT_SMP_TDL}
	set NUM_TAP_TDL ${PARAM_VALUE.NUM_TAP_TDL}
	set values(NUMBER_OF_TDL) [get_property value $NUMBER_OF_TDL]
	set values(BIT_SMP_TDL) [get_property value $BIT_SMP_TDL]
	set values(NUM_TAP_TDL) [get_property value $NUM_TAP_TDL]

	set MIN_OFFSET_TAP_TDL_13 0
	set MAX_OFFSET_TAP_TDL_13 [expr $values(NUM_TAP_TDL) / $values(BIT_SMP_TDL) + $values(NUM_TAP_TDL) % $values(BIT_SMP_TDL)  -1]
	set_property range  "$MIN_OFFSET_TAP_TDL_13,$MAX_OFFSET_TAP_TDL_13" $OFFSET_TAP_TDL_13
	# Procedure called to update MIN_VALID_TAP_POS when any of the dependent parameters in the arguments change

	if { [gen_USERPARAMETER_OFFSET_TAP_TDL_13_ENABLEMENT $values(NUMBER_OF_TDL) $values(BIT_SMP_TDL) $values(NUM_TAP_TDL)] } {
		set_property enabled true $OFFSET_TAP_TDL_13
	} else {
		set_property enabled false $OFFSET_TAP_TDL_13
	}
}

proc validate_PARAM_VALUE.OFFSET_TAP_TDL_13 { PARAM_VALUE.OFFSET_TAP_TDL_13 } {
	# Procedure called to validate OFFSET_TAP_TDL_13
	return true
}

proc update_MODELPARAM_VALUE.OFFSET_TAP_TDL_13 { MODELPARAM_VALUE.OFFSET_TAP_TDL_13 PARAM_VALUE.OFFSET_TAP_TDL_13 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.OFFSET_TAP_TDL_13}] ${MODELPARAM_VALUE.OFFSET_TAP_TDL_13}
}

proc update_PARAM_VALUE.OFFSET_TAP_TDL_14 { PARAM_VALUE.OFFSET_TAP_TDL_14 PARAM_VALUE.NUMBER_OF_TDL PARAM_VALUE.BIT_SMP_TDL PARAM_VALUE.NUM_TAP_TDL } {
	# Procedure called to update OFFSET_TAP_TDL_14 when any of the dependent parameters in the arguments change

	set OFFSET_TAP_TDL_14 ${PARAM_VALUE.OFFSET_TAP_TDL_14}
	set NUMBER_OF_TDL ${PARAM_VALUE.NUMBER_OF_TDL}
	set BIT_SMP_TDL ${PARAM_VALUE.BIT_SMP_TDL}
	set NUM_TAP_TDL ${PARAM_VALUE.NUM_TAP_TDL}
	set values(NUMBER_OF_TDL) [get_property value $NUMBER_OF_TDL]
	set values(BIT_SMP_TDL) [get_property value $BIT_SMP_TDL]
	set values(NUM_TAP_TDL) [get_property value $NUM_TAP_TDL]

	set MIN_OFFSET_TAP_TDL_14 0
	set MAX_OFFSET_TAP_TDL_14 [expr $values(NUM_TAP_TDL) / $values(BIT_SMP_TDL) + $values(NUM_TAP_TDL) % $values(BIT_SMP_TDL)  -1]
	set_property range  "$MIN_OFFSET_TAP_TDL_14,$MAX_OFFSET_TAP_TDL_14" $OFFSET_TAP_TDL_14
	# Procedure called to update MIN_VALID_TAP_POS when any of the dependent parameters in the arguments change

	if { [gen_USERPARAMETER_OFFSET_TAP_TDL_14_ENABLEMENT $values(NUMBER_OF_TDL) $values(BIT_SMP_TDL) $values(NUM_TAP_TDL)] } {
		set_property enabled true $OFFSET_TAP_TDL_14
	} else {
		set_property enabled false $OFFSET_TAP_TDL_14
	}
}

proc validate_PARAM_VALUE.OFFSET_TAP_TDL_14 { PARAM_VALUE.OFFSET_TAP_TDL_14 } {
	# Procedure called to validate OFFSET_TAP_TDL_14
	return true
}

proc update_MODELPARAM_VALUE.OFFSET_TAP_TDL_14 { MODELPARAM_VALUE.OFFSET_TAP_TDL_14 PARAM_VALUE.OFFSET_TAP_TDL_14 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.OFFSET_TAP_TDL_14}] ${MODELPARAM_VALUE.OFFSET_TAP_TDL_14}
}

proc update_PARAM_VALUE.OFFSET_TAP_TDL_15 { PARAM_VALUE.OFFSET_TAP_TDL_15 PARAM_VALUE.NUMBER_OF_TDL PARAM_VALUE.BIT_SMP_TDL PARAM_VALUE.NUM_TAP_TDL } {
	# Procedure called to update OFFSET_TAP_TDL_15 when any of the dependent parameters in the arguments change

	set OFFSET_TAP_TDL_15 ${PARAM_VALUE.OFFSET_TAP_TDL_15}
	set NUMBER_OF_TDL ${PARAM_VALUE.NUMBER_OF_TDL}
	set BIT_SMP_TDL ${PARAM_VALUE.BIT_SMP_TDL}
	set NUM_TAP_TDL ${PARAM_VALUE.NUM_TAP_TDL}
	set values(NUMBER_OF_TDL) [get_property value $NUMBER_OF_TDL]
	set values(BIT_SMP_TDL) [get_property value $BIT_SMP_TDL]
	set values(NUM_TAP_TDL) [get_property value $NUM_TAP_TDL]

	set MIN_OFFSET_TAP_TDL_15 0
	set MAX_OFFSET_TAP_TDL_15 [expr $values(NUM_TAP_TDL) / $values(BIT_SMP_TDL) + $values(NUM_TAP_TDL) % $values(BIT_SMP_TDL)  -1]
	set_property range  "$MIN_OFFSET_TAP_TDL_15,$MAX_OFFSET_TAP_TDL_15" $OFFSET_TAP_TDL_15
	# Procedure called to update MIN_VALID_TAP_POS when any of the dependent parameters in the arguments change

	if { [gen_USERPARAMETER_OFFSET_TAP_TDL_15_ENABLEMENT $values(NUMBER_OF_TDL) $values(BIT_SMP_TDL) $values(NUM_TAP_TDL)] } {
		set_property enabled true $OFFSET_TAP_TDL_15
	} else {
		set_property enabled false $OFFSET_TAP_TDL_15
	}
}

proc validate_PARAM_VALUE.OFFSET_TAP_TDL_15 { PARAM_VALUE.OFFSET_TAP_TDL_15 } {
	# Procedure called to validate OFFSET_TAP_TDL_15
	return true
}

proc update_MODELPARAM_VALUE.OFFSET_TAP_TDL_15 { MODELPARAM_VALUE.OFFSET_TAP_TDL_15 PARAM_VALUE.OFFSET_TAP_TDL_15 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.OFFSET_TAP_TDL_15}] ${MODELPARAM_VALUE.OFFSET_TAP_TDL_15}
}
# ------------------------------------------------------------------------------


# ---------------------------- STEP_VALID_TAP_POS ------------------------------
proc update_PARAM_VALUE.STEP_VALID_TAP_POS { PARAM_VALUE.STEP_VALID_TAP_POS PARAM_VALUE.DEBUG_MODE PARAM_VALUE.MAX_VALID_TAP_POS PARAM_VALUE.MIN_VALID_TAP_POS } {
	# Procedure called to update STEP_VALID_TAP_POS when any of the dependent parameters in the arguments change

	set STEP_VALID_TAP_POS ${PARAM_VALUE.STEP_VALID_TAP_POS}
	set DEBUG_MODE ${PARAM_VALUE.DEBUG_MODE}
    set MAX_VALID_TAP_POS ${PARAM_VALUE.MAX_VALID_TAP_POS}
    set MIN_VALID_TAP_POS ${PARAM_VALUE.MIN_VALID_TAP_POS}

    set values(DEBUG_MODE) [get_property value $DEBUG_MODE]
    set values(STEP_VALID_TAP_POS) [get_property value $STEP_VALID_TAP_POS]
    set values(MAX_VALID_TAP_POS) [get_property value $MAX_VALID_TAP_POS]
    set values(MIN_VALID_TAP_POS) [get_property value $MIN_VALID_TAP_POS]

	if { [gen_USERPARAMETER_STEP_VALID_TAP_POS_ENABLEMENT $values(DEBUG_MODE)] } {
		set_property enabled true $STEP_VALID_TAP_POS
	} else {
		set_property enabled false $STEP_VALID_TAP_POS
	}
    # Refresh the new range
	if {$values(MAX_VALID_TAP_POS) > 0} {
		set MIN_STEP_VALID_TAP_POS 1
	} else {
		set MIN_STEP_VALID_TAP_POS 0
	}

    set MAX_STEP_VALID_TAP_POS [expr $values(MAX_VALID_TAP_POS) - $values(MIN_VALID_TAP_POS)]
    set_property range  "$MIN_STEP_VALID_TAP_POS,$MAX_STEP_VALID_TAP_POS" $STEP_VALID_TAP_POS
    # Procedure called to update MIN_VALID_TAP_POS when any of the dependent parameters in the arguments change

}

proc validate_PARAM_VALUE.STEP_VALID_TAP_POS { PARAM_VALUE.STEP_VALID_TAP_POS } {
	# Procedure called to validate STEP_VALID_TAP_POS
	return true
}

proc update_MODELPARAM_VALUE.STEP_VALID_TAP_POS { MODELPARAM_VALUE.STEP_VALID_TAP_POS PARAM_VALUE.STEP_VALID_TAP_POS } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.STEP_VALID_TAP_POS}] ${MODELPARAM_VALUE.STEP_VALID_TAP_POS}
}
# ------------------------------------------------------------------------------


# ------------------------------- TYPE TDL i -----------------------------------
proc update_PARAM_VALUE.TYPE_TDL_0 { PARAM_VALUE.TYPE_TDL_0 PARAM_VALUE.NUMBER_OF_TDL } {
	# Procedure called to update TYPE_TDL_0 when any of the dependent parameters in the arguments change

	set TYPE_TDL_0 ${PARAM_VALUE.TYPE_TDL_0}
	set NUMBER_OF_TDL ${PARAM_VALUE.NUMBER_OF_TDL}
	set values(NUMBER_OF_TDL) [get_property value $NUMBER_OF_TDL]
	if { [gen_USERPARAMETER_TYPE_TDL_0_ENABLEMENT $values(NUMBER_OF_TDL)] } {
		set_property enabled true $TYPE_TDL_0
	} else {
		set_property enabled false $TYPE_TDL_0
	}
}

proc validate_PARAM_VALUE.TYPE_TDL_0 { PARAM_VALUE.TYPE_TDL_0 } {
	# Procedure called to validate TYPE_TDL_0
	return true
}

proc update_MODELPARAM_VALUE.TYPE_TDL_0 { MODELPARAM_VALUE.TYPE_TDL_0 PARAM_VALUE.TYPE_TDL_0 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.TYPE_TDL_0}] ${MODELPARAM_VALUE.TYPE_TDL_0}
}

proc update_PARAM_VALUE.TYPE_TDL_1 { PARAM_VALUE.TYPE_TDL_1 PARAM_VALUE.NUMBER_OF_TDL } {
	# Procedure called to update TYPE_TDL_1 when any of the dependent parameters in the arguments change

	set TYPE_TDL_1 ${PARAM_VALUE.TYPE_TDL_1}
	set NUMBER_OF_TDL ${PARAM_VALUE.NUMBER_OF_TDL}
	set values(NUMBER_OF_TDL) [get_property value $NUMBER_OF_TDL]
	if { [gen_USERPARAMETER_TYPE_TDL_1_ENABLEMENT $values(NUMBER_OF_TDL)] } {
		set_property enabled true $TYPE_TDL_1
	} else {
		set_property enabled false $TYPE_TDL_1
	}
}

proc validate_PARAM_VALUE.TYPE_TDL_1 { PARAM_VALUE.TYPE_TDL_1 } {
	# Procedure called to validate TYPE_TDL_1
	return true
}

proc update_MODELPARAM_VALUE.TYPE_TDL_1 { MODELPARAM_VALUE.TYPE_TDL_1 PARAM_VALUE.TYPE_TDL_1 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.TYPE_TDL_1}] ${MODELPARAM_VALUE.TYPE_TDL_1}
}

proc update_PARAM_VALUE.TYPE_TDL_2 { PARAM_VALUE.TYPE_TDL_2 PARAM_VALUE.NUMBER_OF_TDL } {
	# Procedure called to update TYPE_TDL_2 when any of the dependent parameters in the arguments change

	set TYPE_TDL_2 ${PARAM_VALUE.TYPE_TDL_2}
	set NUMBER_OF_TDL ${PARAM_VALUE.NUMBER_OF_TDL}
	set values(NUMBER_OF_TDL) [get_property value $NUMBER_OF_TDL]
	if { [gen_USERPARAMETER_TYPE_TDL_2_ENABLEMENT $values(NUMBER_OF_TDL)] } {
		set_property enabled true $TYPE_TDL_2
	} else {
		set_property enabled false $TYPE_TDL_2
	}
}

proc validate_PARAM_VALUE.TYPE_TDL_2 { PARAM_VALUE.TYPE_TDL_2 } {
	# Procedure called to validate TYPE_TDL_2
	return true
}

proc update_MODELPARAM_VALUE.TYPE_TDL_2 { MODELPARAM_VALUE.TYPE_TDL_2 PARAM_VALUE.TYPE_TDL_2 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.TYPE_TDL_2}] ${MODELPARAM_VALUE.TYPE_TDL_2}
}

proc update_PARAM_VALUE.TYPE_TDL_3 { PARAM_VALUE.TYPE_TDL_3 PARAM_VALUE.NUMBER_OF_TDL } {
	# Procedure called to update TYPE_TDL_3 when any of the dependent parameters in the arguments change

	set TYPE_TDL_3 ${PARAM_VALUE.TYPE_TDL_3}
	set NUMBER_OF_TDL ${PARAM_VALUE.NUMBER_OF_TDL}
	set values(NUMBER_OF_TDL) [get_property value $NUMBER_OF_TDL]
	if { [gen_USERPARAMETER_TYPE_TDL_3_ENABLEMENT $values(NUMBER_OF_TDL)] } {
		set_property enabled true $TYPE_TDL_3
	} else {
		set_property enabled false $TYPE_TDL_3
	}
}

proc validate_PARAM_VALUE.TYPE_TDL_3 { PARAM_VALUE.TYPE_TDL_3 } {
	# Procedure called to validate TYPE_TDL_3
	return true
}

proc update_MODELPARAM_VALUE.TYPE_TDL_3 { MODELPARAM_VALUE.TYPE_TDL_3 PARAM_VALUE.TYPE_TDL_3 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.TYPE_TDL_3}] ${MODELPARAM_VALUE.TYPE_TDL_3}
}

proc update_PARAM_VALUE.TYPE_TDL_4 { PARAM_VALUE.TYPE_TDL_4 PARAM_VALUE.NUMBER_OF_TDL } {
	# Procedure called to update TYPE_TDL_4 when any of the dependent parameters in the arguments change

	set TYPE_TDL_4 ${PARAM_VALUE.TYPE_TDL_4}
	set NUMBER_OF_TDL ${PARAM_VALUE.NUMBER_OF_TDL}
	set values(NUMBER_OF_TDL) [get_property value $NUMBER_OF_TDL]
	if { [gen_USERPARAMETER_TYPE_TDL_4_ENABLEMENT $values(NUMBER_OF_TDL)] } {
		set_property enabled true $TYPE_TDL_4
	} else {
		set_property enabled false $TYPE_TDL_4
	}
}

proc validate_PARAM_VALUE.TYPE_TDL_4 { PARAM_VALUE.TYPE_TDL_4 } {
	# Procedure called to validate TYPE_TDL_4
	return true
}

proc update_MODELPARAM_VALUE.TYPE_TDL_4 { MODELPARAM_VALUE.TYPE_TDL_4 PARAM_VALUE.TYPE_TDL_4 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.TYPE_TDL_4}] ${MODELPARAM_VALUE.TYPE_TDL_4}
}

proc update_PARAM_VALUE.TYPE_TDL_5 { PARAM_VALUE.TYPE_TDL_5 PARAM_VALUE.NUMBER_OF_TDL } {
	# Procedure called to update TYPE_TDL_5 when any of the dependent parameters in the arguments change

	set TYPE_TDL_5 ${PARAM_VALUE.TYPE_TDL_5}
	set NUMBER_OF_TDL ${PARAM_VALUE.NUMBER_OF_TDL}
	set values(NUMBER_OF_TDL) [get_property value $NUMBER_OF_TDL]
	if { [gen_USERPARAMETER_TYPE_TDL_5_ENABLEMENT $values(NUMBER_OF_TDL)] } {
		set_property enabled true $TYPE_TDL_5
	} else {
		set_property enabled false $TYPE_TDL_5
	}
}

proc validate_PARAM_VALUE.TYPE_TDL_5 { PARAM_VALUE.TYPE_TDL_5 } {
	# Procedure called to validate TYPE_TDL_5
	return true
}

proc update_MODELPARAM_VALUE.TYPE_TDL_5 { MODELPARAM_VALUE.TYPE_TDL_5 PARAM_VALUE.TYPE_TDL_5 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.TYPE_TDL_5}] ${MODELPARAM_VALUE.TYPE_TDL_5}
}

proc update_PARAM_VALUE.TYPE_TDL_6 { PARAM_VALUE.TYPE_TDL_6 PARAM_VALUE.NUMBER_OF_TDL } {
	# Procedure called to update TYPE_TDL_6 when any of the dependent parameters in the arguments change

	set TYPE_TDL_6 ${PARAM_VALUE.TYPE_TDL_6}
	set NUMBER_OF_TDL ${PARAM_VALUE.NUMBER_OF_TDL}
	set values(NUMBER_OF_TDL) [get_property value $NUMBER_OF_TDL]
	if { [gen_USERPARAMETER_TYPE_TDL_6_ENABLEMENT $values(NUMBER_OF_TDL)] } {
		set_property enabled true $TYPE_TDL_6
	} else {
		set_property enabled false $TYPE_TDL_6
	}
}

proc validate_PARAM_VALUE.TYPE_TDL_6 { PARAM_VALUE.TYPE_TDL_6 } {
	# Procedure called to validate TYPE_TDL_6
	return true
}

proc update_MODELPARAM_VALUE.TYPE_TDL_6 { MODELPARAM_VALUE.TYPE_TDL_6 PARAM_VALUE.TYPE_TDL_6 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.TYPE_TDL_6}] ${MODELPARAM_VALUE.TYPE_TDL_6}
}

proc update_PARAM_VALUE.TYPE_TDL_7 { PARAM_VALUE.TYPE_TDL_7 PARAM_VALUE.NUMBER_OF_TDL } {
	# Procedure called to update TYPE_TDL_7 when any of the dependent parameters in the arguments change

	set TYPE_TDL_7 ${PARAM_VALUE.TYPE_TDL_7}
	set NUMBER_OF_TDL ${PARAM_VALUE.NUMBER_OF_TDL}
	set values(NUMBER_OF_TDL) [get_property value $NUMBER_OF_TDL]
	if { [gen_USERPARAMETER_TYPE_TDL_7_ENABLEMENT $values(NUMBER_OF_TDL)] } {
		set_property enabled true $TYPE_TDL_7
	} else {
		set_property enabled false $TYPE_TDL_7
	}
}

proc validate_PARAM_VALUE.TYPE_TDL_7 { PARAM_VALUE.TYPE_TDL_7 } {
	# Procedure called to validate TYPE_TDL_7
	return true
}

proc update_MODELPARAM_VALUE.TYPE_TDL_7 { MODELPARAM_VALUE.TYPE_TDL_7 PARAM_VALUE.TYPE_TDL_7 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.TYPE_TDL_7}] ${MODELPARAM_VALUE.TYPE_TDL_7}
}

proc update_PARAM_VALUE.TYPE_TDL_8 { PARAM_VALUE.TYPE_TDL_8 PARAM_VALUE.NUMBER_OF_TDL } {
	# Procedure called to update TYPE_TDL_8 when any of the dependent parameters in the arguments change

	set TYPE_TDL_8 ${PARAM_VALUE.TYPE_TDL_8}
	set NUMBER_OF_TDL ${PARAM_VALUE.NUMBER_OF_TDL}
	set values(NUMBER_OF_TDL) [get_property value $NUMBER_OF_TDL]
	if { [gen_USERPARAMETER_TYPE_TDL_8_ENABLEMENT $values(NUMBER_OF_TDL)] } {
		set_property enabled true $TYPE_TDL_8
	} else {
		set_property enabled false $TYPE_TDL_8
	}
}

proc validate_PARAM_VALUE.TYPE_TDL_8 { PARAM_VALUE.TYPE_TDL_8 } {
	# Procedure called to validate TYPE_TDL_8
	return true
}

proc update_MODELPARAM_VALUE.TYPE_TDL_8 { MODELPARAM_VALUE.TYPE_TDL_8 PARAM_VALUE.TYPE_TDL_8 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.TYPE_TDL_8}] ${MODELPARAM_VALUE.TYPE_TDL_8}
}

proc update_PARAM_VALUE.TYPE_TDL_9 { PARAM_VALUE.TYPE_TDL_9 PARAM_VALUE.NUMBER_OF_TDL } {
	# Procedure called to update TYPE_TDL_9 when any of the dependent parameters in the arguments change

	set TYPE_TDL_9 ${PARAM_VALUE.TYPE_TDL_9}
	set NUMBER_OF_TDL ${PARAM_VALUE.NUMBER_OF_TDL}
	set values(NUMBER_OF_TDL) [get_property value $NUMBER_OF_TDL]
	if { [gen_USERPARAMETER_TYPE_TDL_9_ENABLEMENT $values(NUMBER_OF_TDL)] } {
		set_property enabled true $TYPE_TDL_9
	} else {
		set_property enabled false $TYPE_TDL_9
	}
}

proc validate_PARAM_VALUE.TYPE_TDL_9 { PARAM_VALUE.TYPE_TDL_9 } {
	# Procedure called to validate TYPE_TDL_9
	return true
}

proc update_MODELPARAM_VALUE.TYPE_TDL_9 { MODELPARAM_VALUE.TYPE_TDL_9 PARAM_VALUE.TYPE_TDL_9 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.TYPE_TDL_9}] ${MODELPARAM_VALUE.TYPE_TDL_9}
}

proc update_PARAM_VALUE.TYPE_TDL_10 { PARAM_VALUE.TYPE_TDL_10 PARAM_VALUE.NUMBER_OF_TDL } {
	# Procedure called to update TYPE_TDL_10 when any of the dependent parameters in the arguments change

	set TYPE_TDL_10 ${PARAM_VALUE.TYPE_TDL_10}
	set NUMBER_OF_TDL ${PARAM_VALUE.NUMBER_OF_TDL}
	set values(NUMBER_OF_TDL) [get_property value $NUMBER_OF_TDL]
	if { [gen_USERPARAMETER_TYPE_TDL_10_ENABLEMENT $values(NUMBER_OF_TDL)] } {
		set_property enabled true $TYPE_TDL_10
	} else {
		set_property enabled false $TYPE_TDL_10
	}
}

proc validate_PARAM_VALUE.TYPE_TDL_10 { PARAM_VALUE.TYPE_TDL_10 } {
	# Procedure called to validate TYPE_TDL_10
	return true
}

proc update_MODELPARAM_VALUE.TYPE_TDL_10 { MODELPARAM_VALUE.TYPE_TDL_10 PARAM_VALUE.TYPE_TDL_10 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.TYPE_TDL_10}] ${MODELPARAM_VALUE.TYPE_TDL_10}
}

proc update_PARAM_VALUE.TYPE_TDL_11 { PARAM_VALUE.TYPE_TDL_11 PARAM_VALUE.NUMBER_OF_TDL } {
	# Procedure called to update TYPE_TDL_11 when any of the dependent parameters in the arguments change

	set TYPE_TDL_11 ${PARAM_VALUE.TYPE_TDL_11}
	set NUMBER_OF_TDL ${PARAM_VALUE.NUMBER_OF_TDL}
	set values(NUMBER_OF_TDL) [get_property value $NUMBER_OF_TDL]
	if { [gen_USERPARAMETER_TYPE_TDL_11_ENABLEMENT $values(NUMBER_OF_TDL)] } {
		set_property enabled true $TYPE_TDL_11
	} else {
		set_property enabled false $TYPE_TDL_11
	}
}

proc validate_PARAM_VALUE.TYPE_TDL_11 { PARAM_VALUE.TYPE_TDL_11 } {
	# Procedure called to validate TYPE_TDL_11
	return true
}

proc update_MODELPARAM_VALUE.TYPE_TDL_11 { MODELPARAM_VALUE.TYPE_TDL_11 PARAM_VALUE.TYPE_TDL_11 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.TYPE_TDL_11}] ${MODELPARAM_VALUE.TYPE_TDL_11}
}

proc update_PARAM_VALUE.TYPE_TDL_12 { PARAM_VALUE.TYPE_TDL_12 PARAM_VALUE.NUMBER_OF_TDL } {
	# Procedure called to update TYPE_TDL_12 when any of the dependent parameters in the arguments change

	set TYPE_TDL_12 ${PARAM_VALUE.TYPE_TDL_12}
	set NUMBER_OF_TDL ${PARAM_VALUE.NUMBER_OF_TDL}
	set values(NUMBER_OF_TDL) [get_property value $NUMBER_OF_TDL]
	if { [gen_USERPARAMETER_TYPE_TDL_12_ENABLEMENT $values(NUMBER_OF_TDL)] } {
		set_property enabled true $TYPE_TDL_12
	} else {
		set_property enabled false $TYPE_TDL_12
	}
}

proc validate_PARAM_VALUE.TYPE_TDL_12 { PARAM_VALUE.TYPE_TDL_12 } {
	# Procedure called to validate TYPE_TDL_12
	return true
}

proc update_MODELPARAM_VALUE.TYPE_TDL_12 { MODELPARAM_VALUE.TYPE_TDL_12 PARAM_VALUE.TYPE_TDL_12 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.TYPE_TDL_12}] ${MODELPARAM_VALUE.TYPE_TDL_12}
}

proc update_PARAM_VALUE.TYPE_TDL_13 { PARAM_VALUE.TYPE_TDL_13 PARAM_VALUE.NUMBER_OF_TDL } {
	# Procedure called to update TYPE_TDL_13 when any of the dependent parameters in the arguments change

	set TYPE_TDL_13 ${PARAM_VALUE.TYPE_TDL_13}
	set NUMBER_OF_TDL ${PARAM_VALUE.NUMBER_OF_TDL}
	set values(NUMBER_OF_TDL) [get_property value $NUMBER_OF_TDL]
	if { [gen_USERPARAMETER_TYPE_TDL_13_ENABLEMENT $values(NUMBER_OF_TDL)] } {
		set_property enabled true $TYPE_TDL_13
	} else {
		set_property enabled false $TYPE_TDL_13
	}
}

proc validate_PARAM_VALUE.TYPE_TDL_13 { PARAM_VALUE.TYPE_TDL_13 } {
	# Procedure called to validate TYPE_TDL_13
	return true
}

proc update_MODELPARAM_VALUE.TYPE_TDL_13 { MODELPARAM_VALUE.TYPE_TDL_13 PARAM_VALUE.TYPE_TDL_13 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.TYPE_TDL_13}] ${MODELPARAM_VALUE.TYPE_TDL_13}
}

proc update_PARAM_VALUE.TYPE_TDL_14 { PARAM_VALUE.TYPE_TDL_14 PARAM_VALUE.NUMBER_OF_TDL } {
	# Procedure called to update TYPE_TDL_14 when any of the dependent parameters in the arguments change

	set TYPE_TDL_14 ${PARAM_VALUE.TYPE_TDL_14}
	set NUMBER_OF_TDL ${PARAM_VALUE.NUMBER_OF_TDL}
	set values(NUMBER_OF_TDL) [get_property value $NUMBER_OF_TDL]
	if { [gen_USERPARAMETER_TYPE_TDL_14_ENABLEMENT $values(NUMBER_OF_TDL)] } {
		set_property enabled true $TYPE_TDL_14
	} else {
		set_property enabled false $TYPE_TDL_14
	}
}

proc validate_PARAM_VALUE.TYPE_TDL_14 { PARAM_VALUE.TYPE_TDL_14 } {
	# Procedure called to validate TYPE_TDL_14
	return true
}

proc update_MODELPARAM_VALUE.TYPE_TDL_14 { MODELPARAM_VALUE.TYPE_TDL_14 PARAM_VALUE.TYPE_TDL_14 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.TYPE_TDL_14}] ${MODELPARAM_VALUE.TYPE_TDL_14}
}

proc update_PARAM_VALUE.TYPE_TDL_15 { PARAM_VALUE.TYPE_TDL_15 PARAM_VALUE.NUMBER_OF_TDL } {
	# Procedure called to update TYPE_TDL_15 when any of the dependent parameters in the arguments change

	set TYPE_TDL_15 ${PARAM_VALUE.TYPE_TDL_15}
	set NUMBER_OF_TDL ${PARAM_VALUE.NUMBER_OF_TDL}
	set values(NUMBER_OF_TDL) [get_property value $NUMBER_OF_TDL]
	if { [gen_USERPARAMETER_TYPE_TDL_15_ENABLEMENT $values(NUMBER_OF_TDL)] } {
		set_property enabled true $TYPE_TDL_15
	} else {
		set_property enabled false $TYPE_TDL_15
	}
}

proc validate_PARAM_VALUE.TYPE_TDL_15 { PARAM_VALUE.TYPE_TDL_15 } {
	# Procedure called to validate TYPE_TDL_15
	return true
}

proc update_MODELPARAM_VALUE.TYPE_TDL_15 { MODELPARAM_VALUE.TYPE_TDL_15 PARAM_VALUE.TYPE_TDL_15 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.TYPE_TDL_15}] ${MODELPARAM_VALUE.TYPE_TDL_15}
}
# ------------------------------------------------------------------------------

# ------------------------------- BIT_SMP_TDL ----------------------------------
proc update_PARAM_VALUE.BIT_SMP_TDL { PARAM_VALUE.BIT_SMP_TDL  PARAM_VALUE.NUM_TAP_TDL } {
	# Procedure called to update BIT_SMP_TDL when any of the dependent parameters in the arguments change
    set BIT_SMP_TDL ${PARAM_VALUE.BIT_SMP_TDL}
    set NUM_TAP_TDL ${PARAM_VALUE.NUM_TAP_TDL}

    set values(BIT_SMP_TDL) [get_property value $BIT_SMP_TDL]
    set values(NUM_TAP_TDL) [get_property value $NUM_TAP_TDL]

# Refresh the new range
    set MIN_BIT_SMP_TDL 1
    set MAX_BIT_SMP_TDL $values(NUM_TAP_TDL)
    set_property range  "$MIN_BIT_SMP_TDL,$MAX_BIT_SMP_TDL" $BIT_SMP_TDL
	# Procedure called to update MIN_VALID_TAP_POS when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.BIT_SMP_TDL { PARAM_VALUE.BIT_SMP_TDL } {
	# Procedure called to validate BIT_SMP_TDL
	return true
}


proc update_MODELPARAM_VALUE.BIT_SMP_TDL { MODELPARAM_VALUE.BIT_SMP_TDL PARAM_VALUE.BIT_SMP_TDL } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.BIT_SMP_TDL}] ${MODELPARAM_VALUE.BIT_SMP_TDL}
}
# ------------------------------------------------------------------------------

# ----------------------------- BUFFERING_STAGE --------------------------------
proc update_PARAM_VALUE.BUFFERING_STAGE { PARAM_VALUE.BUFFERING_STAGE } {
	# Procedure called to update BUFFERING_STAGE when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.BUFFERING_STAGE { PARAM_VALUE.BUFFERING_STAGE } {
	# Procedure called to validate BUFFERING_STAGE
	return true
}

proc update_MODELPARAM_VALUE.BUFFERING_STAGE { MODELPARAM_VALUE.BUFFERING_STAGE PARAM_VALUE.BUFFERING_STAGE } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.BUFFERING_STAGE}] ${MODELPARAM_VALUE.BUFFERING_STAGE}
}
# ------------------------------------------------------------------------------

# ------------------------------- DEBUG_MODE -----------------------------------
proc update_PARAM_VALUE.DEBUG_MODE { PARAM_VALUE.DEBUG_MODE } {
	# Procedure called to update DEBUG_MODE when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.DEBUG_MODE { PARAM_VALUE.DEBUG_MODE } {
	# Procedure called to validate DEBUG_MODE
	return true
}

proc update_MODELPARAM_VALUE.DEBUG_MODE { MODELPARAM_VALUE.DEBUG_MODE PARAM_VALUE.DEBUG_MODE } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.DEBUG_MODE}] ${MODELPARAM_VALUE.DEBUG_MODE}
}
# ------------------------------------------------------------------------------

# ------------------------------- NUMBER_OF_TDL --------------------------------
proc update_PARAM_VALUE.NUMBER_OF_TDL { PARAM_VALUE.NUMBER_OF_TDL } {
	# Procedure called to update NUMBER_OF_TDL when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.NUMBER_OF_TDL { PARAM_VALUE.NUMBER_OF_TDL } {
	# Procedure called to validate NUMBER_OF_TDL
	return true
}

proc update_MODELPARAM_VALUE.NUMBER_OF_TDL { MODELPARAM_VALUE.NUMBER_OF_TDL PARAM_VALUE.NUMBER_OF_TDL } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.NUMBER_OF_TDL}] ${MODELPARAM_VALUE.NUMBER_OF_TDL}
}
# ------------------------------------------------------------------------------

# ----------------------------- BUFFERING_STAGE --------------------------------
proc update_PARAM_VALUE.NUM_TAP_TDL { PARAM_VALUE.NUM_TAP_TDL } {
	# Procedure called to update NUM_TAP_TDL when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.NUM_TAP_TDL { PARAM_VALUE.NUM_TAP_TDL } {
	# Procedure called to validate NUM_TAP_TDL
	return true
}

proc update_MODELPARAM_VALUE.NUM_TAP_TDL { MODELPARAM_VALUE.NUM_TAP_TDL PARAM_VALUE.NUM_TAP_TDL } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.NUM_TAP_TDL}] ${MODELPARAM_VALUE.NUM_TAP_TDL}
}
# ------------------------------------------------------------------------------

# --------------------------------- SIM_VS_IMP ---------------------------------
proc update_PARAM_VALUE.SIM_VS_IMP { PARAM_VALUE.SIM_VS_IMP } {
	# Procedure called to update SIM_VS_IMP when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.SIM_VS_IMP { PARAM_VALUE.SIM_VS_IMP } {
	# Procedure called to validate SIM_VS_IMP
	return true
}

proc update_MODELPARAM_VALUE.SIM_VS_IMP { MODELPARAM_VALUE.SIM_VS_IMP PARAM_VALUE.SIM_VS_IMP } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.SIM_VS_IMP}] ${MODELPARAM_VALUE.SIM_VS_IMP}
}
# ------------------------------------------------------------------------------

# ---------------------------- VALID_NUMBER_OF_TDL_INIT ------------------------
proc update_PARAM_VALUE.VALID_NUMBER_OF_TDL_INIT { PARAM_VALUE.VALID_NUMBER_OF_TDL_INIT PARAM_VALUE.NUMBER_OF_TDL} {
	# Procedure called to update VALID_NUMBER_OF_TDL_INIT when any of the dependent parameters in the arguments change
    set NUMBER_OF_TDL ${PARAM_VALUE.NUMBER_OF_TDL}
    set VALID_NUMBER_OF_TDL_INIT ${PARAM_VALUE.VALID_NUMBER_OF_TDL_INIT}


    set values(NUMBER_OF_TDL) [get_property value $NUMBER_OF_TDL]
    set values(VALID_NUMBER_OF_TDL_INIT) [get_property value $VALID_NUMBER_OF_TDL_INIT]


    # Refresh the new range
    set MIN_VALID_NUMBER_OF_TDL_INIT 0
    set MAX_VALID_NUMBER_OF_TDL_INIT [expr $values(NUMBER_OF_TDL) -1]
    set_property range  "$MIN_VALID_NUMBER_OF_TDL_INIT,$MAX_VALID_NUMBER_OF_TDL_INIT" $VALID_NUMBER_OF_TDL_INIT
    # Procedure called to update MIN_VALID_TAP_POS when any of the dependent parameters in the arguments change

}

proc validate_PARAM_VALUE.VALID_NUMBER_OF_TDL_INIT { PARAM_VALUE.VALID_NUMBER_OF_TDL_INIT } {
	# Procedure called to validate VALID_NUMBER_OF_TDL_INIT
	return true
}

proc update_MODELPARAM_VALUE.VALID_NUMBER_OF_TDL_INIT { MODELPARAM_VALUE.VALID_NUMBER_OF_TDL_INIT PARAM_VALUE.VALID_NUMBER_OF_TDL_INIT } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.VALID_NUMBER_OF_TDL_INIT}] ${MODELPARAM_VALUE.VALID_NUMBER_OF_TDL_INIT}
}
# ------------------------------------------------------------------------------

# -------------------------- VALID_POSITION_TAP_INIT ---------------------------
proc update_PARAM_VALUE.VALID_POSITION_TAP_INIT { PARAM_VALUE.VALID_POSITION_TAP_INIT PARAM_VALUE.BIT_SMP_TDL PARAM_VALUE.BIT_SMP_PRE_TDL } {
	# Procedure called to update VALID_POSITION_TAP_INIT when any of the dependent parameters in the arguments change
    set BIT_SMP_TDL ${PARAM_VALUE.BIT_SMP_TDL}
    set VALID_POSITION_TAP_INIT ${PARAM_VALUE.VALID_POSITION_TAP_INIT}
    set BIT_SMP_PRE_TDL ${PARAM_VALUE.BIT_SMP_PRE_TDL}

    set values(BIT_SMP_TDL) [get_property value $BIT_SMP_TDL]
    set values(VALID_POSITION_TAP_INIT) [get_property value $VALID_POSITION_TAP_INIT]
	set values(BIT_SMP_PRE_TDL) [get_property value $BIT_SMP_PRE_TDL]


    # Refresh the new range
    set MIN_VALID_POSITION_TAP_INIT 0
    set MAX_VALID_POSITION_TAP_INIT [expr $values(BIT_SMP_TDL) + $values(BIT_SMP_PRE_TDL) -1]
    set_property range  "$MIN_VALID_POSITION_TAP_INIT,$MAX_VALID_POSITION_TAP_INIT" $VALID_POSITION_TAP_INIT
    # Procedure called to update MIN_VALID_TAP_POS when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.VALID_POSITION_TAP_INIT { PARAM_VALUE.VALID_POSITION_TAP_INIT } {
	# Procedure called to validate VALID_POSITION_TAP_INIT
	return true
}

proc update_MODELPARAM_VALUE.VALID_POSITION_TAP_INIT { MODELPARAM_VALUE.VALID_POSITION_TAP_INIT PARAM_VALUE.VALID_POSITION_TAP_INIT } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.VALID_POSITION_TAP_INIT}] ${MODELPARAM_VALUE.VALID_POSITION_TAP_INIT}
}
# ------------------------------------------------------------------------------

# ------------------------------- BIT_SMP_PRE_TDL ------------------------------
proc update_PARAM_VALUE.BIT_SMP_PRE_TDL { PARAM_VALUE.BIT_SMP_PRE_TDL PARAM_VALUE.NUM_TAP_PRE_TDL } {
	# Procedure called to update BIT_SMP_TDL when any of the dependent parameters in the arguments change
    set BIT_SMP_PRE_TDL ${PARAM_VALUE.BIT_SMP_PRE_TDL}
    set NUM_TAP_PRE_TDL ${PARAM_VALUE.NUM_TAP_PRE_TDL}

    set values(BIT_SMP_PRE_TDL) [get_property value $BIT_SMP_PRE_TDL]
    set values(NUM_TAP_PRE_TDL) [get_property value $NUM_TAP_PRE_TDL]

# Refresh the new range
    set MIN_BIT_SMP_PRE_TDL 0
    set MAX_BIT_SMP_PRE_TDL $values(NUM_TAP_PRE_TDL)
    set_property range  "$MIN_BIT_SMP_PRE_TDL,$MAX_BIT_SMP_PRE_TDL" $BIT_SMP_PRE_TDL
	# Procedure called to update MIN_VALID_TAP_POS when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.BIT_SMP_PRE_TDL { PARAM_VALUE.BIT_SMP_PRE_TDL } {
	# Procedure called to validate BIT_SMP_PRE_TDL
	return true
}

proc update_MODELPARAM_VALUE.BIT_SMP_PRE_TDL { MODELPARAM_VALUE.BIT_SMP_PRE_TDL PARAM_VALUE.BIT_SMP_PRE_TDL } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.BIT_SMP_PRE_TDL}] ${MODELPARAM_VALUE.BIT_SMP_PRE_TDL}
}
# ------------------------------------------------------------------------------

# ------------------------------- BIT_SMP_PRE_TDL ------------------------------
proc update_PARAM_VALUE.NUM_TAP_PRE_TDL { PARAM_VALUE.NUM_TAP_PRE_TDL } {
	# Procedure called to update NUM_TAP_PRE_TDL when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.NUM_TAP_PRE_TDL { PARAM_VALUE.NUM_TAP_PRE_TDL } {
	# Procedure called to validate NUM_TAP_PRE_TDL
	return true
}

proc update_MODELPARAM_VALUE.NUM_TAP_PRE_TDL { MODELPARAM_VALUE.NUM_TAP_PRE_TDL PARAM_VALUE.NUM_TAP_PRE_TDL } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.NUM_TAP_PRE_TDL}] ${MODELPARAM_VALUE.NUM_TAP_PRE_TDL}
}
# ------------------------------------------------------------------------------
