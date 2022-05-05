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
--! \brief In case of more TDLs in parallel, which can be made with Carry-chains, with DSP-chains, or both, this module allows us to select in which TDL we want to obtain the Valid.
--! Then,it sets the output data equal to the value stored in the corresponding Flip Flop.
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

	use work.LocalPackage_TDL.all;
------------------------------------

--------------------------------------------------------------------------------

-----------------------------ENTITY DESCRIPTION --------------------------------
--! \brief This module basically manages the creation of a *NUMBER_OF_CARRY_CHAINS + NUMBER_OF_DSP_CHAINS* TDLs in parallel, with a *NUM_TAP_TDL* number of taps each. It associates to each CARRY-TDL the corresponding Type (CO or O) and the desired Offset
--! thanks to the arrays *TYPE_TDL_ARRAY* and *OFFSET_TAP_TDL_ARRAY*. Then it collects all the *SampledTaps* from each TDL and it stores them in the output vector (*m00_axis_undeco_tdata*), that is the overall output of the
--! module. Then among all the TDLs, we can choose from which one we want to extract the valid, by means of *ValidNumberOfTdl* if *DEBUG_MODE = TRUE* or by means of *VALID_NUMBER_OF_TDL_INIT*
--! if *DEBUG_MODE = FALSE*.
--------------------------------------------------------------------------------


entity AXI4Stream_VirtualTDL_Wrapper is

	generic (

        ----- Technology node -------
		XUS_VS_X7S      :   STRING  := "XUS";          --! Technology node (Ultrascale or 7-Series)
        
        ------------- Select Types of Edge of the CARRY Tapped Delay-Line ------------
		TYPE_TDL_ARRAY		:	CO_VS_O_ARRAY_STRING	:= ("C", "O", Others => "C");      --! CO vs O Sampling
	
		-------- DEBUG MODE --------
		DEBUG_MODE		:	BOOLEAN	:=	FALSE;     --! True Active the AXI port for moving the Valid Position (Sampled Tap used) and valid Number (TDL used). It allows us to choose the valid by port if it is true

        ------------ Tapped Delay-Line (TDL) ---------
		-------- Sim vs Impl -------
		SIM_VS_IMP	:	STRING	:= "IMP";													--! Simulation or Implementation
		----------------------------

		------ Simulation Delay ----
		FILE_PATH_NAME_CO_DELAY		:	STRING	:=													--! Path of the .txt file that contains the CO delays for Simulation
		"C:\Users\nicol\Desktop\MAGISTRALE\Tesi\tappeddelayline_nlusardi\TappedDelayLine.srcs\sim_1\new\CO_O_Delay.txt";
		--"/home/nicola/Documents/Vivado/Projects/Time-to-Digital_Converter/TappedDelayLine/TappedDelayLine.srcs/sim_1/new/CO_O_Delay.txt";

		FILE_PATH_NAME_O_DELAY		:	STRING	:=													--! Path of the .txt file that contains the O delays for Simulation
		"C:\Users\nicol\Desktop\MAGISTRALE\Tesi\tappeddelayline_nlusardi\TappedDelayLine.srcs\sim_1\new\CO_O_Delay.txt";
		--"/home/nicola/Documents/Vivado/Projects/Time-to-Digital_Converter/TappedDelayLine/TappedDelayLine.srcs/sim_1/new/CO_O_Delay.txt";
		----------------------------
		
		-------- Dimension ---------
		NUMBER_OF_CARRY_CHAINS   :   NATURAL   RANGE 0 TO 16   := 2;    --! Number of Carry-chains in parallel
		NUMBER_OF_DSP_CHAINS     :   NATURAL    RANGE 0 TO 16   := 2;   --! Number of DSP-chains in parallel
		NUM_TAP_TDL		:	POSITIVE	RANGE 4 TO 4096	:= 512;         --! Bit of the TDL (number of taps in the TDL)
		
		------------ Sampling of the TDL -------------
		----- Buffering Stage for the Carry-chains-----
		BUFFERING_STAGE	:	BOOLEAN	:= TRUE;            --! Buffering stage for the valid synch, it allows us to allign the data and the corresponding valid to the same clock pulse

		------ Valid Gen Pos ------
		MIN_VALID_TAP_POS	:	INTEGER		:=	5;    --! Minimal position inside SampledTaps used by ValidPosition to extract the valid (MIN = LOW that is RIGHT attribute downto vect)
		STEP_VALID_TAP_POS	:	POSITIVE	:=	3;    --! Step used between MAX_VALID_TAP_POS and MIM_VALID_POS for assigned ValidPosition
		MAX_VALID_TAP_POS	:	NATURAL		:=	7;    --! Maximal position inside SampledTaps used by ValidPosition to extract the valid (MAX = HIGH that is LEFT attribute downto vect)

		--- Valid Initialization --
		VALID_POSITION_TAP_INIT		:	INTEGER	RANGE 0 TO 4095		:=	2;    --! Initial position along the TDL from which we want to extract the valid in case of DEBUG_MODE= FALSE
		VALID_NUMBER_OF_TDL_INIT	:	INTEGER	RANGE 0 TO 15		:=	0;    --! Initial number of the TDL from which we want to extract the valid in case of DEBUG_MODE= FALSE

		---- Sampler Dimension ----
		OFFSET_TAP_TDL_ARRAY	:	OFFSET_TAP_TDL_ARRAY_TYPE	:=	(1, Others => 0);    --! The CARRY-TDL is sampled with an initial offset of bit with respect to the Tap step of NUM_TAP_TDL/BIT_SMP_TDL, one different for each TDL for more flexibility
		BIT_SMP_TDL		     :	POSITIVE	RANGE 1 TO 4096	:= 512;						 --! Bit Sampled from the TDL each NUM_TAP_TDL/BIT_SMP_TDL after OFFSET_TAP_TDL, obviously equal in each TDLs. Basically it is the number of Flip Flops

		------ PRE-Tapped Delay-Line (PRE-TDL) -------
		NUM_TAP_PRE_TDL		 :	INTEGER	RANGE 0 TO 1024	:= 128;		--! Bit of the PRE-Tapped Delay-Line (number of taps in the PRE-TDL)
		BIT_SMP_PRE_TDL		 :	INTEGER	RANGE 0 TO 1024	:= 128      --! Bit Sampled from the PRE-TDL each NUM_TAP_PRE_TDL/BIT_SMP_PRE_TDL, obviously equal in each TDLs

	);


	port(

		------------------------------- Reset/Clock ----------------------------
		------------------- Reset --------------------
		reset	:	IN	STD_LOGIC;            --! Asyncronous system reset active '1'

		------------------- Clocks -------------------
		clk	    :	IN	STD_LOGIC;            --! TDC Sampling clock

        -------------------- Time-to-Digital Convertion ------------------------
		---------------- Async Input -----------------
		AsyncInput	:	IN	STD_LOGIC;        --! Asynchronous input data

        ---------- Polarity of Async Input  ----------
		PolarityIn	:	IN	STD_LOGIC;        --! Polarity of the Input Logic (1 = AsyncInput is on Rising Edge, 0 = AsyncInput is on Falling Edge)

		--------- Undecode Output sync to clk  --------
		m00_axis_undeco_tvalid	:	OUT	STD_LOGIC;          																			  --! Valid Uncalibrated Virtual TDL
		m00_axis_undeco_tdata	:	OUT	STD_LOGIC_VECTOR(1 + (NUMBER_OF_CARRY_CHAINS + NUMBER_OF_DSP_CHAINS)*BIT_SMP_TDL-1 DOWNTO 0);     --! Data Uncalibrated Virtual TDL

		-- AXI for tuning valid generation --
		ValidPositionTap		:	IN	STD_LOGIC_VECTOR(31 DOWNTO 0)   := ( 1 => '1', Others => '0');  --! Position of the bit for generating the valid of Bit of SampledTaps_TDL
		ValidNumberOfTdl        :   IN  STD_LOGIC_VECTOR(31 DOWNTO 0)   := ( Others => '0')             --! Valid chosen between the NUMBER_OF_TDL possible TDLs

	);


end AXI4Stream_VirtualTDL_Wrapper;

------------------------ ARCHITECTURE DESCRIPTION ------------------------------
--! This module first imports the value of *CO_DELAY_MATRIX* and *O_DELAY_MATRIX* from a .txt file by means of the *CO_O_ExtractDelayFromFile* function.
--! Then, it instantiates the *CARRY_TDL*, the *CARRY_Sampler*, the *DSP_TDL*, and the *DSP_Sampler*.
--! After that, the module generates as many *CARRY_TDL* and *CARRY_Sampler* as *NUMBER_OF_CARRY_CHAINS*, and as many *DSP_TDL* and *DSP_Sampler* as *NUMBER_OF_DSP_CHAINS*.
--! In this way we obtain *NUMBER_OF_TDL* TDLs in parallel. Thanks to the procedure *Choose_AsyncTaps_Carry*, we decide whether we want to read the CO taps, or the O taps of the carry-chain.
--! At the end, the module selects the desired Valid (*m00_axis_undeco_tvalid*) from one of the possible TDLs, by means of *ValidNumberOfTdl* in case of *DEBUG MODE = TRUE* or by means of *VALID_NUMBER_OF_TDL_INIT* in case of
--! *DEBUG_MODE = FALSE*. Then the module brings in output the sampled data (*m00_axis_undeco_tdata*) by means of the *From_SampledTaps_to_Undeco* procedure.
--------------------------------------------------------------------------------

architecture Behavioral of AXI4Stream_VirtualTDL_Wrapper is
	
	
	------------------------- CONSTANTS DECLARATION ----------------------------
    constant  NUMBER_OF_TDL : integer := NUMBER_OF_CARRY_CHAINS + NUMBER_OF_DSP_CHAINS;    --! Total number of TDLs in parallel
	
	
	---------- Delays for simulated TDL -------------
	constant	CO_DELAY_MATRIX	:	TIME_MATRIX_TYPE :=	CO_O_ExtractDelayFromFile  			--! CO Delays for simulated TDL
	(
		SIM_VS_IMP,

		FILE_PATH_NAME_CO_DELAY,

		NUM_TAP_TDL + NUM_TAP_PRE_TDL,
		NUMBER_OF_TDL
	);

	constant	O_DELAY_MATRIX	:	TIME_MATRIX_TYPE :=	CO_O_ExtractDelayFromFile			--! O Delays for simulated TDL
	(
		SIM_VS_IMP,

		FILE_PATH_NAME_O_DELAY,

		NUM_TAP_TDL + NUM_TAP_PRE_TDL,
		NUMBER_OF_TDL
	);
	------------------------------------------------
	----------------------------------------------------------------------------
	
	--------------------------- TYPES DECLARATION ------------------------------
	-------- Array of the Taps of the TDL --------
	type	TDL_ARRAY_TYPE	is array (0 to NUMBER_OF_TDL -1) of STD_LOGIC_VECTOR(NUM_TAP_TDL -1 downto 0);         --! Array of the Taps of the TDL, used to contain all the Taps of all the TDLs.
    type	PRE_TDL_ARRAY_TYPE	is array (0 to NUMBER_OF_TDL -1) of STD_LOGIC_VECTOR(NUM_TAP_PRE_TDL-1 downto 0);  --! Array of the Taps of the PRE-TDL, used to contain all the Taps of all the PRE-TDLs.
    
	------- Array of the Sampled Taps TDL ----------
	type	SMP_TDL_ARRAY_TYPE	is array (0 to NUMBER_OF_TDL -1) of STD_LOGIC_VECTOR(BIT_SMP_TDL-1 downto 0);      --! Array of the Sampled Taps TDL, used to contain all the *SampledTaps* of all the TDLs.
    ------------------------------------------------------
    
	------------------------ FUNCTIONS AND PROCEDURES --------------------------


	----- Conv SampledTaps ARRAY in Undeco SLV ----
	--! \brief This procedure extracts the value stored in the Flip Flops of the TDLs and brings it as it is to the output.
	--! It takes in input:
	--!  - *BIT_SMP_TDL*, that is the number of taps of the TDL that we sample
	--!  - *SampledTaps_TDL*, that is an array of *NUMBER_OF_TDL* length of vectors of *NUM_TAP_TDL* length. Basically it is a matrix of dimensions *NUMBER_OF_TDL* * *NUM_TAP_TDL*. This matrix contains the value stored in the flip flops.
	--! This procedure simply brings to the output (*undeco_tdata*) the values stored in the matrix.

	procedure	From_SampledTaps_to_Undeco (

		constant bit_smp_tdl		:	IN	POSITIVE;
		signal	SampledTaps_TDL	:	IN	SMP_TDL_ARRAY_TYPE;
		signal	undeco_tdata		:	OUT	STD_LOGIC_VECTOR

	) is

		variable	number_of_tdl	:	integer	:=	SampledTaps_TDL'LENGTH;
		
		variable	undeco_tmp		:	std_logic_vector(number_of_tdl*bit_smp_tdl-1 downto 0);
		

	begin

		for I in 0 to number_of_tdl-1 loop

			undeco_tmp((I+1)*bit_smp_tdl -1 downto I*bit_smp_tdl)	:=	SampledTaps_TDL(I)(bit_smp_tdl -1 downto 0);

		end loop;
		
		undeco_tdata	<=	undeco_tmp;

	end procedure;
	---------------------------------------------
	
	------------------------ COMPONENTS DECLARATION ----------------------------

	----- Xilinx TDL based on CARRY8(4) -----
	--! \brief This module creates the chain containing *NUM_TAP_TDL* buffers, starting from the basic block *CARRY8(4)*.
	
	component CARRY_TDL is
	generic (

		XUS_VS_X7S   :  STRING := "XUS";
		
		-------- Sim vs Impl ---------
		SIM_VS_IMP	:	STRING	:= "IMP";							-- SIMULATION or IMPLEMENTATION

		CO_DELAY	:	TIME_ARRAY_TYPE;									-- Delay for CO in Simulation
		O_DELAY		:	TIME_ARRAY_TYPE;									-- Delay for O in Simulation
		----------------------------
		
		NUM_TAP_TDL				:	POSITIVE	RANGE 4 TO 4096	:= 16;					--! Bits of the TDL (number of buffers in the TDL)
		NUM_TAP_PRE_TDL			:	INTEGER	RANGE 0 TO 1024	:= 256						--! Bits of the PRE-Tapped Delay-Line (number of buffers in the PRE-TDL)
		----------------------------

	);
	port(
		-------- Async Input --------
		AsyncInput	:	IN	STD_LOGIC;											--! Asynchronous input data
		-----------------------------

		---- Tapped Delay-Line ------
		CO_Taps_TDL	:	OUT	STD_LOGIC_VECTOR(NUM_TAP_TDL-1 downto 0);				--! CO Taps in output, AsyncInput delayed not inverted
		O_Taps_TDL	:	OUT	STD_LOGIC_VECTOR(NUM_TAP_TDL-1 downto 0);				--! O Taps in output, AsyncInput delayed and inverted
		-----------------------------

		---- Tapped Delay-Line ------
		CO_Taps_preTDL	:	OUT	STD_LOGIC_VECTOR(NUM_TAP_PRE_TDL-1 downto 0);				--! CO Taps in output of the PRE-TDL, AsyncInput delayed not inverted
		O_Taps_preTDL	:	OUT	STD_LOGIC_VECTOR(NUM_TAP_PRE_TDL-1 downto 0)				--! O Taps in output of the PRE-TDL, AsyncInput delayed and inverted
		-----------------------------

	);
    end component;

	------------------------------------------
	----- Xilinx TDL based on DSP48E2(E1) -----
	--! \brief This module creates the chain containing *NUM_TAP_TDL* taps, starting from the basic block *DSP48E2(E1)*.
	
	component DSP_TDL is
	generic (

      XUS_VS_X7S   :  STRING := "XUS";
      
      NUM_TAP_TDL				   :	POSITIVE	RANGE 4 TO 4096	:= 96;

      NUM_TAP_PRE_TDL         :   INTEGER     RANGE 0 TO 1024  := 48

	);
	port(

		clk : in std_logic;

		AsyncInput	:	in std_logic;

      Taps_TDL	:	out std_logic_vector(NUM_TAP_TDL-1 downto 0);

      Taps_preTDL :   out std_logic_vector(NUM_TAP_PRE_TDL-1 downto 0)

	);
    end component;

    --------------------------------------------

	---------- Sampler of a CARRY-TDL -----------
	--! \brief This module is responsible for selecting where to put the Flip flops along the chain to sample the input data, and for determining the valid in each single TDL.
	--! Furthermore, if *BUFFERING_STAGE = TRUE*, the module synchronizes the sampled data and the corresponing valid at the same clock pulse.

	component CARRY_Sampler is
	generic (

		------- Select Types ------
		TYPE_TDL				:	STRING	:= "C";										--! CO vs O Sampling
		---------------------------

		-------- DEBUG MODE --------
		DEBUG_MODE		:	BOOLEAN	:=	FALSE;											--! It allows us to choose the valid by port in case it is TRUE.
		----------------------------

		----- Buffering Stage -----
		BUFFERING_STAGE	:	BOOLEAN	:= TRUE;											--! Buffering stage for the valid synch, it allows us to align the data and the corresponding valid to the same clock pulse
		---------------------------

		------ Valid Gen Pos ------
		MIN_VALID_TAP_POS		:	INTEGER		:=	5;									--! Minimal position inside SampledTaps used by ValidPositionTap to extract the valid (MIN = LOW that is RIGHT attribute downto vect)
		STEP_VALID_TAP_POS		:	POSITIVE	:=	3;									--! Step used between MAX_VALID_TAP_POS and MIN_VALID_POS for assigned ValidPositionTap
		MAX_VALID_TAP_POS		:	NATURAL		:=	7;									--! Maximal position inside SampledTaps used by ValidPositionTap to extract the valid (MAX = HIGH that is LEFT attribute downto vect)
		---------------------------

		--- Valid Initialization --
		VALID_POSITION_TAP_INIT		:	INTEGER	RANGE 0 TO 4095		:=	2;				--! Initial position along the TDL from which we want to extract the valid in case of DEBUG_MODE= FALSE
		---------------------------

		-------- Dimension --------
		NUM_TAP_TDL			:	POSITIVE	RANGE 4 TO 4096	:= 16;						--! Bits of the TDL (number of buffers in the TDL)
		OFFSET_TAP_TDL		:	NATURAL		RANGE 0 TO 4095	:= 0;						--! The TDL is sampled with an initial offset of bit with respect to the Tap step of NUM_TAP_TDL/BIT_SMP_TDL

		BIT_SMP_TDL			:	POSITIVE	RANGE 1 TO 4096	:= 16;						--! Bits Sampled from the TDL each NUM_TAP_TDL/BIT_SMP_TDL after OFFSET_TAP_TDL, obviously equal in each TDLs. Basically it is the number of Flip Flops
		---------------------------

		------ PRE-Tapped Delay-Line (PRE-TDL) -------
		NUM_TAP_PRE_TDL			:	INTEGER	RANGE 0 TO 1024	:= 256;					--! Bits of the PRE-Tapped Delay-Line (number of buffers in the PRE-TDL)
		BIT_SMP_PRE_TDL			:	INTEGER	RANGE 0 TO 1024	:= 256					--! Bits Sampled from the PRE-TDL each NUM_TAP_PRE_TDL/BIT_SMP_PRE_TDL after OFFSET_TAP_TDL, obviously equal in each TDLs
		----------------------------------------------

	);
	port(
		------------------ Reset/Clock ---------------
		--------- Reset --------
		reset   : IN    STD_LOGIC;																	--! Asynchronous system reset, active '1'
		------------------------

		--------- Clocks -------
		clk     : IN    STD_LOGIC;			 														--! TDC Sampling clock
		------------------------
		----------------------------------------------

		------ Async Tapped Delay-Line Input ---------
		AsyncTaps_TDL							:	IN	STD_LOGIC_VECTOR(NUM_TAP_TDL-1 downto 0);		    --! Asynchronous input Taps of the TDL
		AsyncTaps_preTDL						:	IN	STD_LOGIC_VECTOR(NUM_TAP_PRE_TDL-1 downto 0);		--! Asynchronous input Taps of the PRE_TDL
		----------------------------------------------

		------- Sampled and Sync TDL output ----------
		Valid_SampledTaps_TDL			:	OUT	STD_LOGIC;											--! Valid of SampledTaps_TDL
		SampledTaps_TDL					:	OUT	STD_LOGIC_VECTOR(BIT_SMP_TDL-1 downto 0);			--! Sampled taps along the chain (just the TDL, for the measure)
		----------------------------------------------
        PolarityIn			:	IN	STD_LOGIC;														--! Polarity of the Input Logic (1 = AsyncInput is on Rising Edge, 0 = AsyncInput is on Falling Edge)
		PolarityOut			:	OUT	STD_LOGIC;														--! Polarity Sampled on the clock as Valid_SampledTaps_TDL and SampledTaps_TDL
		----------- AXI4-Slave Interfaces ------------
		-- AXI for tuning valid generationr (*)
		ValidPositionTap						:	IN	STD_LOGIC_VECTOR(31 DOWNTO 0)				--! Port which chooses the position of the bit for generating the valid of SampledTaps_TDL (case DEBUG_MODE = TRUE)
		----------------------------------------------


	);
    end component;

	-----------------------------------------------

    ---------- Sampler of a DSP-TDL -----------
	--! \brief This module is responsible for selecting asynchronously the already-internally-sampled taps of the DSP-chain, and for determining the valid in each single TDL.
	
	component DSP_Sampler is
	generic (

		DEBUG_MODE	      	:	BOOLEAN	:=	FALSE;

		MIN_VALID_TAP_POS	:	INTEGER		:=	5;
		STEP_VALID_TAP_POS	:	POSITIVE	:=	3;
		MAX_VALID_TAP_POS	:	NATURAL		:=	7;

		VALID_POSITION_TAP_INIT		:	INTEGER	RANGE 0 TO 4095		:=	2;

		NUM_TAP_TDL			:	POSITIVE	RANGE 4 TO 4096	:= 96;
        BIT_SMP_TDL			:	POSITIVE	RANGE 1 TO 4096	:= 96;

		NUM_TAP_PRE_TDL		:	INTEGER	RANGE 0 TO 1024	:= 48;

		BIT_SMP_PRE_TDL		:	INTEGER	RANGE 0 TO 1024	:= 48

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
    end component;

	---------------------------------------
	
	-------------------------- SIGNALS DECLARATION -----------------------------

	---- Tapped Delay-Lines ----	
	signal	CO_Taps_TDL          :   TDL_ARRAY_TYPE;      --! NUMBER_OF_TDL of CO Taps in output, selectable as AsyncInput delayed not inverted
    signal	CO_Taps_preTDL       :   PRE_TDL_ARRAY_TYPE;  --! NUMBER_OF_TDL of O Taps in output, selectable as AsyncInput delayed and inverted
    
    signal	O_Taps_TDL           :   TDL_ARRAY_TYPE;      --! NUMBER_OF_TDL of CO Taps PRE-TDL in output, selectable as AsyncInput delayed not inverted
    signal	O_Taps_preTDL        :   PRE_TDL_ARRAY_TYPE;  --! NUMBER_OF_TDL of O Taps PRE-TDL in output, selectable as AsyncInput delayed and inverted
    
    signal  Taps_DSP           :  TDL_ARRAY_TYPE;         --! NUMBER_OF_TDL of Taps in output
    signal  Taps_preDSP        :  PRE_TDL_ARRAY_TYPE;     --! NUMBER_OF_TDL of Taps PRE-TDL	in output
    
    ---------- Sampler of a generic TDL -----------

	-------- Async TDL ---------
	signal	AsyncTaps_TDL     :   TDL_ARRAY_TYPE;        --! NUMBER_OF_TDL of Async input Taps. Basically it is the overall number of taps (*NUMBER_OF_TDL* * *NUM_TAP_TDL*)
    signal	AsyncTaps_preTDL  :	  PRE_TDL_ARRAY_TYPE;    --! NUMBER_OF_TDL of Async input Taps. Basically it is the overall number of taps oF the PRE_TDL (*NUMBER_OF_TDL* * *NUM_TAP_PRE_TDL*)
    
   	-- Polarity of Async Input  --
	signal	Polarity			:	STD_LOGIC_VECTOR(0 to NUMBER_OF_TDL -1);     -- Polarity of the Input Logic (1 = AsyncInput is on Rising Edge, 0 = AsyncInput is on Falling Edge), one per TDL
	
	---- Sampled and Sync TDL ---
	signal	Valid_SampledTaps		:	STD_LOGIC_VECTOR(0 to NUMBER_OF_TDL -1);   --! NUMBER_OF_TDL Valids of the SampledTaps_TDL at clk. Basically it is a vector that contains the *NUMBER_OF_TDL* number of valids, coming from each TDL.
	signal	SampledTaps_TDL				:	SMP_TDL_ARRAY_TYPE;                    --! NUMBER_OF_TDL of Sampled Taps from the NUMBER_OF_TDL AsyncTaps_TDL, Synchronized to clk output Taps. Basically it is the overall number of Sampled taps (*NUMBER_OF_TDL* * *BIT_SMP_TDL*)
	
	-- AXI for tuning valid generation --
	signal 	ValidNumberOfTdl_int    :	INTEGER	RANGE	0	TO	NUMBER_OF_TDL -1	:=	VALID_NUMBER_OF_TDL_INIT; --! Valid chosen between the NUMBER_OF_TDL possible TDLs, initialized at *VALID_NUMBER_OF_TDL_INIT*. It is equal to *VALID_NUMBER_OF_TDL_INIT* in case of *DEBUG_MODE = FALSE*, instead if *DEBUG_MODE = TRUE* it is equal to *ValidNumberOfTdl*

begin

    ---------------------- COMPONENTS INSTANTIATION ----------------------------

	------ Virtual Tapped Delay-Line (TDL) Instantiation and Sampling ------
	Virtual_TDL : for I in 0 to NUMBER_OF_TDL -1 generate

		------------------ CARRY-TDL ----------------------
		--! \brief The *AXI4Stream_VirtualTDL_Wrapper* generates as many *CARRY_TDL	* as *NUMBER_OF_CARRY_CHAINS*.
		Gen_Carry_Chain : if I <= NUMBER_OF_CARRY_CHAINS -1 generate

			Inst_CARRY_TDL	:	CARRY_TDL
					generic map(

						XUS_VS_X7S      =>  XUS_VS_X7S,
						-------- Sim vs Impl ---------
						SIM_VS_IMP	=>	SIM_VS_IMP,

						CO_DELAY	=>	From_TimeMatrix_To_TimeArray(CO_DELAY_MATRIX, I),                -- for each TDL in parallel we assign the delay of the corresponding column of the .txt file
						O_DELAY		=>	From_TimeMatrix_To_TimeArray(CO_DELAY_MATRIX, I),
						----------------------------
						
						NUM_TAP_TDL		=>	NUM_TAP_TDL,
						NUM_TAP_PRE_TDL	=>  NUM_TAP_PRE_TDL

					)
					port map(

						AsyncInput	=>	AsyncInput,
						---- Tapped Delay-Line ------
						CO_Taps_TDL	=>	CO_Taps_TDL(I),
						O_Taps_TDL	=>	O_Taps_TDL(I),
						-----------------------------

						----PRE Tapped Delay-Line ------
						CO_Taps_preTDL	=>	CO_Taps_preTDL(I),
						O_Taps_preTDL	=>	O_Taps_preTDL(I)
					);
			
			
			--- (Procedure) Choose TDL between CO and O ---
			Choose_AsyncTaps_Carry (
				
				TYPE_TDL_ARRAY(I),													-- CO vs O Sampling	(Like a Generic)
				---------------------------------------------

				------------- Tapped Delay-Line --------------
				CO_Taps_TDL(I),															-- CO Taps in output, AsyncInput delayed not inverted	(like a Signal)
				O_Taps_TDL(I),															-- O Taps in output, AsyncInput delayed and inverted	(like a Signal)
				----------------------------------------------

				------ Async Tapped Delay-Line Input ---------
				AsyncTaps_TDL(I)

			);

			-- (Procedure) Choose PRE TDL between CO and O -
			Choose_AsyncTaps_Carry (

				TYPE_TDL_ARRAY(I),													-- CO vs O Sampling	(Like a Generic)
				---------------------------------------------

				------------- Tapped Delay-Line --------------
				CO_Taps_preTDL(I),															-- CO Taps in output, AsyncInput delayed not inverted	(like a Signal)
				O_Taps_preTDL(I),															-- O Taps in output, AsyncInput delayed and inverted	(like a Signal)
				----------------------------------------------

				------ Async Tapped Delay-Line Input ---------
				AsyncTaps_preTDL(I)	

				);


			---------- Sampler of a CARRY-TDL -----------
			--! \brief The *AXI4Stream_VirtualTDL_Wrapper* generates as many *CARRY_Sampler* as *NUMBER_OF_CARRY_CHAINS*

			Inst_CARRY_Sampler	:	CARRY_Sampler
				generic map(

					TYPE_TDL        =>   TYPE_TDL_ARRAY(I),
					
					DEBUG_MODE	    =>	 DEBUG_MODE,
					
					BUFFERING_STAGE =>   BUFFERING_STAGE,

					MIN_VALID_TAP_POS	=>	MIN_VALID_TAP_POS,
					STEP_VALID_TAP_POS	=>	STEP_VALID_TAP_POS,
					MAX_VALID_TAP_POS	=>	MAX_VALID_TAP_POS,

					VALID_POSITION_TAP_INIT	 => VALID_POSITION_TAP_INIT,

					NUM_TAP_TDL		=>	NUM_TAP_TDL,
					
					OFFSET_TAP_TDL	=>	OFFSET_TAP_TDL_ARRAY(I),

					BIT_SMP_TDL		=>	BIT_SMP_TDL,

					NUM_TAP_PRE_TDL			=>	NUM_TAP_PRE_TDL,

					BIT_SMP_PRE_TDL			=>	BIT_SMP_PRE_TDL

				)
				port map(

					reset   =>	reset,

					clk     =>	clk,

					AsyncTaps_TDL	=>	AsyncTaps_TDL(I),

					AsyncTaps_preTDL	=>	AsyncTaps_preTDL(I),

					Valid_SampledTaps_TDL	=>	Valid_SampledTaps(I),

					SampledTaps_TDL			=>	SampledTaps_TDL(I),

					PolarityIn			=>	PolarityIn,

					PolarityOut			=>	Polarity(I),

					ValidPositionTap	=>	ValidPositionTap

				);

		end generate;
		--------------------------------------------

		------------------ DSP-TDL ----------------------
		--! \brief The *AXI4Stream_VirtualTDL_Wrapper* generates as many *DSP_TDL	* as *NUMBER_OF_DSP_CHAINS*.
		Gen_DSP_Chain: if I > NUMBER_OF_CARRY_CHAINS -1 generate
	
			Inst_TDL : DSP_TDL
					generic map(

						XUS_VS_X7S      =>  XUS_VS_X7S,
						NUM_TAP_TDL		=>	NUM_TAP_TDL,
						NUM_TAP_PRE_TDL	=>  NUM_TAP_PRE_TDL
						----------------------------

						)
					port map(
						-------- Async Input --------
						clk    =>   clk,
						
						AsyncInput	=>	AsyncInput,
						-----------------------------

						---- Tapped Delay-Line ------
						Taps_TDL	=>	Taps_DSP(I),
						
						Taps_preTDL	=>	Taps_preDSP(I)
						
						);
			
			--- (Procedure) Assign TDL Taps ---
			Choose_AsyncTaps_DSP (


					Taps_DSP(I),

					AsyncTaps_TDL(I)

			);

			--- (Procedure) Assign PRE-TDL Taps ---
			Choose_AsyncTaps_DSP (


					Taps_preDSP(I),

					AsyncTaps_preTDL(I)

			);

			
			---------- Sampler of a DSP-TDL -----------
			--! \brief The *AXI4Stream_VirtualTDL_Wrapper* generates as many *DSP_Sampler* as *NUMBER_OF_DSP_CHAINS*

			Inst_DSP_Sampler	:	DSP_Sampler
				generic map(

					DEBUG_MODE	 =>	 DEBUG_MODE,
					---------------------------
					MIN_VALID_TAP_POS	=>	MIN_VALID_TAP_POS,
					STEP_VALID_TAP_POS	=>	STEP_VALID_TAP_POS,
					MAX_VALID_TAP_POS	=>	MAX_VALID_TAP_POS,
					---------------------------

					VALID_POSITION_TAP_INIT	 => VALID_POSITION_TAP_INIT,
					
					NUM_TAP_TDL		=>	NUM_TAP_TDL,
					
					BIT_SMP_TDL		=>	BIT_SMP_TDL,

					NUM_TAP_PRE_TDL			=>	NUM_TAP_PRE_TDL,
					BIT_SMP_PRE_TDL			=>	BIT_SMP_PRE_TDL
					----------------------------------------------
					
				)
				port map(
					------------------ Reset/Clock ---------------
					reset   =>	reset,
					------------------------
					clk     =>	clk,
					------------------------
					----------------------------------------------

					------ Async Tapped Delay-Line Input ---------
					AsyncTaps_TDL	=>	AsyncTaps_TDL(I),
					AsyncTaps_preTDL	=>	AsyncTaps_preTDL(I),
					----------------------------------------------
					SampledTaps_TDL			=>	SampledTaps_TDL(I),
					
					Valid_SampledTaps_TDL	=>	Valid_SampledTaps(I),
					----------------------------------------------
					PolarityIn  => PolarityIn,
					PolarityOut => Polarity(I),
					
					ValidPositionTap	=>	ValidPositionTap
					----------------------------------------------


				);
		end generate;
	end generate;


	---------- Select the Valid and Create the AXI4 Stream -----------
	--------- Choose Valid_SampledTaps_TDL ---------
	 m00_axis_undeco_tvalid	<=	Valid_SampledTaps(ValidNumberOfTdl_int);

	------- Choose the Polarity in Output --------
	-- The MSB NUMBER_OF_TDL*BIT_SMP_TDL of m00_axis_undeco_tdata is used for the polarity
	-- We select the polarity related to the selected valid (no difference should be happens)
	m00_axis_undeco_tdata(1 + NUMBER_OF_TDL*BIT_SMP_TDL -1)	<=  Polarity(ValidNumberOfTdl_int);

	---- (Procedure) Conv SampledTaps in Undeco ----
	-- The LSBs NUMBER_OF_TDL*BIT_SMP_TDL-1 DOWNTO 0 of m00_axis_undeco_tdata are for the thermometric Codes of TDLs
	From_SampledTaps_to_Undeco
	(
		BIT_SMP_TDL,
		SampledTaps_TDL,
		m00_axis_undeco_tdata(NUMBER_OF_TDL*BIT_SMP_TDL-1 DOWNTO 0)

	);

	------ AXI4-Slave Interfaces Valid Tuning -----
	ValidDebug : if DEBUG_MODE = TRUE generate

		ValidNumberOfTdl_int	<= to_integer(unsigned(ValidNumberOfTdl));

	end generate;


end Behavioral;