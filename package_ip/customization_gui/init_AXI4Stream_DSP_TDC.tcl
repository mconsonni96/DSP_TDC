
# Definitional proc to organize widgets for parameters.
proc init_AXI4Stream_DSP_TDC_gui { IPINST Page} {

  #Adding Page
  set Page_0 [ipgui::add_page $IPINST -name $Page]
  set BUFFERING_STAGE [ipgui::add_param $IPINST -name "BUFFERING_STAGE" -parent ${Page_0}]
  set_property tooltip {Insertion of a further buffering stage between TDL and decoder for bufferazing the generation of the valid} ${BUFFERING_STAGE}
  set DEBUG_MODE [ipgui::add_param $IPINST -name "DEBUG_MODE" -parent ${Page_0}]
  set_property tooltip {Allow to tune in real-time the valid position for its generation} ${DEBUG_MODE}

  #Adding Group
  set Simulation_vs_Implementation [ipgui::add_group $IPINST -name "Simulation vs Implementation" -parent ${Page_0}]
  set_property tooltip {Simulation vs Implementation} ${Simulation_vs_Implementation}
  set SIM_VS_IMP [ipgui::add_param $IPINST -name "SIM_VS_IMP" -parent ${Simulation_vs_Implementation} -widget comboBox]
  set_property tooltip {Use TDL for simulation or primitive for implementation} ${SIM_VS_IMP}
  set FILE_PATH_NAME_CO_DELAY [ipgui::add_param $IPINST -name "FILE_PATH_NAME_CO_DELAY" -parent ${Simulation_vs_Implementation} -widget comboBox]
  set_property tooltip {CO Delay Path Used for simulated TDL} ${FILE_PATH_NAME_CO_DELAY}
  set FILE_PATH_NAME_O_DELAY [ipgui::add_param $IPINST -name "FILE_PATH_NAME_O_DELAY" -parent ${Simulation_vs_Implementation} -widget comboBox]
  set_property tooltip {O Delay Path Used for simulated TDL} ${FILE_PATH_NAME_O_DELAY}

  #Adding Group
  set TDL_Dimensions [ipgui::add_group $IPINST -name "TDL Dimensions" -parent ${Page_0}]
  set NUM_TAP_TDL [ipgui::add_param $IPINST -name "NUM_TAP_TDL" -parent ${TDL_Dimensions}]
  set_property tooltip {Number of Taps in each TDL} ${NUM_TAP_TDL}
  set NUMBER_OF_TDL [ipgui::add_param $IPINST -name "NUMBER_OF_TDL" -parent ${TDL_Dimensions}]
  set_property tooltip {Number of TDL sub-Interpolated in each TDC channel} ${NUMBER_OF_TDL}
  set BIT_SMP_TDL [ipgui::add_param $IPINST -name "BIT_SMP_TDL" -parent ${TDL_Dimensions}]
  set_property tooltip {Number of taps sampled on the TDL} ${BIT_SMP_TDL}

  set PRE_TDL_Dimensions [ipgui::add_group $IPINST -name "PRE-TDL Dimensions" -parent ${Page_0}]
  set NUM_TAP_PRE_TDL [ipgui::add_param $IPINST -name "NUM_TAP_PRE_TDL" -parent ${PRE_TDL_Dimensions}]
  set_property tooltip {Number of Taps in each TDL} ${NUM_TAP_PRE_TDL}
  set BIT_SMP_PRE_TDL [ipgui::add_param $IPINST -name "BIT_SMP_PRE_TDL"  -parent ${PRE_TDL_Dimensions}]
  set_property tooltip {Number of taps sampled on the PRE-TDL} ${BIT_SMP_PRE_TDL}

  #Adding Group
  set Valid_generation [ipgui::add_group $IPINST -name "Valid generation" -parent ${Page_0}]
  set VALID_NUMBER_OF_TDL_INIT [ipgui::add_param $IPINST -name "VALID_NUMBER_OF_TDL_INIT" -parent ${Valid_generation}]
  set_property tooltip {Select the TDL for the valid position (if TDL Debug FALSE) or initalize the TDL to choose the valid position (if TDL Debug TRUE)} ${VALID_NUMBER_OF_TDL_INIT}
  set VALID_POSITION_TAP_INIT [ipgui::add_param $IPINST -name "VALID_POSITION_TAP_INIT" -parent ${Valid_generation}]
  set_property tooltip {Select the tap position for the valid (if TDL Debug FALSE) or initalize the position (if TDL Debug TRUE)} ${VALID_POSITION_TAP_INIT}
  set MAX_VALID_TAP_POS [ipgui::add_param $IPINST -name "MAX_VALID_TAP_POS" -parent ${Valid_generation}]
  set_property tooltip {Select the maximum position of the bit of sampled taps of TDL to insert in the MUX using in DEBUG for valid generation} ${MAX_VALID_TAP_POS}
  set MIN_VALID_TAP_POS [ipgui::add_param $IPINST -name "MIN_VALID_TAP_POS" -parent ${Valid_generation}]
  set_property tooltip {Select the minimum position of the bit of sampled taps of TDL to insert in the MUX using in DEBUG for valid generation} ${MIN_VALID_TAP_POS}
  set STEP_VALID_TAP_POS [ipgui::add_param $IPINST -name "STEP_VALID_TAP_POS" -parent ${Valid_generation}]
  set_property tooltip {Select the step between consecuteve position of the bit of sampled taps of TDL to insert in the MUX using in DEBUGle for valid generation} ${STEP_VALID_TAP_POS}


  #Adding Group
  set TDL [ipgui::add_group $IPINST -name "TDL" -parent ${Page_0} -display_name {TDL Settings} -layout horizontal]
  set_property tooltip {TDL Settings} ${TDL}
  #Adding Group
  set Offset_Sampled_Tap_TDL [ipgui::add_group $IPINST -name "Offset Sampled Tap TDL" -parent ${TDL}]
  set_property tooltip {Offset Sampled Tap TDL} ${Offset_Sampled_Tap_TDL}
  set OFFSET_TAP_TDL_0 [ipgui::add_param $IPINST -name "OFFSET_TAP_TDL_0" -parent ${Offset_Sampled_Tap_TDL}]
  set_property tooltip {Offset Between consecutive Sampled Taps over the TDL 0} ${OFFSET_TAP_TDL_0}
  set OFFSET_TAP_TDL_1 [ipgui::add_param $IPINST -name "OFFSET_TAP_TDL_1" -parent ${Offset_Sampled_Tap_TDL}]
  set_property tooltip {Offset Between consecutive Sampled Taps over the TDL 1} ${OFFSET_TAP_TDL_1}
  set OFFSET_TAP_TDL_2 [ipgui::add_param $IPINST -name "OFFSET_TAP_TDL_2" -parent ${Offset_Sampled_Tap_TDL}]
  set_property tooltip {Offset Between consecutive Sampled Taps over the TDL 2} ${OFFSET_TAP_TDL_2}
  set OFFSET_TAP_TDL_3 [ipgui::add_param $IPINST -name "OFFSET_TAP_TDL_3" -parent ${Offset_Sampled_Tap_TDL}]
  set_property tooltip {Offset Between consecutive Sampled Taps over the TDL 3} ${OFFSET_TAP_TDL_3}
  set OFFSET_TAP_TDL_4 [ipgui::add_param $IPINST -name "OFFSET_TAP_TDL_4" -parent ${Offset_Sampled_Tap_TDL}]
  set_property tooltip {Offset Between consecutive Sampled Taps over the TDL 4} ${OFFSET_TAP_TDL_4}
  set OFFSET_TAP_TDL_5 [ipgui::add_param $IPINST -name "OFFSET_TAP_TDL_5" -parent ${Offset_Sampled_Tap_TDL}]
  set_property tooltip {Offset Between consecutive Sampled Taps over the TDL 5} ${OFFSET_TAP_TDL_5}
  set OFFSET_TAP_TDL_6 [ipgui::add_param $IPINST -name "OFFSET_TAP_TDL_6" -parent ${Offset_Sampled_Tap_TDL}]
  set_property tooltip {Offset Between consecutive Sampled Taps over the TDL 6} ${OFFSET_TAP_TDL_6}
  set OFFSET_TAP_TDL_7 [ipgui::add_param $IPINST -name "OFFSET_TAP_TDL_7" -parent ${Offset_Sampled_Tap_TDL}]
  set_property tooltip {Offset Between consecutive Sampled Taps over the TDL 7} ${OFFSET_TAP_TDL_7}
  set OFFSET_TAP_TDL_8 [ipgui::add_param $IPINST -name "OFFSET_TAP_TDL_8" -parent ${Offset_Sampled_Tap_TDL}]
  set_property tooltip {Offset Between consecutive Sampled Taps over the TDL 8} ${OFFSET_TAP_TDL_8}
  set OFFSET_TAP_TDL_9 [ipgui::add_param $IPINST -name "OFFSET_TAP_TDL_9" -parent ${Offset_Sampled_Tap_TDL}]
  set_property tooltip {Offset Between consecutive Sampled Taps over the TDL 9} ${OFFSET_TAP_TDL_9}
  set OFFSET_TAP_TDL_10 [ipgui::add_param $IPINST -name "OFFSET_TAP_TDL_10" -parent ${Offset_Sampled_Tap_TDL}]
  set_property tooltip {Offset Between consecutive Sampled Taps over the TDL 10} ${OFFSET_TAP_TDL_10}
  set OFFSET_TAP_TDL_11 [ipgui::add_param $IPINST -name "OFFSET_TAP_TDL_11" -parent ${Offset_Sampled_Tap_TDL}]
  set_property tooltip {Offset Between consecutive Sampled Taps over the TDL 11} ${OFFSET_TAP_TDL_11}
  set OFFSET_TAP_TDL_12 [ipgui::add_param $IPINST -name "OFFSET_TAP_TDL_12" -parent ${Offset_Sampled_Tap_TDL}]
  set_property tooltip {Offset Between consecutive Sampled Taps over the TDL 12} ${OFFSET_TAP_TDL_12}
  set OFFSET_TAP_TDL_13 [ipgui::add_param $IPINST -name "OFFSET_TAP_TDL_13" -parent ${Offset_Sampled_Tap_TDL}]
  set_property tooltip {Offset Between consecutive Sampled Taps over the TDL 13} ${OFFSET_TAP_TDL_13}
  set OFFSET_TAP_TDL_14 [ipgui::add_param $IPINST -name "OFFSET_TAP_TDL_14" -parent ${Offset_Sampled_Tap_TDL}]
  set_property tooltip {Offset Between consecutive Sampled Taps over the TDL 14} ${OFFSET_TAP_TDL_14}
  set OFFSET_TAP_TDL_15 [ipgui::add_param $IPINST -name "OFFSET_TAP_TDL_15" -parent ${Offset_Sampled_Tap_TDL}]
  set_property tooltip {Offset Between consecutive Sampled Taps over the TDL 15} ${OFFSET_TAP_TDL_15}

  #Adding Group
  set Types_of_Edge_of_the_TDL [ipgui::add_group $IPINST -name "Types of Edge of the TDL" -parent ${TDL}]
  set TYPE_TDL_0 [ipgui::add_param $IPINST -name "TYPE_TDL_0" -parent ${Types_of_Edge_of_the_TDL} -widget comboBox]
  set_property tooltip {CO vs O Sampling TDL 0} ${TYPE_TDL_0}
  set TYPE_TDL_1 [ipgui::add_param $IPINST -name "TYPE_TDL_1" -parent ${Types_of_Edge_of_the_TDL} -widget comboBox]
  set_property tooltip {CO vs O Sampling TDL 1} ${TYPE_TDL_1}
  set TYPE_TDL_2 [ipgui::add_param $IPINST -name "TYPE_TDL_2" -parent ${Types_of_Edge_of_the_TDL} -widget comboBox]
  set_property tooltip {CO vs O Sampling TDL 2} ${TYPE_TDL_2}
  set TYPE_TDL_3 [ipgui::add_param $IPINST -name "TYPE_TDL_3" -parent ${Types_of_Edge_of_the_TDL} -widget comboBox]
  set_property tooltip {CO vs O Sampling TDL 3} ${TYPE_TDL_3}
  set TYPE_TDL_4 [ipgui::add_param $IPINST -name "TYPE_TDL_4" -parent ${Types_of_Edge_of_the_TDL} -widget comboBox]
  set_property tooltip {CO vs O Sampling TDL 4} ${TYPE_TDL_4}
  set TYPE_TDL_5 [ipgui::add_param $IPINST -name "TYPE_TDL_5" -parent ${Types_of_Edge_of_the_TDL} -widget comboBox]
  set_property tooltip {CO vs O Sampling TDL 5} ${TYPE_TDL_5}
  set TYPE_TDL_6 [ipgui::add_param $IPINST -name "TYPE_TDL_6" -parent ${Types_of_Edge_of_the_TDL} -widget comboBox]
  set_property tooltip {CO vs O Sampling TDL 6} ${TYPE_TDL_6}
  set TYPE_TDL_7 [ipgui::add_param $IPINST -name "TYPE_TDL_7" -parent ${Types_of_Edge_of_the_TDL} -widget comboBox]
  set_property tooltip {CO vs O Sampling TDL 7} ${TYPE_TDL_7}
  set TYPE_TDL_8 [ipgui::add_param $IPINST -name "TYPE_TDL_8" -parent ${Types_of_Edge_of_the_TDL} -widget comboBox]
  set_property tooltip {CO vs O Sampling TDL 8} ${TYPE_TDL_8}
  set TYPE_TDL_9 [ipgui::add_param $IPINST -name "TYPE_TDL_9" -parent ${Types_of_Edge_of_the_TDL} -widget comboBox]
  set_property tooltip {CO vs O Sampling TDL 9} ${TYPE_TDL_9}
  set TYPE_TDL_10 [ipgui::add_param $IPINST -name "TYPE_TDL_10" -parent ${Types_of_Edge_of_the_TDL} -widget comboBox]
  set_property tooltip {CO vs O Sampling TDL 10} ${TYPE_TDL_10}
  set TYPE_TDL_11 [ipgui::add_param $IPINST -name "TYPE_TDL_11" -parent ${Types_of_Edge_of_the_TDL} -widget comboBox]
  set_property tooltip {CO vs O Sampling TDL 11} ${TYPE_TDL_11}
  set TYPE_TDL_12 [ipgui::add_param $IPINST -name "TYPE_TDL_12" -parent ${Types_of_Edge_of_the_TDL} -widget comboBox]
  set_property tooltip {CO vs O Sampling TDL 12} ${TYPE_TDL_12}
  set TYPE_TDL_13 [ipgui::add_param $IPINST -name "TYPE_TDL_13" -parent ${Types_of_Edge_of_the_TDL} -widget comboBox]
  set_property tooltip {CO vs O Sampling TDL 13} ${TYPE_TDL_13}
  set TYPE_TDL_14 [ipgui::add_param $IPINST -name "TYPE_TDL_14" -parent ${Types_of_Edge_of_the_TDL} -widget comboBox]
  set_property tooltip {CO vs O Sampling TDL 14} ${TYPE_TDL_14}
  set TYPE_TDL_15 [ipgui::add_param $IPINST -name "TYPE_TDL_15" -parent ${Types_of_Edge_of_the_TDL} -widget comboBox]
  set_property tooltip {CO vs O Sampling TDL 15} ${TYPE_TDL_15}





}
