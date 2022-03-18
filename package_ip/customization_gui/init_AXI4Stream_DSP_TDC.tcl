
# Definitional proc to organize widgets for parameters.
proc init_AXI4Stream_DSP_TDC_gui { IPINST Page} {

  #Adding Page
  set Page_0 [ipgui::add_page $IPINST -name $Page]
  set CASCADE_TYPE [ipgui::add_param $IPINST -name "CASCADE_TYPE" -parent ${Page_0} -widget comboBox]
  set_property tooltip {Use B or CARRY cascade} ${CASCADE_TYPE}
  set TYPE_TDL_0 [ipgui::add_param $IPINST -name "TYPE_TDL_0" -parent ${Page_0} -widget comboBox]
  set_property tooltip {Use C or O sampling} ${TYPE_TDL_0}
  set DEBUG_MODE [ipgui::add_param $IPINST -name "DEBUG_MODE" -parent ${Page_0}]
  set_property tooltip {Allow to tune in real-time the valid position for its generation} ${DEBUG_MODE}
  #Adding Group
  set TDL_Dimension [ipgui::add_group $IPINST -name "TDL Dimension" -parent ${Page_0}]
  set NUM_TAP_TDL [ipgui::add_param $IPINST -name "NUM_TAP_TDL" -parent ${TDL_Dimension}]
  set_property tooltip {Number of Taps in each TDL} ${NUM_TAP_TDL}
  set BIT_SMP_TDL [ipgui::add_param $IPINST -name "BIT_SMP_TDL" -parent ${TDL_Dimension}]
  set_property tooltip {Number of taps sampled on the TDL} ${BIT_SMP_TDL}

  #Adding Group
  set Valid_Generation [ipgui::add_group $IPINST -name "Valid Generation" -parent ${Page_0}]
  set MIN_VALID_TAP_POS [ipgui::add_param $IPINST -name "MIN_VALID_TAP_POS" -parent ${Valid_Generation}]
  set_property tooltip {Select the minimum position of the bit of sampled taps of TDL to insert in the MUX using in DEBUG for valid generation} ${MIN_VALID_TAP_POS}
  set STEP_VALID_TAP_POS [ipgui::add_param $IPINST -name "STEP_VALID_TAP_POS" -parent ${Valid_Generation}]
  set_property tooltip {Select the step between consecuteve position of the bit of sampled taps of TDL to insert in the MUX using in DEBUGle for valid generation} ${STEP_VALID_TAP_POS}
  set MAX_VALID_TAP_POS [ipgui::add_param $IPINST -name "MAX_VALID_TAP_POS" -parent ${Valid_Generation}]
  set_property tooltip {Select the maximum position of the bit of sampled taps of TDL to insert in the MUX using in DEBUG for valid generation} ${MAX_VALID_TAP_POS}
  set VALID_POSITION_TAP_INIT [ipgui::add_param $IPINST -name "VALID_POSITION_TAP_INIT" -parent ${Valid_Generation}]
  set_property tooltip {Select the tap position for the valid (if TDL Debug FALSE) or initalize the position (if TDL Debug TRUE)} ${VALID_POSITION_TAP_INIT}



}

