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

--------------------------BRIEF MODULE DESCRIPTION -----------------------------
--! \file
--! \brief This module is responsible for determining the valid inside each TDL. 
--! It doesn't put Flip-Flops because the sampling has been already made internally to the DSP block.

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
	use work.LocalPackage_TDL.all;
------------------------------------

-----------------------------ENTITY DESCRIPTION --------------------------------
--! \brief Given in input all the Taps of the TDL *AsyncTaps_TDL* the module takes ASYNCHRONOUSLY just a *BIT_SMP_TDL* + *BIT_SMP_PRE_TDL* number of them.
--! After the bits-selection process, the module searches also for the valid, and if *DEBUG_MODE = TRUE* it is found by looking at the vector of *SampledTaps* in the positions determined by *MAX_VALID_TAP_POS*, *MIN_VALID_TAP_POS* and *STEP_VALID_TAP_POS*. The
--! final chosen position is determined by the port *ValidPositionTap*. Instead if *DEBUG_MODE = FALSE* the valid is found in the position *VALID_POSITION_TAP_INIT* of the *SampledTaps* vector.

--------------------------------------------------------------------------------
entity DSP_Sampler is
	generic (

		-------- DEBUG MODE --------
		DEBUG_MODE	      	:	BOOLEAN	:=	FALSE;								--! It allows us to choose the valid by port in case it is TRUE.

		------ Valid Gen Pos ------
		MIN_VALID_TAP_POS	:	INTEGER		:=	5;								--! Minimal position inside SampledTaps used by ValidPositionTap to extract the valid (MIN = LOW that is RIGHT attribute downto vect)
		STEP_VALID_TAP_POS	:	POSITIVE	:=	3;								--! Step used between MAX_VALID_TAP_POS and MIN_VALID_POS for assigned ValidPositionTap
		MAX_VALID_TAP_POS	:	NATURAL		:=	7;								--! Maximal position inside SampledTaps used by ValidPositionTap to extract the valid (MAX = HIGH that is LEFT attribute downto vect)

		--- Valid Initialization --
		VALID_POSITION_TAP_INIT		:	INTEGER	RANGE 0 TO 4095		:=	2;		--! Initial position along the TDL from which we want to extract the valid in case of DEBUG_MODE= FALSE

		-------- Dimension --------
		NUM_TAP_TDL			:	POSITIVE	RANGE 4 TO 4096	:= 96;				--! Bits of the TDL (number of taps in the TDL)
		BIT_SMP_TDL			:	POSITIVE	RANGE 1 TO 4096	:= 96;				--! Bits selected from the TDL each NUM_TAP_TDL/BIT_SMP_TDL, obviously equal in each TDLs. Basically it is simply a subvector

		------ PRE-Tapped Delay-Line (PRE-TDL) -------
		NUM_TAP_PRE_TDL		:	INTEGER	RANGE 0 TO 1024	:= 48;					--! Bits of the PRE-Tapped Delay-Line (number of taps in the PRE-TDL)
		BIT_SMP_PRE_TDL		:	INTEGER	RANGE 0 TO 1024	:= 48					--! Bits selected from the PRE-TDL each NUM_TAP_PRE_TDL/BIT_SMP_PRE_TDL, obviously equal in each TDLs

	);
	port(

		------------------ Reset/Clock ---------------
		--------- Reset --------
		reset   : IN    STD_LOGIC;									--! Asynchronous system reset, active '1'

		--------- Clocks -------
		clk     : IN    STD_LOGIC;									--! TDC clock

		------ Async Tapped Delay-Line Input ---------
		AsyncTaps_TDL					:	IN	STD_LOGIC_VECTOR(NUM_TAP_TDL-1 downto 0);		 --! Asynchronous input Taps of the TDL
		AsyncTaps_preTDL				:	IN	STD_LOGIC_VECTOR(NUM_TAP_PRE_TDL-1 downto 0);	 --! Asynchronous input Taps of the PRE_TDL

		------- Sampled and Sync TDL output ----------
		SampledTaps_TDL					:	OUT	STD_LOGIC_VECTOR(BIT_SMP_TDL-1 downto 0);        --! Selected taps along the chain (just the TDL, for the measure)
		Valid_SampledTaps_TDL			:	OUT	STD_LOGIC;										 --! Valid of SampledTaps_TDL

		---------- Polarity ----------
		PolarityIn			            :	IN	STD_LOGIC;										--! Polarity of the Input Logic (1 = AsyncInput is on Rising Edge, 0 = AsyncInput is on Falling Edge)
		PolarityOut			            :	OUT	STD_LOGIC;										--! Polarity Sampled on the clock as Valid_SampledTaps_TDL and SampledTaps_TDL

		-- AXI for tuning valid generation --
		ValidPositionTap				:	IN	STD_LOGIC_VECTOR(31 DOWNTO 0)                  --! Port which chooses the position of the bit for generating the valid of SampledTaps_TDL (case DEBUG_MODE = TRUE)

	);
end DSP_Sampler;


------------------------ ARCHITECTURE DESCRIPTION ------------------------------
--! \brief First the module searches for the positions where we could find the valid, by exploring the *SampledTaps* vector between the components *MIN_VALID_TAP_POS* and *MAX_VALID_TAP_POS* of the vector itself, by making steps of *STEP_VALID_TAP_POS*. This operation is made by the *Compute_ValidPositionSampledTapsTDL* function.
--! The work of the *Compute_ValidSampledTapsTDL* function can be explained also by the following image:
--! \image html VALID.svg [Search of the valid]
--! The figure shows the case of *MIN_VALID_TAP_POS = 1*, *MAX_VALID_TAP_POS = 5* and *STEP_VALID_TAP_POS = 2*.
--! Then the module makes 2 processes:
--!  - **SamplingTDL**: By means of the *Sample_AsyncTapsDSP* function, this process manages the selection of the sub-vector taken from the input data (which is the already-sampled output from the DSP), by following the *BIT_SMP_TDL* constraints.
--!  - **ValidTDL**: This process searches for the *Valid_SampledTaps*.
--! In this module, the valid is searched in this way: we have a valid when the data arrives, and we understand that the data is arrived if we sample a '0' after a '1', and we want that the valid lasts just 1 clock pulse.
--! With the function *Compute_ValidSampledTapsDSP* we effectively generate the value of the Valid. 
--! Furthermore this module behaves differently according to the value of *DEBUG_MODE*:
--! If *DEBUG_MODE = TRUE* the module searches along the sampled-data, the positions where we want to find the valid, by means of the function *Compute_ValidPositionSampledTapsTDL*. Then inside the vector *ValidPosition_SampledTaps*, that is generated by that function, it looks for the valid in the specific position *ValidPositionTap*.
--! Instead if *DEBUG_MODE = FALSE* the valid is searched within all the *SampledTaps* in the position determined by *VALID_POSITION_TAP_INIT*.

--------------------------------------------------------------------------------

architecture Behavioral of DSP_Sampler is

	------------- Asynchronous Sampling of the TDL ----------
	signal	SampledTaps				:	STD_LOGIC_VECTOR(BIT_SMP_TDL + BIT_SMP_PRE_TDL -1 downto 0);    --! Selected taps along the chain
	
	----------- Valid Generation ------------
	signal	ValidPosition_SampledTaps	:	STD_LOGIC_VECTOR				--! This vector contains the positions where the valid can be found
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

	signal	RiseValid	:	STD_LOGIC	:=	'0';					--! Signal containing the value of the bit from which we want to extract the valid

	signal	FallValid	:	STD_LOGIC	:=	'0';					--! Signal used to make the overall valid lasting just 1 clock cycle

	signal	Valid_SampledTaps		:	STD_LOGIC	:=	'0';		--! Overall valid
	
	signal	Polarity			:	STD_LOGIC;						--! Polarity
	
	-- AXI for tuning valid generation --
	signal 	ValidPositionTap_int    :	INTEGER	RANGE	0	TO	ValidPosition_SampledTaps'HIGH	:=	VALID_POSITION_TAP_INIT;  --! Initialization of the position from which we want to choose the valid.

begin

	--! This asynchronous assignment manages the selection of the taps along the already-sampled chain, as described in the architecture description.
	SampledTaps	<=
				Sample_AsyncTapsDSP (

					NUM_TAP_TDL,

					BIT_SMP_TDL,

					BIT_SMP_PRE_TDL,
					NUM_TAP_PRE_TDL,

					AsyncTaps_preTDL,
					AsyncTaps_TDL

				);

	--- Output Assignements ---
	PolarityOut     <= PolarityIn;
	SampledTaps_TDL	<=	SampledTaps(BIT_SMP_TDL + BIT_SMP_PRE_TDL-1 downto BIT_SMP_PRE_TDL);
		
-------------------------------

	------------- Valid of the TDL ----------
	--! This process manages the search of the Valid, as described in the architecture description.
	--! \vhdlflow [ValidTDL]

	ValidTDL	:	process(reset, clk, Valid_SampledTaps, RiseValid, FallValid)


	begin
		------- Valid Generation --------
		-- Combinatory valid generation
		Valid_SampledTaps	<=	Compute_ValidSampledTapsDSP
		(

			RiseValid,
			FallValid

		);

		------ Fall/Rise of Valid ------
		if reset = '1' then
			Valid_SampledTaps_TDL	<=	'0';

		elsif rising_edge(clk) then
			FallValid	<=	RiseValid;

		end if;

		----- Output Assignements -----
		Valid_SampledTaps_TDL	<=	Valid_SampledTaps;

	end process;

------------------------------------

    ---- AXI4-Slave Interfaces Valid Tuning ---
	ValidDebugGen : if DEBUG_MODE = TRUE generate

        ----- Valid Initialization ----
		-- ValidPosition_SampledTaps MUX
		ValidPosition_SampledTaps	<=	Compute_ValidPositionSampledTapsTDL
		(

			MIN_VALID_TAP_POS,
			STEP_VALID_TAP_POS,
			MAX_VALID_TAP_POS,

            BIT_SMP_PRE_TDL,

            SampledTaps
		);

		--- Choose the Valid position ---
		ValidPositionTap_int	<=
		to_integer(
			unsigned(
				ValidPositionTap
			)
		);


		-- Select the Valid
		RiseValid	<=	ValidPosition_SampledTaps(ValidPositionTap_int);

	end generate;


	---- No Debug Interfaces Valid Tuning ---
	ValidGen : if DEBUG_MODE = FALSE generate
		RiseValid	<=	SampledTaps(VALID_POSITION_TAP_INIT);
	end generate;


end Behavioral;