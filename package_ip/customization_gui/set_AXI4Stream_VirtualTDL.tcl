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

proc update_PARAM_VALUE.MAX_VALID_TAP_POS { PARAM_VALUE.MAX_VALID_TAP_POS PARAM_VALUE.DEBUG_MODE } {
	# Procedure called to update MAX_VALID_TAP_POS when any of the dependent parameters in the arguments change
	
	set MAX_VALID_TAP_POS ${PARAM_VALUE.MAX_VALID_TAP_POS}
	set DEBUG_MODE ${PARAM_VALUE.DEBUG_MODE}
	set values(DEBUG_MODE) [get_property value $DEBUG_MODE]
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

proc update_PARAM_VALUE.MIN_VALID_TAP_POS { PARAM_VALUE.MIN_VALID_TAP_POS PARAM_VALUE.DEBUG_MODE } {
	# Procedure called to update MIN_VALID_TAP_POS when any of the dependent parameters in the arguments change
	
	set MIN_VALID_TAP_POS ${PARAM_VALUE.MIN_VALID_TAP_POS}
	set DEBUG_MODE ${PARAM_VALUE.DEBUG_MODE}
	set values(DEBUG_MODE) [get_property value $DEBUG_MODE]
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

proc update_PARAM_VALUE.OFFSET_TAP_TDL_0 { PARAM_VALUE.OFFSET_TAP_TDL_0 PARAM_VALUE.NUMBER_OF_CARRY_CHAINS PARAM_VALUE.BIT_SMP_TDL PARAM_VALUE.NUM_TAP_TDL } {
	# Procedure called to update OFFSET_TAP_TDL_0 when any of the dependent parameters in the arguments change
	
	set OFFSET_TAP_TDL_0 ${PARAM_VALUE.OFFSET_TAP_TDL_0}
	set NUMBER_OF_CARRY_CHAINS ${PARAM_VALUE.NUMBER_OF_CARRY_CHAINS}
	set BIT_SMP_TDL ${PARAM_VALUE.BIT_SMP_TDL}
	set NUM_TAP_TDL ${PARAM_VALUE.NUM_TAP_TDL}
	set values(NUMBER_OF_CARRY_CHAINS) [get_property value $NUMBER_OF_CARRY_CHAINS]
	set values(BIT_SMP_TDL) [get_property value $BIT_SMP_TDL]
	set values(NUM_TAP_TDL) [get_property value $NUM_TAP_TDL]
	if { [gen_USERPARAMETER_OFFSET_TAP_TDL_0_ENABLEMENT $values(NUMBER_OF_CARRY_CHAINS) $values(BIT_SMP_TDL) $values(NUM_TAP_TDL)] } {
		set_property enabled true $OFFSET_TAP_TDL_0
	} else {
		set_property enabled false $OFFSET_TAP_TDL_0
	}
}

proc validate_PARAM_VALUE.OFFSET_TAP_TDL_0 { PARAM_VALUE.OFFSET_TAP_TDL_0 } {
	# Procedure called to validate OFFSET_TAP_TDL_0
	return true
}

proc update_PARAM_VALUE.OFFSET_TAP_TDL_1 { PARAM_VALUE.OFFSET_TAP_TDL_1 PARAM_VALUE.NUMBER_OF_CARRY_CHAINS PARAM_VALUE.BIT_SMP_TDL PARAM_VALUE.NUM_TAP_TDL } {
	# Procedure called to update OFFSET_TAP_TDL_1 when any of the dependent parameters in the arguments change
	
	set OFFSET_TAP_TDL_1 ${PARAM_VALUE.OFFSET_TAP_TDL_1}
	set NUMBER_OF_CARRY_CHAINS ${PARAM_VALUE.NUMBER_OF_CARRY_CHAINS}
	set BIT_SMP_TDL ${PARAM_VALUE.BIT_SMP_TDL}
	set NUM_TAP_TDL ${PARAM_VALUE.NUM_TAP_TDL}
	set values(NUMBER_OF_CARRY_CHAINS) [get_property value $NUMBER_OF_CARRY_CHAINS]
	set values(BIT_SMP_TDL) [get_property value $BIT_SMP_TDL]
	set values(NUM_TAP_TDL) [get_property value $NUM_TAP_TDL]
	if { [gen_USERPARAMETER_OFFSET_TAP_TDL_1_ENABLEMENT $values(NUMBER_OF_CARRY_CHAINS) $values(BIT_SMP_TDL) $values(NUM_TAP_TDL)] } {
		set_property enabled true $OFFSET_TAP_TDL_1
	} else {
		set_property enabled false $OFFSET_TAP_TDL_1
	}
}

proc validate_PARAM_VALUE.OFFSET_TAP_TDL_1 { PARAM_VALUE.OFFSET_TAP_TDL_1 } {
	# Procedure called to validate OFFSET_TAP_TDL_1
	return true
}

proc update_PARAM_VALUE.OFFSET_TAP_TDL_10 { PARAM_VALUE.OFFSET_TAP_TDL_10 PARAM_VALUE.NUMBER_OF_CARRY_CHAINS PARAM_VALUE.BIT_SMP_TDL PARAM_VALUE.NUM_TAP_TDL } {
	# Procedure called to update OFFSET_TAP_TDL_10 when any of the dependent parameters in the arguments change
	
	set OFFSET_TAP_TDL_10 ${PARAM_VALUE.OFFSET_TAP_TDL_10}
	set NUMBER_OF_CARRY_CHAINS ${PARAM_VALUE.NUMBER_OF_CARRY_CHAINS}
	set BIT_SMP_TDL ${PARAM_VALUE.BIT_SMP_TDL}
	set NUM_TAP_TDL ${PARAM_VALUE.NUM_TAP_TDL}
	set values(NUMBER_OF_CARRY_CHAINS) [get_property value $NUMBER_OF_CARRY_CHAINS]
	set values(BIT_SMP_TDL) [get_property value $BIT_SMP_TDL]
	set values(NUM_TAP_TDL) [get_property value $NUM_TAP_TDL]
	if { [gen_USERPARAMETER_OFFSET_TAP_TDL_10_ENABLEMENT $values(NUMBER_OF_CARRY_CHAINS) $values(BIT_SMP_TDL) $values(NUM_TAP_TDL)] } {
		set_property enabled true $OFFSET_TAP_TDL_10
	} else {
		set_property enabled false $OFFSET_TAP_TDL_10
	}
}

proc validate_PARAM_VALUE.OFFSET_TAP_TDL_10 { PARAM_VALUE.OFFSET_TAP_TDL_10 } {
	# Procedure called to validate OFFSET_TAP_TDL_10
	return true
}

proc update_PARAM_VALUE.OFFSET_TAP_TDL_11 { PARAM_VALUE.OFFSET_TAP_TDL_11 PARAM_VALUE.NUMBER_OF_CARRY_CHAINS PARAM_VALUE.BIT_SMP_TDL PARAM_VALUE.NUM_TAP_TDL } {
	# Procedure called to update OFFSET_TAP_TDL_11 when any of the dependent parameters in the arguments change
	
	set OFFSET_TAP_TDL_11 ${PARAM_VALUE.OFFSET_TAP_TDL_11}
	set NUMBER_OF_CARRY_CHAINS ${PARAM_VALUE.NUMBER_OF_CARRY_CHAINS}
	set BIT_SMP_TDL ${PARAM_VALUE.BIT_SMP_TDL}
	set NUM_TAP_TDL ${PARAM_VALUE.NUM_TAP_TDL}
	set values(NUMBER_OF_CARRY_CHAINS) [get_property value $NUMBER_OF_CARRY_CHAINS]
	set values(BIT_SMP_TDL) [get_property value $BIT_SMP_TDL]
	set values(NUM_TAP_TDL) [get_property value $NUM_TAP_TDL]
	if { [gen_USERPARAMETER_OFFSET_TAP_TDL_11_ENABLEMENT $values(NUMBER_OF_CARRY_CHAINS) $values(BIT_SMP_TDL) $values(NUM_TAP_TDL)] } {
		set_property enabled true $OFFSET_TAP_TDL_11
	} else {
		set_property enabled false $OFFSET_TAP_TDL_11
	}
}

proc validate_PARAM_VALUE.OFFSET_TAP_TDL_11 { PARAM_VALUE.OFFSET_TAP_TDL_11 } {
	# Procedure called to validate OFFSET_TAP_TDL_11
	return true
}

proc update_PARAM_VALUE.OFFSET_TAP_TDL_12 { PARAM_VALUE.OFFSET_TAP_TDL_12 PARAM_VALUE.NUMBER_OF_CARRY_CHAINS PARAM_VALUE.BIT_SMP_TDL PARAM_VALUE.NUM_TAP_TDL } {
	# Procedure called to update OFFSET_TAP_TDL_12 when any of the dependent parameters in the arguments change
	
	set OFFSET_TAP_TDL_12 ${PARAM_VALUE.OFFSET_TAP_TDL_12}
	set NUMBER_OF_CARRY_CHAINS ${PARAM_VALUE.NUMBER_OF_CARRY_CHAINS}
	set BIT_SMP_TDL ${PARAM_VALUE.BIT_SMP_TDL}
	set NUM_TAP_TDL ${PARAM_VALUE.NUM_TAP_TDL}
	set values(NUMBER_OF_CARRY_CHAINS) [get_property value $NUMBER_OF_CARRY_CHAINS]
	set values(BIT_SMP_TDL) [get_property value $BIT_SMP_TDL]
	set values(NUM_TAP_TDL) [get_property value $NUM_TAP_TDL]
	if { [gen_USERPARAMETER_OFFSET_TAP_TDL_12_ENABLEMENT $values(NUMBER_OF_CARRY_CHAINS) $values(BIT_SMP_TDL) $values(NUM_TAP_TDL)] } {
		set_property enabled true $OFFSET_TAP_TDL_12
	} else {
		set_property enabled false $OFFSET_TAP_TDL_12
	}
}

proc validate_PARAM_VALUE.OFFSET_TAP_TDL_12 { PARAM_VALUE.OFFSET_TAP_TDL_12 } {
	# Procedure called to validate OFFSET_TAP_TDL_12
	return true
}

proc update_PARAM_VALUE.OFFSET_TAP_TDL_13 { PARAM_VALUE.OFFSET_TAP_TDL_13 PARAM_VALUE.NUMBER_OF_CARRY_CHAINS PARAM_VALUE.BIT_SMP_TDL PARAM_VALUE.NUM_TAP_TDL } {
	# Procedure called to update OFFSET_TAP_TDL_13 when any of the dependent parameters in the arguments change
	
	set OFFSET_TAP_TDL_13 ${PARAM_VALUE.OFFSET_TAP_TDL_13}
	set NUMBER_OF_CARRY_CHAINS ${PARAM_VALUE.NUMBER_OF_CARRY_CHAINS}
	set BIT_SMP_TDL ${PARAM_VALUE.BIT_SMP_TDL}
	set NUM_TAP_TDL ${PARAM_VALUE.NUM_TAP_TDL}
	set values(NUMBER_OF_CARRY_CHAINS) [get_property value $NUMBER_OF_CARRY_CHAINS]
	set values(BIT_SMP_TDL) [get_property value $BIT_SMP_TDL]
	set values(NUM_TAP_TDL) [get_property value $NUM_TAP_TDL]
	if { [gen_USERPARAMETER_OFFSET_TAP_TDL_13_ENABLEMENT $values(NUMBER_OF_CARRY_CHAINS) $values(BIT_SMP_TDL) $values(NUM_TAP_TDL)] } {
		set_property enabled true $OFFSET_TAP_TDL_13
	} else {
		set_property enabled false $OFFSET_TAP_TDL_13
	}
}

proc validate_PARAM_VALUE.OFFSET_TAP_TDL_13 { PARAM_VALUE.OFFSET_TAP_TDL_13 } {
	# Procedure called to validate OFFSET_TAP_TDL_13
	return true
}

proc update_PARAM_VALUE.OFFSET_TAP_TDL_14 { PARAM_VALUE.OFFSET_TAP_TDL_14 PARAM_VALUE.NUMBER_OF_CARRY_CHAINS PARAM_VALUE.BIT_SMP_TDL PARAM_VALUE.NUM_TAP_TDL } {
	# Procedure called to update OFFSET_TAP_TDL_14 when any of the dependent parameters in the arguments change
	
	set OFFSET_TAP_TDL_14 ${PARAM_VALUE.OFFSET_TAP_TDL_14}
	set NUMBER_OF_CARRY_CHAINS ${PARAM_VALUE.NUMBER_OF_CARRY_CHAINS}
	set BIT_SMP_TDL ${PARAM_VALUE.BIT_SMP_TDL}
	set NUM_TAP_TDL ${PARAM_VALUE.NUM_TAP_TDL}
	set values(NUMBER_OF_CARRY_CHAINS) [get_property value $NUMBER_OF_CARRY_CHAINS]
	set values(BIT_SMP_TDL) [get_property value $BIT_SMP_TDL]
	set values(NUM_TAP_TDL) [get_property value $NUM_TAP_TDL]
	if { [gen_USERPARAMETER_OFFSET_TAP_TDL_14_ENABLEMENT $values(NUMBER_OF_CARRY_CHAINS) $values(BIT_SMP_TDL) $values(NUM_TAP_TDL)] } {
		set_property enabled true $OFFSET_TAP_TDL_14
	} else {
		set_property enabled false $OFFSET_TAP_TDL_14
	}
}

proc validate_PARAM_VALUE.OFFSET_TAP_TDL_14 { PARAM_VALUE.OFFSET_TAP_TDL_14 } {
	# Procedure called to validate OFFSET_TAP_TDL_14
	return true
}

proc update_PARAM_VALUE.OFFSET_TAP_TDL_15 { PARAM_VALUE.OFFSET_TAP_TDL_15 PARAM_VALUE.NUMBER_OF_CARRY_CHAINS PARAM_VALUE.BIT_SMP_TDL PARAM_VALUE.NUM_TAP_TDL } {
	# Procedure called to update OFFSET_TAP_TDL_15 when any of the dependent parameters in the arguments change
	
	set OFFSET_TAP_TDL_15 ${PARAM_VALUE.OFFSET_TAP_TDL_15}
	set NUMBER_OF_CARRY_CHAINS ${PARAM_VALUE.NUMBER_OF_CARRY_CHAINS}
	set BIT_SMP_TDL ${PARAM_VALUE.BIT_SMP_TDL}
	set NUM_TAP_TDL ${PARAM_VALUE.NUM_TAP_TDL}
	set values(NUMBER_OF_CARRY_CHAINS) [get_property value $NUMBER_OF_CARRY_CHAINS]
	set values(BIT_SMP_TDL) [get_property value $BIT_SMP_TDL]
	set values(NUM_TAP_TDL) [get_property value $NUM_TAP_TDL]
	if { [gen_USERPARAMETER_OFFSET_TAP_TDL_15_ENABLEMENT $values(NUMBER_OF_CARRY_CHAINS) $values(BIT_SMP_TDL) $values(NUM_TAP_TDL)] } {
		set_property enabled true $OFFSET_TAP_TDL_15
	} else {
		set_property enabled false $OFFSET_TAP_TDL_15
	}
}

proc validate_PARAM_VALUE.OFFSET_TAP_TDL_15 { PARAM_VALUE.OFFSET_TAP_TDL_15 } {
	# Procedure called to validate OFFSET_TAP_TDL_15
	return true
}

proc update_PARAM_VALUE.OFFSET_TAP_TDL_2 { PARAM_VALUE.OFFSET_TAP_TDL_2 PARAM_VALUE.NUMBER_OF_CARRY_CHAINS PARAM_VALUE.BIT_SMP_TDL PARAM_VALUE.NUM_TAP_TDL } {
	# Procedure called to update OFFSET_TAP_TDL_2 when any of the dependent parameters in the arguments change
	
	set OFFSET_TAP_TDL_2 ${PARAM_VALUE.OFFSET_TAP_TDL_2}
	set NUMBER_OF_CARRY_CHAINS ${PARAM_VALUE.NUMBER_OF_CARRY_CHAINS}
	set BIT_SMP_TDL ${PARAM_VALUE.BIT_SMP_TDL}
	set NUM_TAP_TDL ${PARAM_VALUE.NUM_TAP_TDL}
	set values(NUMBER_OF_CARRY_CHAINS) [get_property value $NUMBER_OF_CARRY_CHAINS]
	set values(BIT_SMP_TDL) [get_property value $BIT_SMP_TDL]
	set values(NUM_TAP_TDL) [get_property value $NUM_TAP_TDL]
	if { [gen_USERPARAMETER_OFFSET_TAP_TDL_2_ENABLEMENT $values(NUMBER_OF_CARRY_CHAINS) $values(BIT_SMP_TDL) $values(NUM_TAP_TDL)] } {
		set_property enabled true $OFFSET_TAP_TDL_2
	} else {
		set_property enabled false $OFFSET_TAP_TDL_2
	}
}

proc validate_PARAM_VALUE.OFFSET_TAP_TDL_2 { PARAM_VALUE.OFFSET_TAP_TDL_2 } {
	# Procedure called to validate OFFSET_TAP_TDL_2
	return true
}

proc update_PARAM_VALUE.OFFSET_TAP_TDL_3 { PARAM_VALUE.OFFSET_TAP_TDL_3 PARAM_VALUE.NUMBER_OF_CARRY_CHAINS PARAM_VALUE.BIT_SMP_TDL PARAM_VALUE.NUM_TAP_TDL } {
	# Procedure called to update OFFSET_TAP_TDL_3 when any of the dependent parameters in the arguments change
	
	set OFFSET_TAP_TDL_3 ${PARAM_VALUE.OFFSET_TAP_TDL_3}
	set NUMBER_OF_CARRY_CHAINS ${PARAM_VALUE.NUMBER_OF_CARRY_CHAINS}
	set BIT_SMP_TDL ${PARAM_VALUE.BIT_SMP_TDL}
	set NUM_TAP_TDL ${PARAM_VALUE.NUM_TAP_TDL}
	set values(NUMBER_OF_CARRY_CHAINS) [get_property value $NUMBER_OF_CARRY_CHAINS]
	set values(BIT_SMP_TDL) [get_property value $BIT_SMP_TDL]
	set values(NUM_TAP_TDL) [get_property value $NUM_TAP_TDL]
	if { [gen_USERPARAMETER_OFFSET_TAP_TDL_3_ENABLEMENT $values(NUMBER_OF_CARRY_CHAINS) $values(BIT_SMP_TDL) $values(NUM_TAP_TDL)] } {
		set_property enabled true $OFFSET_TAP_TDL_3
	} else {
		set_property enabled false $OFFSET_TAP_TDL_3
	}
}

proc validate_PARAM_VALUE.OFFSET_TAP_TDL_3 { PARAM_VALUE.OFFSET_TAP_TDL_3 } {
	# Procedure called to validate OFFSET_TAP_TDL_3
	return true
}

proc update_PARAM_VALUE.OFFSET_TAP_TDL_4 { PARAM_VALUE.OFFSET_TAP_TDL_4 PARAM_VALUE.NUMBER_OF_CARRY_CHAINS PARAM_VALUE.BIT_SMP_TDL PARAM_VALUE.NUM_TAP_TDL } {
	# Procedure called to update OFFSET_TAP_TDL_4 when any of the dependent parameters in the arguments change
	
	set OFFSET_TAP_TDL_4 ${PARAM_VALUE.OFFSET_TAP_TDL_4}
	set NUMBER_OF_CARRY_CHAINS ${PARAM_VALUE.NUMBER_OF_CARRY_CHAINS}
	set BIT_SMP_TDL ${PARAM_VALUE.BIT_SMP_TDL}
	set NUM_TAP_TDL ${PARAM_VALUE.NUM_TAP_TDL}
	set values(NUMBER_OF_CARRY_CHAINS) [get_property value $NUMBER_OF_CARRY_CHAINS]
	set values(BIT_SMP_TDL) [get_property value $BIT_SMP_TDL]
	set values(NUM_TAP_TDL) [get_property value $NUM_TAP_TDL]
	if { [gen_USERPARAMETER_OFFSET_TAP_TDL_4_ENABLEMENT $values(NUMBER_OF_CARRY_CHAINS) $values(BIT_SMP_TDL) $values(NUM_TAP_TDL)] } {
		set_property enabled true $OFFSET_TAP_TDL_4
	} else {
		set_property enabled false $OFFSET_TAP_TDL_4
	}
}

proc validate_PARAM_VALUE.OFFSET_TAP_TDL_4 { PARAM_VALUE.OFFSET_TAP_TDL_4 } {
	# Procedure called to validate OFFSET_TAP_TDL_4
	return true
}

proc update_PARAM_VALUE.OFFSET_TAP_TDL_5 { PARAM_VALUE.OFFSET_TAP_TDL_5 PARAM_VALUE.NUMBER_OF_CARRY_CHAINS PARAM_VALUE.BIT_SMP_TDL PARAM_VALUE.NUM_TAP_TDL } {
	# Procedure called to update OFFSET_TAP_TDL_5 when any of the dependent parameters in the arguments change
	
	set OFFSET_TAP_TDL_5 ${PARAM_VALUE.OFFSET_TAP_TDL_5}
	set NUMBER_OF_CARRY_CHAINS ${PARAM_VALUE.NUMBER_OF_CARRY_CHAINS}
	set BIT_SMP_TDL ${PARAM_VALUE.BIT_SMP_TDL}
	set NUM_TAP_TDL ${PARAM_VALUE.NUM_TAP_TDL}
	set values(NUMBER_OF_CARRY_CHAINS) [get_property value $NUMBER_OF_CARRY_CHAINS]
	set values(BIT_SMP_TDL) [get_property value $BIT_SMP_TDL]
	set values(NUM_TAP_TDL) [get_property value $NUM_TAP_TDL]
	if { [gen_USERPARAMETER_OFFSET_TAP_TDL_5_ENABLEMENT $values(NUMBER_OF_CARRY_CHAINS) $values(BIT_SMP_TDL) $values(NUM_TAP_TDL)] } {
		set_property enabled true $OFFSET_TAP_TDL_5
	} else {
		set_property enabled false $OFFSET_TAP_TDL_5
	}
}

proc validate_PARAM_VALUE.OFFSET_TAP_TDL_5 { PARAM_VALUE.OFFSET_TAP_TDL_5 } {
	# Procedure called to validate OFFSET_TAP_TDL_5
	return true
}

proc update_PARAM_VALUE.OFFSET_TAP_TDL_6 { PARAM_VALUE.OFFSET_TAP_TDL_6 PARAM_VALUE.NUMBER_OF_CARRY_CHAINS PARAM_VALUE.BIT_SMP_TDL PARAM_VALUE.NUM_TAP_TDL } {
	# Procedure called to update OFFSET_TAP_TDL_6 when any of the dependent parameters in the arguments change
	
	set OFFSET_TAP_TDL_6 ${PARAM_VALUE.OFFSET_TAP_TDL_6}
	set NUMBER_OF_CARRY_CHAINS ${PARAM_VALUE.NUMBER_OF_CARRY_CHAINS}
	set BIT_SMP_TDL ${PARAM_VALUE.BIT_SMP_TDL}
	set NUM_TAP_TDL ${PARAM_VALUE.NUM_TAP_TDL}
	set values(NUMBER_OF_CARRY_CHAINS) [get_property value $NUMBER_OF_CARRY_CHAINS]
	set values(BIT_SMP_TDL) [get_property value $BIT_SMP_TDL]
	set values(NUM_TAP_TDL) [get_property value $NUM_TAP_TDL]
	if { [gen_USERPARAMETER_OFFSET_TAP_TDL_6_ENABLEMENT $values(NUMBER_OF_CARRY_CHAINS) $values(BIT_SMP_TDL) $values(NUM_TAP_TDL)] } {
		set_property enabled true $OFFSET_TAP_TDL_6
	} else {
		set_property enabled false $OFFSET_TAP_TDL_6
	}
}

proc validate_PARAM_VALUE.OFFSET_TAP_TDL_6 { PARAM_VALUE.OFFSET_TAP_TDL_6 } {
	# Procedure called to validate OFFSET_TAP_TDL_6
	return true
}

proc update_PARAM_VALUE.OFFSET_TAP_TDL_7 { PARAM_VALUE.OFFSET_TAP_TDL_7 PARAM_VALUE.NUMBER_OF_CARRY_CHAINS PARAM_VALUE.BIT_SMP_TDL PARAM_VALUE.NUM_TAP_TDL } {
	# Procedure called to update OFFSET_TAP_TDL_7 when any of the dependent parameters in the arguments change
	
	set OFFSET_TAP_TDL_7 ${PARAM_VALUE.OFFSET_TAP_TDL_7}
	set NUMBER_OF_CARRY_CHAINS ${PARAM_VALUE.NUMBER_OF_CARRY_CHAINS}
	set BIT_SMP_TDL ${PARAM_VALUE.BIT_SMP_TDL}
	set NUM_TAP_TDL ${PARAM_VALUE.NUM_TAP_TDL}
	set values(NUMBER_OF_CARRY_CHAINS) [get_property value $NUMBER_OF_CARRY_CHAINS]
	set values(BIT_SMP_TDL) [get_property value $BIT_SMP_TDL]
	set values(NUM_TAP_TDL) [get_property value $NUM_TAP_TDL]
	if { [gen_USERPARAMETER_OFFSET_TAP_TDL_7_ENABLEMENT $values(NUMBER_OF_CARRY_CHAINS) $values(BIT_SMP_TDL) $values(NUM_TAP_TDL)] } {
		set_property enabled true $OFFSET_TAP_TDL_7
	} else {
		set_property enabled false $OFFSET_TAP_TDL_7
	}
}

proc validate_PARAM_VALUE.OFFSET_TAP_TDL_7 { PARAM_VALUE.OFFSET_TAP_TDL_7 } {
	# Procedure called to validate OFFSET_TAP_TDL_7
	return true
}

proc update_PARAM_VALUE.OFFSET_TAP_TDL_8 { PARAM_VALUE.OFFSET_TAP_TDL_8 PARAM_VALUE.NUMBER_OF_CARRY_CHAINS PARAM_VALUE.BIT_SMP_TDL PARAM_VALUE.NUM_TAP_TDL } {
	# Procedure called to update OFFSET_TAP_TDL_8 when any of the dependent parameters in the arguments change
	
	set OFFSET_TAP_TDL_8 ${PARAM_VALUE.OFFSET_TAP_TDL_8}
	set NUMBER_OF_CARRY_CHAINS ${PARAM_VALUE.NUMBER_OF_CARRY_CHAINS}
	set BIT_SMP_TDL ${PARAM_VALUE.BIT_SMP_TDL}
	set NUM_TAP_TDL ${PARAM_VALUE.NUM_TAP_TDL}
	set values(NUMBER_OF_CARRY_CHAINS) [get_property value $NUMBER_OF_CARRY_CHAINS]
	set values(BIT_SMP_TDL) [get_property value $BIT_SMP_TDL]
	set values(NUM_TAP_TDL) [get_property value $NUM_TAP_TDL]
	if { [gen_USERPARAMETER_OFFSET_TAP_TDL_8_ENABLEMENT $values(NUMBER_OF_CARRY_CHAINS) $values(BIT_SMP_TDL) $values(NUM_TAP_TDL)] } {
		set_property enabled true $OFFSET_TAP_TDL_8
	} else {
		set_property enabled false $OFFSET_TAP_TDL_8
	}
}

proc validate_PARAM_VALUE.OFFSET_TAP_TDL_8 { PARAM_VALUE.OFFSET_TAP_TDL_8 } {
	# Procedure called to validate OFFSET_TAP_TDL_8
	return true
}

proc update_PARAM_VALUE.OFFSET_TAP_TDL_9 { PARAM_VALUE.OFFSET_TAP_TDL_9 PARAM_VALUE.NUMBER_OF_CARRY_CHAINS PARAM_VALUE.BIT_SMP_TDL PARAM_VALUE.NUM_TAP_TDL } {
	# Procedure called to update OFFSET_TAP_TDL_9 when any of the dependent parameters in the arguments change
	
	set OFFSET_TAP_TDL_9 ${PARAM_VALUE.OFFSET_TAP_TDL_9}
	set NUMBER_OF_CARRY_CHAINS ${PARAM_VALUE.NUMBER_OF_CARRY_CHAINS}
	set BIT_SMP_TDL ${PARAM_VALUE.BIT_SMP_TDL}
	set NUM_TAP_TDL ${PARAM_VALUE.NUM_TAP_TDL}
	set values(NUMBER_OF_CARRY_CHAINS) [get_property value $NUMBER_OF_CARRY_CHAINS]
	set values(BIT_SMP_TDL) [get_property value $BIT_SMP_TDL]
	set values(NUM_TAP_TDL) [get_property value $NUM_TAP_TDL]
	if { [gen_USERPARAMETER_OFFSET_TAP_TDL_9_ENABLEMENT $values(NUMBER_OF_CARRY_CHAINS) $values(BIT_SMP_TDL) $values(NUM_TAP_TDL)] } {
		set_property enabled true $OFFSET_TAP_TDL_9
	} else {
		set_property enabled false $OFFSET_TAP_TDL_9
	}
}

proc validate_PARAM_VALUE.OFFSET_TAP_TDL_9 { PARAM_VALUE.OFFSET_TAP_TDL_9 } {
	# Procedure called to validate OFFSET_TAP_TDL_9
	return true
}

proc update_PARAM_VALUE.STEP_VALID_TAP_POS { PARAM_VALUE.STEP_VALID_TAP_POS PARAM_VALUE.DEBUG_MODE } {
	# Procedure called to update STEP_VALID_TAP_POS when any of the dependent parameters in the arguments change
	
	set STEP_VALID_TAP_POS ${PARAM_VALUE.STEP_VALID_TAP_POS}
	set DEBUG_MODE ${PARAM_VALUE.DEBUG_MODE}
	set values(DEBUG_MODE) [get_property value $DEBUG_MODE]
	if { [gen_USERPARAMETER_STEP_VALID_TAP_POS_ENABLEMENT $values(DEBUG_MODE)] } {
		set_property enabled true $STEP_VALID_TAP_POS
	} else {
		set_property enabled false $STEP_VALID_TAP_POS
	}
}

proc validate_PARAM_VALUE.STEP_VALID_TAP_POS { PARAM_VALUE.STEP_VALID_TAP_POS } {
	# Procedure called to validate STEP_VALID_TAP_POS
	return true
}

proc update_PARAM_VALUE.TYPE_TDL_0 { PARAM_VALUE.TYPE_TDL_0 PARAM_VALUE.NUMBER_OF_CARRY_CHAINS } {
	# Procedure called to update TYPE_TDL_0 when any of the dependent parameters in the arguments change
	
	set TYPE_TDL_0 ${PARAM_VALUE.TYPE_TDL_0}
	set NUMBER_OF_CARRY_CHAINS ${PARAM_VALUE.NUMBER_OF_CARRY_CHAINS}
	set values(NUMBER_OF_CARRY_CHAINS) [get_property value $NUMBER_OF_CARRY_CHAINS]
	if { [gen_USERPARAMETER_TYPE_TDL_0_ENABLEMENT $values(NUMBER_OF_CARRY_CHAINS)] } {
		set_property enabled true $TYPE_TDL_0
	} else {
		set_property enabled false $TYPE_TDL_0
	}
}

proc validate_PARAM_VALUE.TYPE_TDL_0 { PARAM_VALUE.TYPE_TDL_0 } {
	# Procedure called to validate TYPE_TDL_0
	return true
}

proc update_PARAM_VALUE.TYPE_TDL_1 { PARAM_VALUE.TYPE_TDL_1 PARAM_VALUE.NUMBER_OF_CARRY_CHAINS } {
	# Procedure called to update TYPE_TDL_1 when any of the dependent parameters in the arguments change
	
	set TYPE_TDL_1 ${PARAM_VALUE.TYPE_TDL_1}
	set NUMBER_OF_CARRY_CHAINS ${PARAM_VALUE.NUMBER_OF_CARRY_CHAINS}
	set values(NUMBER_OF_CARRY_CHAINS) [get_property value $NUMBER_OF_CARRY_CHAINS]
	if { [gen_USERPARAMETER_TYPE_TDL_1_ENABLEMENT $values(NUMBER_OF_CARRY_CHAINS)] } {
		set_property enabled true $TYPE_TDL_1
	} else {
		set_property enabled false $TYPE_TDL_1
	}
}

proc validate_PARAM_VALUE.TYPE_TDL_1 { PARAM_VALUE.TYPE_TDL_1 } {
	# Procedure called to validate TYPE_TDL_1
	return true
}

proc update_PARAM_VALUE.TYPE_TDL_10 { PARAM_VALUE.TYPE_TDL_10 PARAM_VALUE.NUMBER_OF_CARRY_CHAINS } {
	# Procedure called to update TYPE_TDL_10 when any of the dependent parameters in the arguments change
	
	set TYPE_TDL_10 ${PARAM_VALUE.TYPE_TDL_10}
	set NUMBER_OF_CARRY_CHAINS ${PARAM_VALUE.NUMBER_OF_CARRY_CHAINS}
	set values(NUMBER_OF_CARRY_CHAINS) [get_property value $NUMBER_OF_CARRY_CHAINS]
	if { [gen_USERPARAMETER_TYPE_TDL_10_ENABLEMENT $values(NUMBER_OF_CARRY_CHAINS)] } {
		set_property enabled true $TYPE_TDL_10
	} else {
		set_property enabled false $TYPE_TDL_10
	}
}

proc validate_PARAM_VALUE.TYPE_TDL_10 { PARAM_VALUE.TYPE_TDL_10 } {
	# Procedure called to validate TYPE_TDL_10
	return true
}

proc update_PARAM_VALUE.TYPE_TDL_11 { PARAM_VALUE.TYPE_TDL_11 PARAM_VALUE.NUMBER_OF_CARRY_CHAINS } {
	# Procedure called to update TYPE_TDL_11 when any of the dependent parameters in the arguments change
	
	set TYPE_TDL_11 ${PARAM_VALUE.TYPE_TDL_11}
	set NUMBER_OF_CARRY_CHAINS ${PARAM_VALUE.NUMBER_OF_CARRY_CHAINS}
	set values(NUMBER_OF_CARRY_CHAINS) [get_property value $NUMBER_OF_CARRY_CHAINS]
	if { [gen_USERPARAMETER_TYPE_TDL_11_ENABLEMENT $values(NUMBER_OF_CARRY_CHAINS)] } {
		set_property enabled true $TYPE_TDL_11
	} else {
		set_property enabled false $TYPE_TDL_11
	}
}

proc validate_PARAM_VALUE.TYPE_TDL_11 { PARAM_VALUE.TYPE_TDL_11 } {
	# Procedure called to validate TYPE_TDL_11
	return true
}

proc update_PARAM_VALUE.TYPE_TDL_12 { PARAM_VALUE.TYPE_TDL_12 PARAM_VALUE.NUMBER_OF_CARRY_CHAINS } {
	# Procedure called to update TYPE_TDL_12 when any of the dependent parameters in the arguments change
	
	set TYPE_TDL_12 ${PARAM_VALUE.TYPE_TDL_12}
	set NUMBER_OF_CARRY_CHAINS ${PARAM_VALUE.NUMBER_OF_CARRY_CHAINS}
	set values(NUMBER_OF_CARRY_CHAINS) [get_property value $NUMBER_OF_CARRY_CHAINS]
	if { [gen_USERPARAMETER_TYPE_TDL_12_ENABLEMENT $values(NUMBER_OF_CARRY_CHAINS)] } {
		set_property enabled true $TYPE_TDL_12
	} else {
		set_property enabled false $TYPE_TDL_12
	}
}

proc validate_PARAM_VALUE.TYPE_TDL_12 { PARAM_VALUE.TYPE_TDL_12 } {
	# Procedure called to validate TYPE_TDL_12
	return true
}

proc update_PARAM_VALUE.TYPE_TDL_13 { PARAM_VALUE.TYPE_TDL_13 PARAM_VALUE.NUMBER_OF_CARRY_CHAINS } {
	# Procedure called to update TYPE_TDL_13 when any of the dependent parameters in the arguments change
	
	set TYPE_TDL_13 ${PARAM_VALUE.TYPE_TDL_13}
	set NUMBER_OF_CARRY_CHAINS ${PARAM_VALUE.NUMBER_OF_CARRY_CHAINS}
	set values(NUMBER_OF_CARRY_CHAINS) [get_property value $NUMBER_OF_CARRY_CHAINS]
	if { [gen_USERPARAMETER_TYPE_TDL_13_ENABLEMENT $values(NUMBER_OF_CARRY_CHAINS)] } {
		set_property enabled true $TYPE_TDL_13
	} else {
		set_property enabled false $TYPE_TDL_13
	}
}

proc validate_PARAM_VALUE.TYPE_TDL_13 { PARAM_VALUE.TYPE_TDL_13 } {
	# Procedure called to validate TYPE_TDL_13
	return true
}

proc update_PARAM_VALUE.TYPE_TDL_14 { PARAM_VALUE.TYPE_TDL_14 PARAM_VALUE.NUMBER_OF_CARRY_CHAINS } {
	# Procedure called to update TYPE_TDL_14 when any of the dependent parameters in the arguments change
	
	set TYPE_TDL_14 ${PARAM_VALUE.TYPE_TDL_14}
	set NUMBER_OF_CARRY_CHAINS ${PARAM_VALUE.NUMBER_OF_CARRY_CHAINS}
	set values(NUMBER_OF_CARRY_CHAINS) [get_property value $NUMBER_OF_CARRY_CHAINS]
	if { [gen_USERPARAMETER_TYPE_TDL_14_ENABLEMENT $values(NUMBER_OF_CARRY_CHAINS)] } {
		set_property enabled true $TYPE_TDL_14
	} else {
		set_property enabled false $TYPE_TDL_14
	}
}

proc validate_PARAM_VALUE.TYPE_TDL_14 { PARAM_VALUE.TYPE_TDL_14 } {
	# Procedure called to validate TYPE_TDL_14
	return true
}

proc update_PARAM_VALUE.TYPE_TDL_15 { PARAM_VALUE.TYPE_TDL_15 PARAM_VALUE.NUMBER_OF_CARRY_CHAINS } {
	# Procedure called to update TYPE_TDL_15 when any of the dependent parameters in the arguments change
	
	set TYPE_TDL_15 ${PARAM_VALUE.TYPE_TDL_15}
	set NUMBER_OF_CARRY_CHAINS ${PARAM_VALUE.NUMBER_OF_CARRY_CHAINS}
	set values(NUMBER_OF_CARRY_CHAINS) [get_property value $NUMBER_OF_CARRY_CHAINS]
	if { [gen_USERPARAMETER_TYPE_TDL_15_ENABLEMENT $values(NUMBER_OF_CARRY_CHAINS)] } {
		set_property enabled true $TYPE_TDL_15
	} else {
		set_property enabled false $TYPE_TDL_15
	}
}

proc validate_PARAM_VALUE.TYPE_TDL_15 { PARAM_VALUE.TYPE_TDL_15 } {
	# Procedure called to validate TYPE_TDL_15
	return true
}

proc update_PARAM_VALUE.TYPE_TDL_2 { PARAM_VALUE.TYPE_TDL_2 PARAM_VALUE.NUMBER_OF_CARRY_CHAINS } {
	# Procedure called to update TYPE_TDL_2 when any of the dependent parameters in the arguments change
	
	set TYPE_TDL_2 ${PARAM_VALUE.TYPE_TDL_2}
	set NUMBER_OF_CARRY_CHAINS ${PARAM_VALUE.NUMBER_OF_CARRY_CHAINS}
	set values(NUMBER_OF_CARRY_CHAINS) [get_property value $NUMBER_OF_CARRY_CHAINS]
	if { [gen_USERPARAMETER_TYPE_TDL_2_ENABLEMENT $values(NUMBER_OF_CARRY_CHAINS)] } {
		set_property enabled true $TYPE_TDL_2
	} else {
		set_property enabled false $TYPE_TDL_2
	}
}

proc validate_PARAM_VALUE.TYPE_TDL_2 { PARAM_VALUE.TYPE_TDL_2 } {
	# Procedure called to validate TYPE_TDL_2
	return true
}

proc update_PARAM_VALUE.TYPE_TDL_3 { PARAM_VALUE.TYPE_TDL_3 PARAM_VALUE.NUMBER_OF_CARRY_CHAINS } {
	# Procedure called to update TYPE_TDL_3 when any of the dependent parameters in the arguments change
	
	set TYPE_TDL_3 ${PARAM_VALUE.TYPE_TDL_3}
	set NUMBER_OF_CARRY_CHAINS ${PARAM_VALUE.NUMBER_OF_CARRY_CHAINS}
	set values(NUMBER_OF_CARRY_CHAINS) [get_property value $NUMBER_OF_CARRY_CHAINS]
	if { [gen_USERPARAMETER_TYPE_TDL_3_ENABLEMENT $values(NUMBER_OF_CARRY_CHAINS)] } {
		set_property enabled true $TYPE_TDL_3
	} else {
		set_property enabled false $TYPE_TDL_3
	}
}

proc validate_PARAM_VALUE.TYPE_TDL_3 { PARAM_VALUE.TYPE_TDL_3 } {
	# Procedure called to validate TYPE_TDL_3
	return true
}

proc update_PARAM_VALUE.TYPE_TDL_4 { PARAM_VALUE.TYPE_TDL_4 PARAM_VALUE.NUMBER_OF_CARRY_CHAINS } {
	# Procedure called to update TYPE_TDL_4 when any of the dependent parameters in the arguments change
	
	set TYPE_TDL_4 ${PARAM_VALUE.TYPE_TDL_4}
	set NUMBER_OF_CARRY_CHAINS ${PARAM_VALUE.NUMBER_OF_CARRY_CHAINS}
	set values(NUMBER_OF_CARRY_CHAINS) [get_property value $NUMBER_OF_CARRY_CHAINS]
	if { [gen_USERPARAMETER_TYPE_TDL_4_ENABLEMENT $values(NUMBER_OF_CARRY_CHAINS)] } {
		set_property enabled true $TYPE_TDL_4
	} else {
		set_property enabled false $TYPE_TDL_4
	}
}

proc validate_PARAM_VALUE.TYPE_TDL_4 { PARAM_VALUE.TYPE_TDL_4 } {
	# Procedure called to validate TYPE_TDL_4
	return true
}

proc update_PARAM_VALUE.TYPE_TDL_5 { PARAM_VALUE.TYPE_TDL_5 PARAM_VALUE.NUMBER_OF_CARRY_CHAINS } {
	# Procedure called to update TYPE_TDL_5 when any of the dependent parameters in the arguments change
	
	set TYPE_TDL_5 ${PARAM_VALUE.TYPE_TDL_5}
	set NUMBER_OF_CARRY_CHAINS ${PARAM_VALUE.NUMBER_OF_CARRY_CHAINS}
	set values(NUMBER_OF_CARRY_CHAINS) [get_property value $NUMBER_OF_CARRY_CHAINS]
	if { [gen_USERPARAMETER_TYPE_TDL_5_ENABLEMENT $values(NUMBER_OF_CARRY_CHAINS)] } {
		set_property enabled true $TYPE_TDL_5
	} else {
		set_property enabled false $TYPE_TDL_5
	}
}

proc validate_PARAM_VALUE.TYPE_TDL_5 { PARAM_VALUE.TYPE_TDL_5 } {
	# Procedure called to validate TYPE_TDL_5
	return true
}

proc update_PARAM_VALUE.TYPE_TDL_6 { PARAM_VALUE.TYPE_TDL_6 PARAM_VALUE.NUMBER_OF_CARRY_CHAINS } {
	# Procedure called to update TYPE_TDL_6 when any of the dependent parameters in the arguments change
	
	set TYPE_TDL_6 ${PARAM_VALUE.TYPE_TDL_6}
	set NUMBER_OF_CARRY_CHAINS ${PARAM_VALUE.NUMBER_OF_CARRY_CHAINS}
	set values(NUMBER_OF_CARRY_CHAINS) [get_property value $NUMBER_OF_CARRY_CHAINS]
	if { [gen_USERPARAMETER_TYPE_TDL_6_ENABLEMENT $values(NUMBER_OF_CARRY_CHAINS)] } {
		set_property enabled true $TYPE_TDL_6
	} else {
		set_property enabled false $TYPE_TDL_6
	}
}

proc validate_PARAM_VALUE.TYPE_TDL_6 { PARAM_VALUE.TYPE_TDL_6 } {
	# Procedure called to validate TYPE_TDL_6
	return true
}

proc update_PARAM_VALUE.TYPE_TDL_7 { PARAM_VALUE.TYPE_TDL_7 PARAM_VALUE.NUMBER_OF_CARRY_CHAINS } {
	# Procedure called to update TYPE_TDL_7 when any of the dependent parameters in the arguments change
	
	set TYPE_TDL_7 ${PARAM_VALUE.TYPE_TDL_7}
	set NUMBER_OF_CARRY_CHAINS ${PARAM_VALUE.NUMBER_OF_CARRY_CHAINS}
	set values(NUMBER_OF_CARRY_CHAINS) [get_property value $NUMBER_OF_CARRY_CHAINS]
	if { [gen_USERPARAMETER_TYPE_TDL_7_ENABLEMENT $values(NUMBER_OF_CARRY_CHAINS)] } {
		set_property enabled true $TYPE_TDL_7
	} else {
		set_property enabled false $TYPE_TDL_7
	}
}

proc validate_PARAM_VALUE.TYPE_TDL_7 { PARAM_VALUE.TYPE_TDL_7 } {
	# Procedure called to validate TYPE_TDL_7
	return true
}

proc update_PARAM_VALUE.TYPE_TDL_8 { PARAM_VALUE.TYPE_TDL_8 PARAM_VALUE.NUMBER_OF_CARRY_CHAINS } {
	# Procedure called to update TYPE_TDL_8 when any of the dependent parameters in the arguments change
	
	set TYPE_TDL_8 ${PARAM_VALUE.TYPE_TDL_8}
	set NUMBER_OF_CARRY_CHAINS ${PARAM_VALUE.NUMBER_OF_CARRY_CHAINS}
	set values(NUMBER_OF_CARRY_CHAINS) [get_property value $NUMBER_OF_CARRY_CHAINS]
	if { [gen_USERPARAMETER_TYPE_TDL_8_ENABLEMENT $values(NUMBER_OF_CARRY_CHAINS)] } {
		set_property enabled true $TYPE_TDL_8
	} else {
		set_property enabled false $TYPE_TDL_8
	}
}

proc validate_PARAM_VALUE.TYPE_TDL_8 { PARAM_VALUE.TYPE_TDL_8 } {
	# Procedure called to validate TYPE_TDL_8
	return true
}

proc update_PARAM_VALUE.TYPE_TDL_9 { PARAM_VALUE.TYPE_TDL_9 PARAM_VALUE.NUMBER_OF_CARRY_CHAINS } {
	# Procedure called to update TYPE_TDL_9 when any of the dependent parameters in the arguments change
	
	set TYPE_TDL_9 ${PARAM_VALUE.TYPE_TDL_9}
	set NUMBER_OF_CARRY_CHAINS ${PARAM_VALUE.NUMBER_OF_CARRY_CHAINS}
	set values(NUMBER_OF_CARRY_CHAINS) [get_property value $NUMBER_OF_CARRY_CHAINS]
	if { [gen_USERPARAMETER_TYPE_TDL_9_ENABLEMENT $values(NUMBER_OF_CARRY_CHAINS)] } {
		set_property enabled true $TYPE_TDL_9
	} else {
		set_property enabled false $TYPE_TDL_9
	}
}

proc validate_PARAM_VALUE.TYPE_TDL_9 { PARAM_VALUE.TYPE_TDL_9 } {
	# Procedure called to validate TYPE_TDL_9
	return true
}

proc update_PARAM_VALUE.BIT_SMP_PRE_TDL { PARAM_VALUE.BIT_SMP_PRE_TDL } {
	# Procedure called to update BIT_SMP_PRE_TDL when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.BIT_SMP_PRE_TDL { PARAM_VALUE.BIT_SMP_PRE_TDL } {
	# Procedure called to validate BIT_SMP_PRE_TDL
	return true
}

proc update_PARAM_VALUE.BIT_SMP_TDL { PARAM_VALUE.BIT_SMP_TDL } {
	# Procedure called to update BIT_SMP_TDL when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.BIT_SMP_TDL { PARAM_VALUE.BIT_SMP_TDL } {
	# Procedure called to validate BIT_SMP_TDL
	return true
}

proc update_PARAM_VALUE.BUFFERING_STAGE { PARAM_VALUE.BUFFERING_STAGE } {
	# Procedure called to update BUFFERING_STAGE when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.BUFFERING_STAGE { PARAM_VALUE.BUFFERING_STAGE } {
	# Procedure called to validate BUFFERING_STAGE
	return true
}

proc update_PARAM_VALUE.DEBUG_MODE { PARAM_VALUE.DEBUG_MODE } {
	# Procedure called to update DEBUG_MODE when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.DEBUG_MODE { PARAM_VALUE.DEBUG_MODE } {
	# Procedure called to validate DEBUG_MODE
	return true
}

proc update_PARAM_VALUE.NUMBER_OF_CARRY_CHAINS { PARAM_VALUE.NUMBER_OF_CARRY_CHAINS } {
	# Procedure called to update NUMBER_OF_CARRY_CHAINS when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.NUMBER_OF_CARRY_CHAINS { PARAM_VALUE.NUMBER_OF_CARRY_CHAINS } {
	# Procedure called to validate NUMBER_OF_CARRY_CHAINS
	return true
}

proc update_PARAM_VALUE.NUMBER_OF_DSP_CHAINS { PARAM_VALUE.NUMBER_OF_DSP_CHAINS } {
	# Procedure called to update NUMBER_OF_DSP_CHAINS when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.NUMBER_OF_DSP_CHAINS { PARAM_VALUE.NUMBER_OF_DSP_CHAINS } {
	# Procedure called to validate NUMBER_OF_DSP_CHAINS
	return true
}

proc update_PARAM_VALUE.NUM_TAP_PRE_TDL { PARAM_VALUE.NUM_TAP_PRE_TDL } {
	# Procedure called to update NUM_TAP_PRE_TDL when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.NUM_TAP_PRE_TDL { PARAM_VALUE.NUM_TAP_PRE_TDL } {
	# Procedure called to validate NUM_TAP_PRE_TDL
	return true
}

proc update_PARAM_VALUE.NUM_TAP_TDL { PARAM_VALUE.NUM_TAP_TDL } {
	# Procedure called to update NUM_TAP_TDL when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.NUM_TAP_TDL { PARAM_VALUE.NUM_TAP_TDL } {
	# Procedure called to validate NUM_TAP_TDL
	return true
}

proc update_PARAM_VALUE.SIM_VS_IMP { PARAM_VALUE.SIM_VS_IMP } {
	# Procedure called to update SIM_VS_IMP when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.SIM_VS_IMP { PARAM_VALUE.SIM_VS_IMP } {
	# Procedure called to validate SIM_VS_IMP
	return true
}

proc update_PARAM_VALUE.VALID_NUMBER_OF_TDL_INIT { PARAM_VALUE.VALID_NUMBER_OF_TDL_INIT } {
	# Procedure called to update VALID_NUMBER_OF_TDL_INIT when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.VALID_NUMBER_OF_TDL_INIT { PARAM_VALUE.VALID_NUMBER_OF_TDL_INIT } {
	# Procedure called to validate VALID_NUMBER_OF_TDL_INIT
	return true
}

proc update_PARAM_VALUE.VALID_POSITION_TAP_INIT { PARAM_VALUE.VALID_POSITION_TAP_INIT } {
	# Procedure called to update VALID_POSITION_TAP_INIT when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.VALID_POSITION_TAP_INIT { PARAM_VALUE.VALID_POSITION_TAP_INIT } {
	# Procedure called to validate VALID_POSITION_TAP_INIT
	return true
}

proc update_PARAM_VALUE.XUS_VS_X7S { PARAM_VALUE.XUS_VS_X7S } {
	# Procedure called to update XUS_VS_X7S when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.XUS_VS_X7S { PARAM_VALUE.XUS_VS_X7S } {
	# Procedure called to validate XUS_VS_X7S
	return true
}


proc update_MODELPARAM_VALUE.XUS_VS_X7S { MODELPARAM_VALUE.XUS_VS_X7S PARAM_VALUE.XUS_VS_X7S } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.XUS_VS_X7S}] ${MODELPARAM_VALUE.XUS_VS_X7S}
}

proc update_MODELPARAM_VALUE.TYPE_TDL_0 { MODELPARAM_VALUE.TYPE_TDL_0 PARAM_VALUE.TYPE_TDL_0 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.TYPE_TDL_0}] ${MODELPARAM_VALUE.TYPE_TDL_0}
}

proc update_MODELPARAM_VALUE.TYPE_TDL_1 { MODELPARAM_VALUE.TYPE_TDL_1 PARAM_VALUE.TYPE_TDL_1 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.TYPE_TDL_1}] ${MODELPARAM_VALUE.TYPE_TDL_1}
}

proc update_MODELPARAM_VALUE.TYPE_TDL_2 { MODELPARAM_VALUE.TYPE_TDL_2 PARAM_VALUE.TYPE_TDL_2 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.TYPE_TDL_2}] ${MODELPARAM_VALUE.TYPE_TDL_2}
}

proc update_MODELPARAM_VALUE.TYPE_TDL_3 { MODELPARAM_VALUE.TYPE_TDL_3 PARAM_VALUE.TYPE_TDL_3 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.TYPE_TDL_3}] ${MODELPARAM_VALUE.TYPE_TDL_3}
}

proc update_MODELPARAM_VALUE.TYPE_TDL_4 { MODELPARAM_VALUE.TYPE_TDL_4 PARAM_VALUE.TYPE_TDL_4 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.TYPE_TDL_4}] ${MODELPARAM_VALUE.TYPE_TDL_4}
}

proc update_MODELPARAM_VALUE.TYPE_TDL_5 { MODELPARAM_VALUE.TYPE_TDL_5 PARAM_VALUE.TYPE_TDL_5 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.TYPE_TDL_5}] ${MODELPARAM_VALUE.TYPE_TDL_5}
}

proc update_MODELPARAM_VALUE.TYPE_TDL_6 { MODELPARAM_VALUE.TYPE_TDL_6 PARAM_VALUE.TYPE_TDL_6 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.TYPE_TDL_6}] ${MODELPARAM_VALUE.TYPE_TDL_6}
}

proc update_MODELPARAM_VALUE.TYPE_TDL_7 { MODELPARAM_VALUE.TYPE_TDL_7 PARAM_VALUE.TYPE_TDL_7 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.TYPE_TDL_7}] ${MODELPARAM_VALUE.TYPE_TDL_7}
}

proc update_MODELPARAM_VALUE.TYPE_TDL_8 { MODELPARAM_VALUE.TYPE_TDL_8 PARAM_VALUE.TYPE_TDL_8 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.TYPE_TDL_8}] ${MODELPARAM_VALUE.TYPE_TDL_8}
}

proc update_MODELPARAM_VALUE.TYPE_TDL_9 { MODELPARAM_VALUE.TYPE_TDL_9 PARAM_VALUE.TYPE_TDL_9 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.TYPE_TDL_9}] ${MODELPARAM_VALUE.TYPE_TDL_9}
}

proc update_MODELPARAM_VALUE.TYPE_TDL_10 { MODELPARAM_VALUE.TYPE_TDL_10 PARAM_VALUE.TYPE_TDL_10 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.TYPE_TDL_10}] ${MODELPARAM_VALUE.TYPE_TDL_10}
}

proc update_MODELPARAM_VALUE.TYPE_TDL_11 { MODELPARAM_VALUE.TYPE_TDL_11 PARAM_VALUE.TYPE_TDL_11 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.TYPE_TDL_11}] ${MODELPARAM_VALUE.TYPE_TDL_11}
}

proc update_MODELPARAM_VALUE.TYPE_TDL_12 { MODELPARAM_VALUE.TYPE_TDL_12 PARAM_VALUE.TYPE_TDL_12 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.TYPE_TDL_12}] ${MODELPARAM_VALUE.TYPE_TDL_12}
}

proc update_MODELPARAM_VALUE.TYPE_TDL_13 { MODELPARAM_VALUE.TYPE_TDL_13 PARAM_VALUE.TYPE_TDL_13 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.TYPE_TDL_13}] ${MODELPARAM_VALUE.TYPE_TDL_13}
}

proc update_MODELPARAM_VALUE.TYPE_TDL_14 { MODELPARAM_VALUE.TYPE_TDL_14 PARAM_VALUE.TYPE_TDL_14 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.TYPE_TDL_14}] ${MODELPARAM_VALUE.TYPE_TDL_14}
}

proc update_MODELPARAM_VALUE.TYPE_TDL_15 { MODELPARAM_VALUE.TYPE_TDL_15 PARAM_VALUE.TYPE_TDL_15 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.TYPE_TDL_15}] ${MODELPARAM_VALUE.TYPE_TDL_15}
}

proc update_MODELPARAM_VALUE.DEBUG_MODE { MODELPARAM_VALUE.DEBUG_MODE PARAM_VALUE.DEBUG_MODE } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.DEBUG_MODE}] ${MODELPARAM_VALUE.DEBUG_MODE}
}

proc update_MODELPARAM_VALUE.SIM_VS_IMP { MODELPARAM_VALUE.SIM_VS_IMP PARAM_VALUE.SIM_VS_IMP } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.SIM_VS_IMP}] ${MODELPARAM_VALUE.SIM_VS_IMP}
}

proc update_MODELPARAM_VALUE.FILE_PATH_NAME_CO_DELAY { MODELPARAM_VALUE.FILE_PATH_NAME_CO_DELAY PARAM_VALUE.FILE_PATH_NAME_CO_DELAY } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.FILE_PATH_NAME_CO_DELAY}] ${MODELPARAM_VALUE.FILE_PATH_NAME_CO_DELAY}
}

proc update_MODELPARAM_VALUE.FILE_PATH_NAME_O_DELAY { MODELPARAM_VALUE.FILE_PATH_NAME_O_DELAY PARAM_VALUE.FILE_PATH_NAME_O_DELAY } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.FILE_PATH_NAME_O_DELAY}] ${MODELPARAM_VALUE.FILE_PATH_NAME_O_DELAY}
}

proc update_MODELPARAM_VALUE.NUMBER_OF_CARRY_CHAINS { MODELPARAM_VALUE.NUMBER_OF_CARRY_CHAINS PARAM_VALUE.NUMBER_OF_CARRY_CHAINS } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.NUMBER_OF_CARRY_CHAINS}] ${MODELPARAM_VALUE.NUMBER_OF_CARRY_CHAINS}
}

proc update_MODELPARAM_VALUE.NUMBER_OF_DSP_CHAINS { MODELPARAM_VALUE.NUMBER_OF_DSP_CHAINS PARAM_VALUE.NUMBER_OF_DSP_CHAINS } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.NUMBER_OF_DSP_CHAINS}] ${MODELPARAM_VALUE.NUMBER_OF_DSP_CHAINS}
}

proc update_MODELPARAM_VALUE.NUM_TAP_TDL { MODELPARAM_VALUE.NUM_TAP_TDL PARAM_VALUE.NUM_TAP_TDL } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.NUM_TAP_TDL}] ${MODELPARAM_VALUE.NUM_TAP_TDL}
}

proc update_MODELPARAM_VALUE.BUFFERING_STAGE { MODELPARAM_VALUE.BUFFERING_STAGE PARAM_VALUE.BUFFERING_STAGE } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.BUFFERING_STAGE}] ${MODELPARAM_VALUE.BUFFERING_STAGE}
}

proc update_MODELPARAM_VALUE.MIN_VALID_TAP_POS { MODELPARAM_VALUE.MIN_VALID_TAP_POS PARAM_VALUE.MIN_VALID_TAP_POS } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.MIN_VALID_TAP_POS}] ${MODELPARAM_VALUE.MIN_VALID_TAP_POS}
}

proc update_MODELPARAM_VALUE.STEP_VALID_TAP_POS { MODELPARAM_VALUE.STEP_VALID_TAP_POS PARAM_VALUE.STEP_VALID_TAP_POS } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.STEP_VALID_TAP_POS}] ${MODELPARAM_VALUE.STEP_VALID_TAP_POS}
}

proc update_MODELPARAM_VALUE.MAX_VALID_TAP_POS { MODELPARAM_VALUE.MAX_VALID_TAP_POS PARAM_VALUE.MAX_VALID_TAP_POS } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.MAX_VALID_TAP_POS}] ${MODELPARAM_VALUE.MAX_VALID_TAP_POS}
}

proc update_MODELPARAM_VALUE.VALID_POSITION_TAP_INIT { MODELPARAM_VALUE.VALID_POSITION_TAP_INIT PARAM_VALUE.VALID_POSITION_TAP_INIT } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.VALID_POSITION_TAP_INIT}] ${MODELPARAM_VALUE.VALID_POSITION_TAP_INIT}
}

proc update_MODELPARAM_VALUE.VALID_NUMBER_OF_TDL_INIT { MODELPARAM_VALUE.VALID_NUMBER_OF_TDL_INIT PARAM_VALUE.VALID_NUMBER_OF_TDL_INIT } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.VALID_NUMBER_OF_TDL_INIT}] ${MODELPARAM_VALUE.VALID_NUMBER_OF_TDL_INIT}
}

proc update_MODELPARAM_VALUE.OFFSET_TAP_TDL_0 { MODELPARAM_VALUE.OFFSET_TAP_TDL_0 PARAM_VALUE.OFFSET_TAP_TDL_0 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.OFFSET_TAP_TDL_0}] ${MODELPARAM_VALUE.OFFSET_TAP_TDL_0}
}

proc update_MODELPARAM_VALUE.OFFSET_TAP_TDL_1 { MODELPARAM_VALUE.OFFSET_TAP_TDL_1 PARAM_VALUE.OFFSET_TAP_TDL_1 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.OFFSET_TAP_TDL_1}] ${MODELPARAM_VALUE.OFFSET_TAP_TDL_1}
}

proc update_MODELPARAM_VALUE.OFFSET_TAP_TDL_2 { MODELPARAM_VALUE.OFFSET_TAP_TDL_2 PARAM_VALUE.OFFSET_TAP_TDL_2 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.OFFSET_TAP_TDL_2}] ${MODELPARAM_VALUE.OFFSET_TAP_TDL_2}
}

proc update_MODELPARAM_VALUE.OFFSET_TAP_TDL_3 { MODELPARAM_VALUE.OFFSET_TAP_TDL_3 PARAM_VALUE.OFFSET_TAP_TDL_3 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.OFFSET_TAP_TDL_3}] ${MODELPARAM_VALUE.OFFSET_TAP_TDL_3}
}

proc update_MODELPARAM_VALUE.OFFSET_TAP_TDL_4 { MODELPARAM_VALUE.OFFSET_TAP_TDL_4 PARAM_VALUE.OFFSET_TAP_TDL_4 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.OFFSET_TAP_TDL_4}] ${MODELPARAM_VALUE.OFFSET_TAP_TDL_4}
}

proc update_MODELPARAM_VALUE.OFFSET_TAP_TDL_5 { MODELPARAM_VALUE.OFFSET_TAP_TDL_5 PARAM_VALUE.OFFSET_TAP_TDL_5 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.OFFSET_TAP_TDL_5}] ${MODELPARAM_VALUE.OFFSET_TAP_TDL_5}
}

proc update_MODELPARAM_VALUE.OFFSET_TAP_TDL_6 { MODELPARAM_VALUE.OFFSET_TAP_TDL_6 PARAM_VALUE.OFFSET_TAP_TDL_6 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.OFFSET_TAP_TDL_6}] ${MODELPARAM_VALUE.OFFSET_TAP_TDL_6}
}

proc update_MODELPARAM_VALUE.OFFSET_TAP_TDL_7 { MODELPARAM_VALUE.OFFSET_TAP_TDL_7 PARAM_VALUE.OFFSET_TAP_TDL_7 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.OFFSET_TAP_TDL_7}] ${MODELPARAM_VALUE.OFFSET_TAP_TDL_7}
}

proc update_MODELPARAM_VALUE.OFFSET_TAP_TDL_8 { MODELPARAM_VALUE.OFFSET_TAP_TDL_8 PARAM_VALUE.OFFSET_TAP_TDL_8 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.OFFSET_TAP_TDL_8}] ${MODELPARAM_VALUE.OFFSET_TAP_TDL_8}
}

proc update_MODELPARAM_VALUE.OFFSET_TAP_TDL_9 { MODELPARAM_VALUE.OFFSET_TAP_TDL_9 PARAM_VALUE.OFFSET_TAP_TDL_9 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.OFFSET_TAP_TDL_9}] ${MODELPARAM_VALUE.OFFSET_TAP_TDL_9}
}

proc update_MODELPARAM_VALUE.OFFSET_TAP_TDL_10 { MODELPARAM_VALUE.OFFSET_TAP_TDL_10 PARAM_VALUE.OFFSET_TAP_TDL_10 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.OFFSET_TAP_TDL_10}] ${MODELPARAM_VALUE.OFFSET_TAP_TDL_10}
}

proc update_MODELPARAM_VALUE.OFFSET_TAP_TDL_11 { MODELPARAM_VALUE.OFFSET_TAP_TDL_11 PARAM_VALUE.OFFSET_TAP_TDL_11 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.OFFSET_TAP_TDL_11}] ${MODELPARAM_VALUE.OFFSET_TAP_TDL_11}
}

proc update_MODELPARAM_VALUE.OFFSET_TAP_TDL_12 { MODELPARAM_VALUE.OFFSET_TAP_TDL_12 PARAM_VALUE.OFFSET_TAP_TDL_12 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.OFFSET_TAP_TDL_12}] ${MODELPARAM_VALUE.OFFSET_TAP_TDL_12}
}

proc update_MODELPARAM_VALUE.OFFSET_TAP_TDL_13 { MODELPARAM_VALUE.OFFSET_TAP_TDL_13 PARAM_VALUE.OFFSET_TAP_TDL_13 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.OFFSET_TAP_TDL_13}] ${MODELPARAM_VALUE.OFFSET_TAP_TDL_13}
}

proc update_MODELPARAM_VALUE.OFFSET_TAP_TDL_14 { MODELPARAM_VALUE.OFFSET_TAP_TDL_14 PARAM_VALUE.OFFSET_TAP_TDL_14 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.OFFSET_TAP_TDL_14}] ${MODELPARAM_VALUE.OFFSET_TAP_TDL_14}
}

proc update_MODELPARAM_VALUE.OFFSET_TAP_TDL_15 { MODELPARAM_VALUE.OFFSET_TAP_TDL_15 PARAM_VALUE.OFFSET_TAP_TDL_15 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.OFFSET_TAP_TDL_15}] ${MODELPARAM_VALUE.OFFSET_TAP_TDL_15}
}

proc update_MODELPARAM_VALUE.BIT_SMP_TDL { MODELPARAM_VALUE.BIT_SMP_TDL PARAM_VALUE.BIT_SMP_TDL } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.BIT_SMP_TDL}] ${MODELPARAM_VALUE.BIT_SMP_TDL}
}

proc update_MODELPARAM_VALUE.NUM_TAP_PRE_TDL { MODELPARAM_VALUE.NUM_TAP_PRE_TDL PARAM_VALUE.NUM_TAP_PRE_TDL } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.NUM_TAP_PRE_TDL}] ${MODELPARAM_VALUE.NUM_TAP_PRE_TDL}
}

proc update_MODELPARAM_VALUE.BIT_SMP_PRE_TDL { MODELPARAM_VALUE.BIT_SMP_PRE_TDL PARAM_VALUE.BIT_SMP_PRE_TDL } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.BIT_SMP_PRE_TDL}] ${MODELPARAM_VALUE.BIT_SMP_PRE_TDL}
}

