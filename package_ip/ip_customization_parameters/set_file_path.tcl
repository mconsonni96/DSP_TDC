# ------ Simulation Delay ----
# FILE_PATH_NAME_CO_DELAY		:	STRING	:=													-- Delay for CO in Simulation
# "C:\Users\nicol\Desktop\MAGISTRALE\Tesi\tappeddelayline_nlusardi\TappedDelayLine.srcs\sim_1\new\CO_O_Delay.txt";
# --"/home/nicola/Documents/Vivado/Projects/Time-to-Digital_Converter/TappedDelayLine/TappedDelayLine.srcs/sim_1/new/CO_O_Delay.txt";

# FILE_PATH_NAME_O_DELAY		:	STRING	:=													-- Delay for O in Simulation
# "C:\Users\nicol\Desktop\MAGISTRALE\Tesi\tappeddelayline_nlusardi\TappedDelayLine.srcs\sim_1\new\CO_O_Delay.txt";
# --"/home/nicola/Documents/Vivado/Projects/Time-to-Digital_Converter/TappedDelayLine/TappedDelayLine.srcs/sim_1/new/CO_O_Delay.txt";
# ----------------------------


# ----------- FILE_PATH_NAME_CO_DELAY ----------
set DEFAULT_FILE_PATH_NAME_CO_DELAY "/home/nicola/Documents/Vivado/Projects/Time-to-Digital_Converter/TappedDelayLine/TappedDelayLine.srcs/sim_1/new/CO_O_Delay.txt"

set enablement {False}
set editable {expr {$SIM_VS_IMP} == "{SIM}"}

set dependency {}

set tooltip "CO Delay Path Used for simulated TDL"
set display_name "CO Delay Path"

set_param_string_text "FILE_PATH_NAME_CO_DELAY" $DEFAULT_FILE_PATH_NAME_CO_DELAY $enablement $editable $dependency $tooltip $display_name
# ----------------------------------------------



# ----------- FILE_PATH_NAME_O_DELAY ----------
set DEFAULT_FILE_PATH_NAME_O_DELAY "/home/nicola/Documents/Vivado/Projects/Time-to-Digital_Converter/TappedDelayLine/TappedDelayLine.srcs/sim_1/new/CO_O_Delay.txt"

set enablement {False}
set editable {expr {$SIM_VS_IMP} == "{SIM}"}

set dependency {}

set tooltip "O Delay Path Used for simulated TDL"
set display_name "O Delay Path"

set_param_string_text "FILE_PATH_NAME_O_DELAY" $DEFAULT_FILE_PATH_NAME_O_DELAY $enablement $editable $dependency $tooltip $display_name
# ----------------------------------------------
