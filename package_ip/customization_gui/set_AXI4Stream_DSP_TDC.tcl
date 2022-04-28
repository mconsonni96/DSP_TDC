proc update_PARAM_VALUE.X7S_VS_XUS { PARAM_VALUE.X7S_VS_XUS } {
	# Procedure called to update X7S_VS_XUS when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.X7S_VS_XUS { PARAM_VALUE.X7S_VS_XUS } {
	# Procedure called to validate X7S_VS_XUS
	return true
}


proc update_MODELPARAM_VALUE.X7S_VS_XUS { MODELPARAM_VALUE.X7S_VS_XUS PARAM_VALUE.X7S_VS_XUS } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.X7S_VS_XUS}] ${MODELPARAM_VALUE.X7S_VS_XUS}
}



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




proc update_PARAM_VALUE.BIT_SMP_TDL { PARAM_VALUE.BIT_SMP_TDL } {
	# Procedure called to update BIT_SMP_TDL when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.BIT_SMP_TDL { PARAM_VALUE.BIT_SMP_TDL } {
	# Procedure called to validate BIT_SMP_TDL
	return true
}

proc update_MODELPARAM_VALUE.BIT_SMP_TDL { MODELPARAM_VALUE.BIT_SMP_TDL PARAM_VALUE.BIT_SMP_TDL } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.BIT_SMP_TDL}] ${MODELPARAM_VALUE.BIT_SMP_TDL}
}




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




proc update_PARAM_VALUE.BIT_SMP_PRE_TDL { PARAM_VALUE.BIT_SMP_PRE_TDL } {
	# Procedure called to update BIT_SMP_PRE_TDL when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.BIT_SMP_PRE_TDL { PARAM_VALUE.BIT_SMP_PRE_TDL } {
	# Procedure called to validate BIT_SMP_PRE_TDL
	return true
}

proc update_MODELPARAM_VALUE.BIT_SMP_PRE_TDL { MODELPARAM_VALUE.BIT_SMP_PRE_TDL PARAM_VALUE.BIT_SMP_PRE_TDL } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.BIT_SMP_PRE_TDL}] ${MODELPARAM_VALUE.BIT_SMP_PRE_TDL}
}




proc update_PARAM_VALUE.VALID_NUMBER_OF_TDL_INIT { PARAM_VALUE.VALID_NUMBER_OF_TDL_INIT } {
	# Procedure called to update VALID_NUMBER_OF_TDL_INIT when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.VALID_NUMBER_OF_TDL_INIT { PARAM_VALUE.VALID_NUMBER_OF_TDL_INIT } {
	# Procedure called to validate VALID_NUMBER_OF_TDL_INIT
	return true
}

proc update_MODELPARAM_VALUE.VALID_NUMBER_OF_TDL_INIT { MODELPARAM_VALUE.VALID_NUMBER_OF_TDL_INIT PARAM_VALUE.VALID_NUMBER_OF_TDL_INIT } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.VALID_NUMBER_OF_TDL_INIT}] ${MODELPARAM_VALUE.VALID_NUMBER_OF_TDL_INIT}
}




proc update_PARAM_VALUE.VALID_POSITION_TAP_INIT { PARAM_VALUE.VALID_POSITION_TAP_INIT } {
	# Procedure called to update VALID_POSITION_TAP_INIT when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.VALID_POSITION_TAP_INIT { PARAM_VALUE.VALID_POSITION_TAP_INIT } {
	# Procedure called to validate VALID_POSITION_TAP_INIT
	return true
}

proc update_MODELPARAM_VALUE.VALID_POSITION_TAP_INIT { MODELPARAM_VALUE.VALID_POSITION_TAP_INIT PARAM_VALUE.VALID_POSITION_TAP_INIT } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.VALID_POSITION_TAP_INIT}] ${MODELPARAM_VALUE.VALID_POSITION_TAP_INIT}
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

proc update_MODELPARAM_VALUE.MAX_VALID_TAP_POS { MODELPARAM_VALUE.MAX_VALID_TAP_POS PARAM_VALUE.MAX_VALID_TAP_POS } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.MAX_VALID_TAP_POS}] ${MODELPARAM_VALUE.MAX_VALID_TAP_POS}
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

proc update_MODELPARAM_VALUE.MIN_VALID_TAP_POS { MODELPARAM_VALUE.MIN_VALID_TAP_POS PARAM_VALUE.MIN_VALID_TAP_POS } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.MIN_VALID_TAP_POS}] ${MODELPARAM_VALUE.MIN_VALID_TAP_POS}
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

proc update_MODELPARAM_VALUE.STEP_VALID_TAP_POS { MODELPARAM_VALUE.STEP_VALID_TAP_POS PARAM_VALUE.STEP_VALID_TAP_POS } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.STEP_VALID_TAP_POS}] ${MODELPARAM_VALUE.STEP_VALID_TAP_POS}
}




