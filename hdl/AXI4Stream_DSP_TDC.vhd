------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------
--                                                                                                                     --
--  __/\\\\\\\\\\\\\\\__/\\\\\\\\\\\\\\\__/\\\\\\\\\\\\_____/\\\\\\\\\\\__/\\\\\\\\\\\\\\\__/\\\_____________          --
--   _\///////\\\/////__\/\\\///////////__\/\\\////////\\\__\/////\\\///__\/\\\///////////__\/\\\_____________         --
--    _______\/\\\_______\/\\\_____________\/\\\______\//\\\_____\/\\\_____\/\\\_____________\/\\\_____________        --
--     _______\/\\\_______\/\\\\\\\\\\\_____\/\\\_______\/\\\_____\/\\\_____\/\\\\\\\\\\\_____\/\\\_____________       --
--      _______\/\\\_______\/\\\///////______\/\\\_______\/\\\_____\/\\\_____\/\\\///////______\/\\\_____________      --
--       _______\/\\\_______\/\\\_____________\/\\\_______\/\\\_____\/\\\_____\/\\\_____________\/\\\_____________     --
--        _______\/\\\_______\/\\\_____________\/\\\_______/\\\______\/\\\_____\/\\\_____________\/\\\_____________	   --
--         _______\/\\\_______\/\\\\\\\\\\\\\\\_\/\\\\\\\\\\\\/____/\\\\\\\\\\\_\/\\\\\\\\\\\\\\\_\/\\\\\\\\\\\\\\\_   --
--          _______\///________\///////////////__\////////////_____\///////////__\///////////////__\///////////////__  --
--                                                                                                                     --
-------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------

--------------------------BRIEF MODULE DESCRIPTION -----------------------------
--! \file
--! \brief This is the wrapper of AXI4Stream_X7S_VirtualTDLWrapper for usage in block design and IP-Core.
--! \image html TappedDelayLine_IP-Core.png  [IP-Core image]
--! \todo AXI4-Lite Slave Ports
--------------------------------------------------------------------------------

----------------------------- LIBRARY DECLARATION ------------------------------

------------ IEEE LIBRARY -----------
--! Standard IEEE library
library IEEE;
	--! Standard Logic Vector library
	use IEEE.STD_LOGIC_1164.all;
	--! Numeric library
	use IEEE.NUMERIC_STD.ALL;
--	--! Math operation over real number (not for implementation)
--	--use IEEE.MATH_REAL.all;
------------------------------------

------------ STD LIBRARY -----------
--! Standard
library STD;
--! Textual Input/Output (only in simulation)
	use STD.textio.all;
------------------------------------


-- ---------- XILINX LIBRARY ----------
-- --! Xilinx Unisim library
-- library UNISIM;
-- 	--! Xilinx Unisim VComponent library
-- 	use UNISIM.VComponents.all;
--
-- --! \brief Xilinx Parametric Macro library
-- --! \details To be correctly used in Vivado write auto_detect_xpm into tcl console.
-- library xpm;
-- 	--! Xilinx Parametric Macro VComponent library
-- 	use xpm.vcomponents.all;
-- ------------------------------------


------------ LOCAL LIBRARY ---------
--! Project defined libary
library work;
--! Tapped Delay-Line local package
	use work.LocalPackage_TDC.all;
------------------------------------


entity AXI4Stream_DSP_TDC is

	generic (
        
        TYPE_TDL_0      :   STRING  :=  "O";  
        
		DEBUG_MODE		:	BOOLEAN	:=	TRUE;														
		
		NUM_TAP_TDL		:	POSITIVE	RANGE 4 TO 4096	:= 192;										
		
		MIN_VALID_TAP_POS	:	INTEGER		:=	0;													
		STEP_VALID_TAP_POS	:	POSITIVE	:=	1;													
		MAX_VALID_TAP_POS	:	NATURAL		:=	47;												
		
		VALID_POSITION_TAP_INIT		:	INTEGER	RANGE 0 TO 4095		:=	0;					
		
        BIT_SMP_TDL			:	POSITIVE	RANGE 1 TO 4096	:= 192	
    
    );


	port(

		
		reset	:	IN	STD_LOGIC;																	
		
		clk	:	IN	STD_LOGIC;			 															
		
		AsyncInput	:	IN	STD_LOGIC;																
		
		PolarityIn	:	IN	STD_LOGIC;
		
		m00_axis_undeco_tvalid	:	OUT	STD_LOGIC;																	
		m00_axis_undeco_tdata	:	OUT	STD_LOGIC_VECTOR((((1 + BIT_SMP_TDL -1)/8+1)*8)-1 DOWNTO 0); 	
		
		ValidPositionTap		:	IN	STD_LOGIC_VECTOR(31 DOWNTO 0)							
		
	);


end AXI4Stream_DSP_TDC;


--------------------------------------------------------------------------------

architecture Behavioral of AXI4Stream_DSP_TDC is



    CONSTANT	TYPE_TDL : STRING := "O";
	
	
	COMPONENT AXI4Stream_DSP_TDC_Wrapper

		generic (

			
			TYPE_TDL : STRING :=  "O";
			
			DEBUG_MODE		:	BOOLEAN	:=	FALSE;														
			
			NUM_TAP_TDL		:	POSITIVE	RANGE 4 TO 4096	:= 48;										
			
			MIN_VALID_TAP_POS		:	INTEGER		:=	5;												
			STEP_VALID_TAP_POS		:	POSITIVE	:=	3;												
			MAX_VALID_TAP_POS		:	NATURAL		:=	7;												
			
			VALID_POSITION_TAP_INIT		:	INTEGER	RANGE 0 TO 4095		:=	2;							
			
			BIT_SMP_TDL						:	POSITIVE	RANGE 1 TO 4096	:= 48						
			

		);


		port(

			
		    reset	:	IN	STD_LOGIC;																	
			
			clk	:	IN	STD_LOGIC;			 															
			
			AsyncInput	:	IN	STD_LOGIC;																
			
			PolarityIn	:	IN	STD_LOGIC;
			
			m00_axis_undeco_tvalid	:	OUT	STD_LOGIC;													
			m00_axis_undeco_tdata	:	OUT	STD_LOGIC_VECTOR(1 + BIT_SMP_TDL -1 DOWNTO 0); 
			
			ValidPositionTap		:	IN	STD_LOGIC_VECTOR(31 DOWNTO 0)								
			
			
		);

	END COMPONENT;
	-----------------------------------------------


	----------------------------------------------------------------------------






begin


	
	Inst_AXI4Stream_DSP_TDC_Wrapper	:	AXI4Stream_DSP_TDC_Wrapper

		generic map(

			TYPE_TDL		=>	TYPE_TDL,
			
			DEBUG_MODE	    =>	 DEBUG_MODE,
			
			NUM_TAP_TDL		=>	NUM_TAP_TDL,
			
			MIN_VALID_TAP_POS	=>	MIN_VALID_TAP_POS,
			STEP_VALID_TAP_POS	=>	STEP_VALID_TAP_POS,
			MAX_VALID_TAP_POS	=>	MAX_VALID_TAP_POS,
			
			VALID_POSITION_TAP_INIT   => VALID_POSITION_TAP_INIT,
			
			BIT_SMP_TDL				=>	BIT_SMP_TDL
			
		)
		port map(

			
			reset	=>	reset,
			
			clk		=>	clk,
			
			AsyncInput	=>	AsyncInput,
			
			PolarityIn	=>	PolarityIn,
			
			m00_axis_undeco_tvalid	=>	m00_axis_undeco_tvalid,
			m00_axis_undeco_tdata	=>	m00_axis_undeco_tdata(1 + BIT_SMP_TDL-1 DOWNTO 0),
			
			ValidPositionTap	=>	ValidPositionTap
			
			
		);
	
	m00_axis_undeco_tdata(m00_axis_undeco_tdata'LENGTH-1 downto 1 + BIT_SMP_TDL) <= (others => '0');
	

end Behavioral;