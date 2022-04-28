
# Loading additional proc with user specified bodies to compute parameter values.
source [file join [file dirname [file dirname [info script]]] gui/AXI4Stream_DSP_TDC_v1_0.gtcl]

# Definitional proc to organize widgets for parameters.
proc init_gui { IPINST } {
  ipgui::add_param $IPINST -name "Component_Name"
  #Adding Page
  set Page_0 [ipgui::add_page $IPINST -name "Page 0"]
  set X7S_VS_XUS [ipgui::add_param $IPINST -name "X7S_VS_XUS" -parent ${Page_0} -widget comboBox]
  set_property tooltip {Use TDL for Xilinx Xilinx 7-Series or Ultrascale} ${X7S_VS_XUS}
  set DEBUG_MODE [ipgui::add_param $IPINST -name "DEBUG_MODE" -parent ${Page_0}]
  set_property tooltip {Allow to tune in real-time the valid position for its generation} ${DEBUG_MODE}
  set NUMBER_OF_TDL [ipgui::add_param $IPINST -name "NUMBER_OF_TDL" -parent ${Page_0}]
  set_property tooltip {Number of TDL sub-Interpolated in each TDC channel} ${NUMBER_OF_TDL}
  #Adding Group
  set TDL_Dimension [ipgui::add_group $IPINST -name "TDL Dimension" -parent ${Page_0}]
  set NUM_TAP_TDL [ipgui::add_param $IPINST -name "NUM_TAP_TDL" -parent ${TDL_Dimension}]
  set_property tooltip {Number of Taps in each TDL} ${NUM_TAP_TDL}
  set BIT_SMP_TDL [ipgui::add_param $IPINST -name "BIT_SMP_TDL" -parent ${TDL_Dimension}]
  set_property tooltip {Number of taps sampled on the TDL} ${BIT_SMP_TDL}
  set NUM_TAP_PRE_TDL [ipgui::add_param $IPINST -name "NUM_TAP_PRE_TDL" -parent ${TDL_Dimension}]
  set_property tooltip {Number of Taps in each TDL} ${NUM_TAP_PRE_TDL}
  set BIT_SMP_PRE_TDL [ipgui::add_param $IPINST -name "BIT_SMP_PRE_TDL" -parent ${TDL_Dimension}]
  set_property tooltip {Number of taps sampled on the PRE-TDL} ${BIT_SMP_PRE_TDL}

  #Adding Group
  set Valid_Generation [ipgui::add_group $IPINST -name "Valid Generation" -parent ${Page_0}]
  set VALID_NUMBER_OF_TDL_INIT [ipgui::add_param $IPINST -name "VALID_NUMBER_OF_TDL_INIT" -parent ${Valid_Generation}]
  set_property tooltip {Select the TDL for the valid position (if TDL Debug FALSE) or initalize the TDL to choose the valid position (if TDL Debug TRUE)} ${VALID_NUMBER_OF_TDL_INIT}
  set VALID_POSITION_TAP_INIT [ipgui::add_param $IPINST -name "VALID_POSITION_TAP_INIT" -parent ${Valid_Generation}]
  set_property tooltip {Select the tap position for the valid (if TDL Debug FALSE) or initalize the position (if TDL Debug TRUE)} ${VALID_POSITION_TAP_INIT}
  set MIN_VALID_TAP_POS [ipgui::add_param $IPINST -name "MIN_VALID_TAP_POS" -parent ${Valid_Generation}]
  set_property tooltip {Select the minimum position of the bit of sampled taps of TDL to insert in the MUX using in DEBUG for valid generation} ${MIN_VALID_TAP_POS}
  set STEP_VALID_TAP_POS [ipgui::add_param $IPINST -name "STEP_VALID_TAP_POS" -parent ${Valid_Generation}]
  set_property tooltip {Select the step between consecuteve position of the bit of sampled taps of TDL to insert in the MUX using in DEBUGle for valid generation} ${STEP_VALID_TAP_POS}
  set MAX_VALID_TAP_POS [ipgui::add_param $IPINST -name "MAX_VALID_TAP_POS" -parent ${Valid_Generation}]
  set_property tooltip {Select the maximum position of the bit of sampled taps of TDL to insert in the MUX using in DEBUG for valid generation} ${MAX_VALID_TAP_POS}



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

proc update_PARAM_VALUE.DEBUG_MODE { PARAM_VALUE.DEBUG_MODE } {
	# Procedure called to update DEBUG_MODE when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.DEBUG_MODE { PARAM_VALUE.DEBUG_MODE } {
	# Procedure called to validate DEBUG_MODE
	return true
}

proc update_PARAM_VALUE.NUMBER_OF_TDL { PARAM_VALUE.NUMBER_OF_TDL } {
	# Procedure called to update NUMBER_OF_TDL when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.NUMBER_OF_TDL { PARAM_VALUE.NUMBER_OF_TDL } {
	# Procedure called to validate NUMBER_OF_TDL
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

proc update_MODELPARAM_VALUE.DEBUG_MODE { MODELPARAM_VALUE.DEBUG_MODE PARAM_VALUE.DEBUG_MODE } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.DEBUG_MODE}] ${MODELPARAM_VALUE.DEBUG_MODE}
}

proc update_MODELPARAM_VALUE.NUMBER_OF_TDL { MODELPARAM_VALUE.NUMBER_OF_TDL PARAM_VALUE.NUMBER_OF_TDL } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.NUMBER_OF_TDL}] ${MODELPARAM_VALUE.NUMBER_OF_TDL}
}

proc update_MODELPARAM_VALUE.NUM_TAP_TDL { MODELPARAM_VALUE.NUM_TAP_TDL PARAM_VALUE.NUM_TAP_TDL } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.NUM_TAP_TDL}] ${MODELPARAM_VALUE.NUM_TAP_TDL}
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

