
# Definitional proc to organize widgets for parameters.
proc init_AXI4Stream_HybridTDL_gui { IPINST Page} {

  #Adding Page
  set Page_0 [ipgui::add_page $IPINST -name $Page]
  set XUS_VS_X7S [ipgui::add_param $IPINST -name "XUS_VS_X7S" -parent ${Page_0} -widget comboBox]
  set_property tooltip {Use TDL for Xilinx Ultrascale or 7-Series} ${XUS_VS_X7S}
  set DEBUG_MODE [ipgui::add_param $IPINST -name "DEBUG_MODE" -parent ${Page_0}]
  set_property tooltip {Allow to tune in real-time the valid position for its generation} ${DEBUG_MODE}
  set NUMBER_OF_CARRY_CHAINS [ipgui::add_param $IPINST -name "NUMBER_OF_CARRY_CHAINS" -parent ${Page_0}]
  set_property tooltip {Number of Carry chains sub-Interpolated in each TDC channel} ${NUMBER_OF_CARRY_CHAINS}
  set NUMBER_OF_DSP_CHAINS [ipgui::add_param $IPINST -name "NUMBER_OF_DSP_CHAINS" -parent ${Page_0}]
  set_property tooltip {Number of DSP chains sub-Interpolated in each TDC channel} ${NUMBER_OF_DSP_CHAINS}
  set BUFFERING_STAGE [ipgui::add_param $IPINST -name "BUFFERING_STAGE" -parent ${Page_0}]
  set_property tooltip {Insertion of a further buffering stage between TDL and decoder for bufferazing the generation of the valid} ${BUFFERING_STAGE}
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
  set MIN_VALID_TAP_POS [ipgui::add_param $IPINST -name "MIN_VALID_TAP_POS" -parent ${Valid_Generation}]
  set_property tooltip {Select the minimum position of the bit of sampled taps of TDL to insert in the MUX using in DEBUG for valid generation} ${MIN_VALID_TAP_POS}
  set STEP_VALID_TAP_POS [ipgui::add_param $IPINST -name "STEP_VALID_TAP_POS" -parent ${Valid_Generation}]
  set_property tooltip {Select the step between consecuteve position of the bit of sampled taps of TDL to insert in the MUX using in DEBUGle for valid generation} ${STEP_VALID_TAP_POS}
  set MAX_VALID_TAP_POS [ipgui::add_param $IPINST -name "MAX_VALID_TAP_POS" -parent ${Valid_Generation}]
  set_property tooltip {Select the maximum position of the bit of sampled taps of TDL to insert in the MUX using in DEBUG for valid generation} ${MAX_VALID_TAP_POS}
  set VALID_NUMBER_OF_TDL_INIT [ipgui::add_param $IPINST -name "VALID_NUMBER_OF_TDL_INIT" -parent ${Valid_Generation}]
  set_property tooltip {Select the TDL for the valid position (if TDL Debug FALSE) or initalize the TDL to choose the valid position (if TDL Debug TRUE)} ${VALID_NUMBER_OF_TDL_INIT}
  set VALID_POSITION_TAP_INIT [ipgui::add_param $IPINST -name "VALID_POSITION_TAP_INIT" -parent ${Valid_Generation}]
  set_property tooltip {Select the tap position for the valid (if TDL Debug FALSE) or initalize the position (if TDL Debug TRUE)} ${VALID_POSITION_TAP_INIT}

  #Adding Group
  set TDL [ipgui::add_group $IPINST -name "TDL" -parent ${Page_0} -layout horizontal]
  #Adding Group
  set Offset_of_TDL [ipgui::add_group $IPINST -name "Offset of TDL" -parent ${TDL}]
  set OFFSET_TAP_TDL_0 [ipgui::add_param $IPINST -name "OFFSET_TAP_TDL_0" -parent ${Offset_of_TDL}]
  set_property tooltip {Offset Between consecutive Sampled Taps over the TDL 0} ${OFFSET_TAP_TDL_0}
  set OFFSET_TAP_TDL_1 [ipgui::add_param $IPINST -name "OFFSET_TAP_TDL_1" -parent ${Offset_of_TDL}]
  set_property tooltip {Offset Between consecutive Sampled Taps over the TDL 1} ${OFFSET_TAP_TDL_1}
  set OFFSET_TAP_TDL_2 [ipgui::add_param $IPINST -name "OFFSET_TAP_TDL_2" -parent ${Offset_of_TDL}]
  set_property tooltip {Offset Between consecutive Sampled Taps over the TDL 2} ${OFFSET_TAP_TDL_2}
  set OFFSET_TAP_TDL_3 [ipgui::add_param $IPINST -name "OFFSET_TAP_TDL_3" -parent ${Offset_of_TDL}]
  set_property tooltip {Offset Between consecutive Sampled Taps over the TDL 3} ${OFFSET_TAP_TDL_3}
  set OFFSET_TAP_TDL_4 [ipgui::add_param $IPINST -name "OFFSET_TAP_TDL_4" -parent ${Offset_of_TDL}]
  set_property tooltip {Offset Between consecutive Sampled Taps over the TDL 4} ${OFFSET_TAP_TDL_4}
  set OFFSET_TAP_TDL_5 [ipgui::add_param $IPINST -name "OFFSET_TAP_TDL_5" -parent ${Offset_of_TDL}]
  set_property tooltip {Offset Between consecutive Sampled Taps over the TDL 5} ${OFFSET_TAP_TDL_5}
  set OFFSET_TAP_TDL_6 [ipgui::add_param $IPINST -name "OFFSET_TAP_TDL_6" -parent ${Offset_of_TDL}]
  set_property tooltip {Offset Between consecutive Sampled Taps over the TDL 6} ${OFFSET_TAP_TDL_6}
  set OFFSET_TAP_TDL_7 [ipgui::add_param $IPINST -name "OFFSET_TAP_TDL_7" -parent ${Offset_of_TDL}]
  set_property tooltip {Offset Between consecutive Sampled Taps over the TDL 7} ${OFFSET_TAP_TDL_7}
  set OFFSET_TAP_TDL_8 [ipgui::add_param $IPINST -name "OFFSET_TAP_TDL_8" -parent ${Offset_of_TDL}]
  set_property tooltip {Offset Between consecutive Sampled Taps over the TDL 8} ${OFFSET_TAP_TDL_8}
  set OFFSET_TAP_TDL_9 [ipgui::add_param $IPINST -name "OFFSET_TAP_TDL_9" -parent ${Offset_of_TDL}]
  set_property tooltip {Offset Between consecutive Sampled Taps over the TDL 9} ${OFFSET_TAP_TDL_9}
  set OFFSET_TAP_TDL_10 [ipgui::add_param $IPINST -name "OFFSET_TAP_TDL_10" -parent ${Offset_of_TDL}]
  set_property tooltip {Offset Between consecutive Sampled Taps over the TDL 10} ${OFFSET_TAP_TDL_10}
  set OFFSET_TAP_TDL_11 [ipgui::add_param $IPINST -name "OFFSET_TAP_TDL_11" -parent ${Offset_of_TDL}]
  set_property tooltip {Offset Between consecutive Sampled Taps over the TDL 11} ${OFFSET_TAP_TDL_11}
  set OFFSET_TAP_TDL_12 [ipgui::add_param $IPINST -name "OFFSET_TAP_TDL_12" -parent ${Offset_of_TDL}]
  set_property tooltip {Offset Between consecutive Sampled Taps over the TDL 12} ${OFFSET_TAP_TDL_12}
  set OFFSET_TAP_TDL_13 [ipgui::add_param $IPINST -name "OFFSET_TAP_TDL_13" -parent ${Offset_of_TDL}]
  set_property tooltip {Offset Between consecutive Sampled Taps over the TDL 13} ${OFFSET_TAP_TDL_13}
  set OFFSET_TAP_TDL_14 [ipgui::add_param $IPINST -name "OFFSET_TAP_TDL_14" -parent ${Offset_of_TDL}]
  set_property tooltip {Offset Between consecutive Sampled Taps over the TDL 14} ${OFFSET_TAP_TDL_14}
  set OFFSET_TAP_TDL_15 [ipgui::add_param $IPINST -name "OFFSET_TAP_TDL_15" -parent ${Offset_of_TDL}]
  set_property tooltip {Offset Between consecutive Sampled Taps over the TDL 15} ${OFFSET_TAP_TDL_15}

  #Adding Group
  set Type_of_TDL [ipgui::add_group $IPINST -name "Type of TDL" -parent ${TDL}]
  set TYPE_TDL_0 [ipgui::add_param $IPINST -name "TYPE_TDL_0" -parent ${Type_of_TDL} -widget comboBox]
  set_property tooltip {CO vs O Sampling TDL 0} ${TYPE_TDL_0}
  set TYPE_TDL_1 [ipgui::add_param $IPINST -name "TYPE_TDL_1" -parent ${Type_of_TDL} -widget comboBox]
  set_property tooltip {CO vs O Sampling TDL 1} ${TYPE_TDL_1}
  set TYPE_TDL_2 [ipgui::add_param $IPINST -name "TYPE_TDL_2" -parent ${Type_of_TDL} -widget comboBox]
  set_property tooltip {CO vs O Sampling TDL 2} ${TYPE_TDL_2}
  set TYPE_TDL_3 [ipgui::add_param $IPINST -name "TYPE_TDL_3" -parent ${Type_of_TDL} -widget comboBox]
  set_property tooltip {CO vs O Sampling TDL 3} ${TYPE_TDL_3}
  set TYPE_TDL_4 [ipgui::add_param $IPINST -name "TYPE_TDL_4" -parent ${Type_of_TDL} -widget comboBox]
  set_property tooltip {CO vs O Sampling TDL 4} ${TYPE_TDL_4}
  set TYPE_TDL_5 [ipgui::add_param $IPINST -name "TYPE_TDL_5" -parent ${Type_of_TDL} -widget comboBox]
  set_property tooltip {CO vs O Sampling TDL 5} ${TYPE_TDL_5}
  set TYPE_TDL_6 [ipgui::add_param $IPINST -name "TYPE_TDL_6" -parent ${Type_of_TDL} -widget comboBox]
  set_property tooltip {CO vs O Sampling TDL 6} ${TYPE_TDL_6}
  set TYPE_TDL_7 [ipgui::add_param $IPINST -name "TYPE_TDL_7" -parent ${Type_of_TDL} -widget comboBox]
  set_property tooltip {CO vs O Sampling TDL 7} ${TYPE_TDL_7}
  set TYPE_TDL_8 [ipgui::add_param $IPINST -name "TYPE_TDL_8" -parent ${Type_of_TDL} -widget comboBox]
  set_property tooltip {CO vs O Sampling TDL 8} ${TYPE_TDL_8}
  set TYPE_TDL_9 [ipgui::add_param $IPINST -name "TYPE_TDL_9" -parent ${Type_of_TDL} -widget comboBox]
  set_property tooltip {CO vs O Sampling TDL 9} ${TYPE_TDL_9}
  set TYPE_TDL_10 [ipgui::add_param $IPINST -name "TYPE_TDL_10" -parent ${Type_of_TDL} -widget comboBox]
  set_property tooltip {CO vs O Sampling TDL 10} ${TYPE_TDL_10}
  set TYPE_TDL_11 [ipgui::add_param $IPINST -name "TYPE_TDL_11" -parent ${Type_of_TDL} -widget comboBox]
  set_property tooltip {CO vs O Sampling TDL 11} ${TYPE_TDL_11}
  set TYPE_TDL_12 [ipgui::add_param $IPINST -name "TYPE_TDL_12" -parent ${Type_of_TDL} -widget comboBox]
  set_property tooltip {CO vs O Sampling TDL 12} ${TYPE_TDL_12}
  set TYPE_TDL_13 [ipgui::add_param $IPINST -name "TYPE_TDL_13" -parent ${Type_of_TDL} -widget comboBox]
  set_property tooltip {CO vs O Sampling TDL 13} ${TYPE_TDL_13}
  set TYPE_TDL_14 [ipgui::add_param $IPINST -name "TYPE_TDL_14" -parent ${Type_of_TDL} -widget comboBox]
  set_property tooltip {CO vs O Sampling TDL 14} ${TYPE_TDL_14}
  set TYPE_TDL_15 [ipgui::add_param $IPINST -name "TYPE_TDL_15" -parent ${Type_of_TDL} -widget comboBox]
  set_property tooltip {CO vs O Sampling TDL 15} ${TYPE_TDL_15}




}

