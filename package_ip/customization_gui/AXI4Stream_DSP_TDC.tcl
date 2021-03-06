
# Loading additional proc with user specified bodies to compute parameter values.
source [file join [file dirname [file dirname [info script]]] /home/mconsonni/Utility_Ip_Core/ip-repo/AXI4-Stream_DSP_TDC/gui/AXI4Stream_DSP_TDC_v1_0.gtcl]

# Definitional proc to organize Tapped Delay Line widgets for parameters.
source [file join [file dirname [file dirname [info script]]] /home/mconsonni/Utility_Ip_Core/ip-repo/AXI4-Stream_DSP_TDC/package_ip/customization_gui/init_AXI4Stream_DSP_TDC.tcl]

# Definitional proc to organize widgets for parameters.
proc init_gui { IPINST } {

	ipgui::add_param $IPINST -name "Component_Name"

 	set Page "DSP TDC"
	init_AXI4Stream_DSP_TDC_gui $IPINST $Page

}

# Definition proc to dynamic set parameters
source [file join [file dirname [file dirname [info script]]] /home/mconsonni/Utility_Ip_Core/ip-repo/AXI4-Stream_DSP_TDC/package_ip/customization_gui/set_AXI4Stream_DSP_TDC.tcl]
