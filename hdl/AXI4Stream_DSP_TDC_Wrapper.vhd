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

	use work.LocalPackage_TDC.all;
------------------------------------

--------------------------------------------------------------------------------




entity AXI4Stream_DSP_TDC_Wrapper is

	generic (
        
        TYPE_TDL        :   STRING  := "O";
        
        DEBUG_MODE		:	BOOLEAN	:=	FALSE;
		
		NUM_TAP_TDL		:	POSITIVE	RANGE 4 TO 4096	:= 48;										
		
		MIN_VALID_TAP_POS	:	INTEGER		:=	5;
		
		STEP_VALID_TAP_POS	:	POSITIVE	:=	3;
		
		MAX_VALID_TAP_POS	:	NATURAL		:=	7;
		
		VALID_POSITION_TAP_INIT		:	INTEGER	RANGE 0 TO 4095		:=	2;	
		
		BIT_SMP_TDL		:	POSITIVE	RANGE 1 TO 4096	:= 48
							
		
	);


	port(

		reset	:	IN	STD_LOGIC;																	
		
		clk	:	IN	STD_LOGIC;			 															
		
		
		AsyncInput	:	IN	STD_LOGIC;															
		
        PolarityIn	:	IN	STD_LOGIC;
		
		m00_axis_undeco_tvalid	:	OUT	STD_LOGIC;															
		m00_axis_undeco_tdata	:	OUT	STD_LOGIC_VECTOR(1 + BIT_SMP_TDL-1 DOWNTO 0);
		
		ValidPositionTap		:	IN	STD_LOGIC_VECTOR(31 DOWNTO 0)   := ( 1 => '1', Others => '0')		
		
	);


end AXI4Stream_DSP_TDC_Wrapper;


architecture Behavioral of AXI4Stream_DSP_TDC_Wrapper is



	component DSP_TDC is
	generic (

        NUM_TAP_TDL				:	POSITIVE	RANGE 4 TO 4096	:= 96					
		
	);
	port(
		
		clk : in std_logic;
		
		AsyncInput	:	IN	STD_LOGIC;											
		
        O_Taps_TDL	:	OUT	STD_LOGIC_VECTOR(NUM_TAP_TDL-1 downto 0)				
		
	);
    end component;

	-----------------------------------------------

	component Sampler_TDC is
	generic (

		
		TYPE_TDL			:	STRING	:= "O";	
		
		DEBUG_MODE	      	:	BOOLEAN	:=	FALSE;	
		
		MIN_VALID_TAP_POS	:	INTEGER		:=	5;
		STEP_VALID_TAP_POS	:	POSITIVE	:=	3;
		MAX_VALID_TAP_POS	:	NATURAL		:=	7;
		
		VALID_POSITION_TAP_INIT		:	INTEGER	RANGE 0 TO 4095		:=	2;								
		
		NUM_TAP_TDL			:	POSITIVE	RANGE 4 TO 4096	:= 96;						
		
		BIT_SMP_TDL			:	POSITIVE	RANGE 1 TO 4096	:= 96						

	);
	port(
		
		reset   : IN    STD_LOGIC;																	
		
		clk     : IN    STD_LOGIC;			 														
		
		AsyncTaps_TDL					:	IN	STD_LOGIC_VECTOR(NUM_TAP_TDL-1 downto 0);		
		
		SampledTaps_TDL					:	OUT	STD_LOGIC_VECTOR(BIT_SMP_TDL-1 downto 0);
		
		Valid_SampledTaps_TDL			:	OUT	STD_LOGIC;
		
		PolarityIn			            :	IN	STD_LOGIC;
		
		PolarityOut			            :	OUT	STD_LOGIC;
		
		ValidPositionTap				:	IN	STD_LOGIC_VECTOR(31 DOWNTO 0)			
		
	);
    end component;
    
    
    
    signal	CO_Taps_TDL     : std_logic_vector(NUM_TAP_TDL-1 downto 0);
    signal	O_Taps_TDL      : std_logic_vector(NUM_TAP_TDL-1 downto 0);
    signal	AsyncTaps_TDL   : std_logic_vector(NUM_TAP_TDL-1 downto 0);
	signal	SampledTaps_TDL : std_logic_vector(BIT_SMP_TDL-1 downto 0);
	
	signal	Polarity			:	std_logic;
	
	signal  Valid_SampledTaps_TDL : std_logic;
	
begin


		Inst_TDC	:	DSP_TDC
			generic map(

				
				NUM_TAP_TDL		=>	NUM_TAP_TDL
				
			)
			port map(
				
				clk   =>   clk,
				AsyncInput	=>	AsyncInput,
				O_Taps_TDL => O_Taps_TDL
			);
		
		
		X7S_Choose_AsyncTaps_TDL (

			
			TYPE_TDL,											
			
			CO_Taps_TDL,															
			O_Taps_TDL,														
			
			AsyncTaps_TDL													
			
		);


		Inst_Sampler_TDC	:	Sampler_TDC
			generic map(

				TYPE_TDL		=>	TYPE_TDL,
				
				DEBUG_MODE	    =>	 DEBUG_MODE,
				
				MIN_VALID_TAP_POS	=>	MIN_VALID_TAP_POS,
				STEP_VALID_TAP_POS	=>	STEP_VALID_TAP_POS,
				MAX_VALID_TAP_POS	=>	MAX_VALID_TAP_POS,
				
				VALID_POSITION_TAP_INIT	 => VALID_POSITION_TAP_INIT,
				
				NUM_TAP_TDL		=>	NUM_TAP_TDL,
				
				BIT_SMP_TDL		=>	BIT_SMP_TDL
	
			)
			port map(
				
				reset   =>	reset,
				
				clk     =>	clk,
				
				AsyncTaps_TDL	=>	AsyncTaps_TDL,
				
				Valid_SampledTaps_TDL	=>	Valid_SampledTaps_TDL,
				
				SampledTaps_TDL			=>	SampledTaps_TDL,
				
				PolarityIn			=>	PolarityIn,
				
				PolarityOut			=>	Polarity,
				
				ValidPositionTap	=>	ValidPositionTap
				
			);

	 m00_axis_undeco_tvalid	<=	Valid_SampledTaps_TDL;
	 
	 m00_axis_undeco_tdata(BIT_SMP_TDL)	<=   Polarity;
	 
	 m00_axis_undeco_tdata(BIT_SMP_TDL-1 DOWNTO 0) <= SampledTaps_TDL(BIT_SMP_TDL -1 downto 0);
	
	
end Behavioral;