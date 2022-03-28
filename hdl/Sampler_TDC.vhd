-------------------------------------------------------------------------------------------------------------------------
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


---------- XILINX LIBRARY ----------
--! Xilinx Unisim library
library UNISIM;
--! Xilinx Unisim VComponent library
	use UNISIM.VComponents.all;

-- --! \brief Xilinx Parametric Macro library
-- --! \details To be correctly used in Vivado write auto_detect_xpm into tcl console.
-- library xpm;
-- 	--! Xilinx Parametric Macro VComponent library
-- 	use xpm.vcomponents.all;
-- ------------------------------------


-- ------------ LOCAL LIBRARY ---------
-- --! Project defined libary
library work;
--! Tapped Delay-Line local package
	use work.LocalPackage_TDC.all;
------------------------------------

--------------------------------------------------------------------------------
entity Sampler_TDC is
	generic (

		DEBUG_MODE	      	:	BOOLEAN	:=	FALSE;	
		
		MIN_VALID_TAP_POS	:	INTEGER		:=	5;
		STEP_VALID_TAP_POS	:	POSITIVE	:=	3;
		MAX_VALID_TAP_POS	:	NATURAL		:=	7;
		
		VALID_POSITION_TAP_INIT		:	INTEGER	RANGE 0 TO 4095		:=	2;								
		
		NUM_TAP_TDL			:	POSITIVE	RANGE 4 TO 1920	:= 96;						
		
		BIT_SMP_TDL			:	POSITIVE	RANGE 1 TO 1920	:= 96;
		
		NUM_TAP_PRE_TDL		:	INTEGER	RANGE 0 TO 480	:= 48;
		
		BIT_SMP_PRE_TDL			:	INTEGER	RANGE 0 TO 480	:= 48						

	);
	port(
		
		reset   : IN    STD_LOGIC;																	
		
		clk     : IN    STD_LOGIC;			 														
		
		AsyncTaps_TDL					:	IN	STD_LOGIC_VECTOR(NUM_TAP_TDL-1 downto 0);
		
		AsyncTaps_preTDL				:	IN	STD_LOGIC_VECTOR(NUM_TAP_PRE_TDL-1 downto 0);		
		
		SampledTaps_TDL					:	OUT	STD_LOGIC_VECTOR(BIT_SMP_TDL-1 downto 0);
		
		Valid_SampledTaps_TDL			:	OUT	STD_LOGIC;
		
		PolarityIn			            :	IN	STD_LOGIC;
		
		PolarityOut			            :	OUT	STD_LOGIC;
		
		ValidPositionTap				:	IN	STD_LOGIC_VECTOR(31 DOWNTO 0)			
		
	);
end Sampler_TDC;


architecture Behavioral of Sampler_TDC is

	signal	SampledTaps				:	STD_LOGIC_VECTOR(BIT_SMP_TDL + BIT_SMP_PRE_TDL -1 downto 0);	
	
	signal	ValidPosition_SampledTaps	:	STD_LOGIC_VECTOR					
	(

		Compute_ValidPositionSampledTapsTDL
		(

			MIN_VALID_TAP_POS,
			STEP_VALID_TAP_POS,
			MAX_VALID_TAP_POS,
			
			BIT_SMP_PRE_TDL,

			SampledTaps

		)'RANGE
	);	
	
	signal	RiseValid	:	STD_LOGIC	:=	'0';
	
	signal	FallValid	:	STD_LOGIC	:=	'0';
	
	signal	Valid_SampledTaps		:	STD_LOGIC	:=	'0';
	
	signal	Polarity			:	STD_LOGIC;
	
	signal 	ValidPositionTap_int    :	INTEGER	RANGE	0	TO	ValidPosition_SampledTaps'HIGH	:=	VALID_POSITION_TAP_INIT;
	
begin

	SamplingTDL	:	process (reset, clk, SampledTaps)

	begin

		
		if reset = '1' then
			SampledTaps			<=	(Others => '-');							
			
		elsif rising_edge(clk) then

			
			SampledTaps	<=
				Sample_AsyncTapsTDL (

					NUM_TAP_TDL,
					BIT_SMP_TDL,
 
					BIT_SMP_PRE_TDL,
					NUM_TAP_PRE_TDL,
					
					AsyncTaps_preTDL,
					AsyncTaps_TDL

				);

			Polarity <= PolarityIn;
			
		end if;
		
		SampledTaps_TDL	<=	SampledTaps(BIT_SMP_TDL + BIT_SMP_PRE_TDL-1 downto BIT_SMP_PRE_TDL);
		PolarityOut     <=  Polarity;
		
	end process;
	
-------------------------------
	
	ValidTDL	:	process(reset, clk, Valid_SampledTaps, RiseValid, FallValid)


	begin

		
		Valid_SampledTaps	<=	Compute_ValidSampledTapsTDL
		(

			RiseValid,
			FallValid

		);
		
		if reset = '1' then
			Valid_SampledTaps_TDL	<=	'0';

		elsif rising_edge(clk) then
			FallValid	<=	RiseValid;

		end if;
		
		Valid_SampledTaps_TDL	<=	Valid_SampledTaps;

	end process;

------------------------------------

    ValidDebugGen : if DEBUG_MODE = TRUE generate

        ValidPosition_SampledTaps	<=	Compute_ValidPositionSampledTapsTDL
		(

			MIN_VALID_TAP_POS,
			STEP_VALID_TAP_POS,
			MAX_VALID_TAP_POS,
            
            BIT_SMP_PRE_TDL,
            
            SampledTaps
		);
		
		ValidPositionTap_int	<=
		to_integer(
			unsigned(
				ValidPositionTap
			)
		);

		
		RiseValid	<=	ValidPosition_SampledTaps(ValidPositionTap_int);
		
	end generate;
	
	
	ValidGen : if DEBUG_MODE = FALSE generate
		RiseValid	<=	SampledTaps(VALID_POSITION_TAP_INIT);
	end generate;
	
	
end Behavioral;