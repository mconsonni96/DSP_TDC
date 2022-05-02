--------------------------------------------------------------------------------------------------------------------------
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

--------------------------BRIEF PACKAGE DESCRIPTION ----------------------------
--! \file
--! \brief In this file we find the functions and procedures used in the TappedDelayLine.
--------------------------------------------------------------------------------




------------------------------ LIBRARY DECLARATION ------------------------------

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


-- ------------ LOCAL LIBRARY ---------
-- --! Project defined libary
--library work;
--	------ Tapped Delay-line --------
--	use work.LocalPackage_TDL.all;
-- ------------------------------------

--------------------------------------------------------------------------------




package LocalPackage_TDL is

	-------------------------- CONSTANTS DECLARATION ---------------------------

	------------- Maximum Range TDLs ---------------
	-- Max number of TAPs allowed
	CONSTANT	MAX_NUMBER_OF_TAP	:	INTEGER	:=	4096 + 1024;					--! Max number of TAPs allowed

	-- Max number of TDLs allowed
	CONSTANT	MAX_NUMBER_OF_CARRY_CHAINS	:	INTEGER	:=	16;							--! Max number of TDLs allowed
	------------------------------------------------


	--------------------------- TYPES DECLARATION ------------------------------

	--------------- Type for TDLs -----------------
    subtype CO_VS_O_STRING is string(1 TO 1);																--! Type of TDL in CARRY8(4) for Xilinx UltraScale (7-Series)

	-- Array of CO_VS_O_STRING, one for each TDL
	type CO_VS_O_ARRAY_STRING	is array (0 to MAX_NUMBER_OF_CARRY_CHAINS -1) of  CO_VS_O_STRING; --(0 TO MAX_NUMBER_OF_TDL-1)	of	CO_VS_O_STRING;						--! Type used to make more compact the definition of the kind of output (CO or O) of each one of the TDLs in parallel.

	-- Array of OFFSET_TAP_TDL, one for each TDL
	type OFFSET_TAP_TDL_ARRAY_TYPE	is array (0 to MAX_NUMBER_OF_CARRY_CHAINS -1)	of	NATURAL	RANGE 0 TO 2047;


    


	-------- FUNCTIONS AND PROCEDURES FOR XUS(X7S)_TAPPED_DELAY_LINE_CARRY8(4) ---------

	------- Compute the Number of Carry Blocks ------
	--! \brief This function is used in the *XUS(X7S)_TappedDelayLine_CARRY8(4)* module in order to compute how many basic blocks *CARRY8(4)* have to be chained in order to get the TDL.
	--! Given in input the *NUM_TAP_TDL* and *BIT_CARRY_BLOCK*, the function first computes the integer number of *NUM_CARRY_BLOCK* by dividing the previous values.
	--! Then in case the division brings to a residual larger than zero,
	--! the function increments  *NUM_CARRY_BLOCK* block by 1, in order to reach the following integer number.
	--! In the case the division provides '0', it is enough just 1 *CARRY8(4)* block.

	function Compute_Num_DSP (


		num_tap_tdl		:	integer;
		bit_dsp	:	positive


	) return integer ;
	
	
	function Compute_NumCarryBlock (

		------ TDL Dimension ------
		num_tap_tdl		:	integer;
		bit_carry_block	:	positive
		---------------------------

	) return integer ;
	------------------------------------------------


	----------------------------------------------------------------------------



	--------------- FUNCTIONS AND PROCEDURES FOR SAMPLING TDL ------------------

	---------- Sampling properly the TDL -------------
	--! \brief This function is used in the *Sampler_TDL* module in order to manage the position of the flip flops at the output of each buffer and so deciding where we have to sample the data.
	--! Indeed, given in input *NUM_TAP_TDL*, *OFFSET_TAP_TDL*, *BIT_SMP_TDL*, the signal at the output of each buffer *AsyncTaps_TDL*,
	--! the function first computes the *step_tap_tdl* with which we want to sample by dividing *NUM_TAP_TDL* by *BIT_SMP_TDL* and approximates the result by defect. In case the result of the division is 0, we set the *step_tap_tdl* to 1,
	--! which means that we sample the output of each buffer.
	--! Then the function initializes the outputs of the flip flops to 0 if we are looking for the outputs C0 or to 1 if we are looking for the outputs O. Then the function manages the offset according to the *step_tap_tdl*: in the case that *OFFSET_TAP_TDL* >= *step_tap_tdl*
	--! we have to refold back the chain, because if *OFFSET_TAP_TDL* is a big number,
	--! it means that with some Flip flops we exceed the *NUM_TAP_TDL* length, because we would start putting FFs maybe at the end of the chain and the FF that are pushed above the length of the chain would be lost. In order to not loose them,
	--! we have to rebring them at the beginning of the chain, and so positioning all the needed flip flops.
	--! To do that the function sets *OFFSET_TAP_TDL* to the value of *OFFSET_TAP_TDL* / *step_tap_tdl*. In this way we limit the maximum *OFFSET_TAP_TDL* according to the *BIT_SMP_TDL* and to the *step_tap_tdl*.
	--! Instead if *OFFSET_TAP_TDL* < *step_tap_tdl* we keep the same *OFFSET_TAP_TDL*. Finally, the function positions 1 flip flop (*SampledTaps*)  correctly every *step_tap_tdl* starting from the position *OFFSET_TAP_TDL*.
	--! In the following figure we see how the chain is built and what happens when we have a too big *OFFSET_TAP_TDL*, and so folding is needed.
	--! \image html OFFSET.png

	function Sample_AsyncTapsCarry (

		------- Select Types ------
		type_tdl	:	string;
		---------------------------

		------ Sampler Dim -------
		num_tap_tdl		:	positive;
		offset_tap_tdl	:	natural;
		bit_smp_tdl		:	positive;
		---------------------------
		--------- Pre TDL ---------
		bit_smp_pre_tdl		:	integer;
		num_tap_pre_tdl		:	integer;
		---------------------------

		--------- Async TDL -------
		AsyncTaps_preTDL	:	std_logic_vector;
		AsyncTaps_TDL		:	std_logic_vector
		---------------------------

	) return std_logic_vector ;
	------------------------------------------------
    
    
    function Sample_AsyncTapsDSP (

		------ Sampler Dim -------
		num_tap_tdl		:	positive;
--		offset_tap_tdl	:	natural;
		bit_smp_tdl		:	positive;
		---------------------------
		--------- Pre TDL ---------
		bit_smp_pre_tdl		:	integer;
		num_tap_pre_tdl		:	integer;
		---------------------------

		--------- Async TDL -------
		AsyncTaps_preTDL	:	std_logic_vector;
		AsyncTaps_TDL		:	std_logic_vector
		---------------------------

	) return std_logic_vector ;
	------ Wrap the ValidPosition_SampledTaps ------
	--! \brief This function is used in the *Sampler_TDL* module in order to find a vector (*ValidPosition_SampledTaps*) containing the values of *SampledTaps_TDL* but not all the values, only the values of *SampledTaps_TDL* in the positions where we want to search for the Valid signal.
	--! It takes in input *MIN_VALID_TAP_POS*, *STEP_VALID_TAP_POS* , *MAX_VALID_TAP_POS* and the sampled data *SampledTaps_TDL*.
	--! First the function computes how many "good" positions we have by dividing (*MAX_VALID_TAP_POS* - *MIN_VALID_TAP_POS* +1) and *STEP_VALID_TAP_POS*.
	--! Then the function writes in *ValidPosition_SampledTaps* the values contained in the positions that we are looking for of *SampledTaps_TDL* starting from the value at the position *MIN_VALID_TAP_POS*, and stepping by *step_tap_tdl* until we reach the position *MAX_VALID_TAP_POS*.
	--! In the following figure we see that we take the values of *Sampler_TDL*,
	--! but only in some determined positions, and we save them in *ValidPosition_SampledTaps*.
	--! \image html VALID.png

	function Compute_ValidPositionSampledTapsTDL (

		------ Valid Gen Pos ------
		min_valid_pos	:	integer;
		step_valid_pos	:	positive;
		max_valid_pos	:	natural;
		---------------------------
		------ Valid Gen Pos ------
		bit_smp_pre_tdl	: integer;
		---------------------------

		------- Sampled TDL -------
		SampledTaps_TDL	:	std_logic_vector
		---------------------------

	) return std_logic_vector;
	------------------------------------------------

	------- Compute the Valid_SampledTaps_TDL ------
	--! \brief This function is used in the *Sampler_TDL* module in order to compute the overall Valid signal *m00_axis_undeco_tvalid*, that has to last just 1 clock cycle.
    --! This function takes in input which outputs we are interested in (*TYPE_TDL*), so CO or O, and the signals *RiseValid* and *FallValid*.
    --! *Risevalid* is the value of *ValidPosition_SampledTaps* chosen at the *ValidPositionTap*. *FallValid* is a signal chosen in such a way that
	--! the *m00_axis_undeco_tvalid* will last just 1 clock cycle. If *TYPE_TDL* = "C", then if *RiseValid* = '1' and *FallValid* = '0', it means that we have read a '1',
	--! so the *m00_axis_undeco_tvalid* must be '1'. Otherwise it will remain at '0'.
    --! Instead if *TYPE_TDL* = 'O', then if then if *RiseValid* = '0' and *FallValid* = '1', it means that we have read a '1' at the output CO,
	--! so the *m00_axis_undeco_tvalid* must be '1'. Otherwise it will remain at '0'.

	function Compute_ValidSampledTapsCarry (

		------- Select Types ------
		type_tdl	:	string;
		---------------------------

		---- Valid Gen Signals ----
		RiseValid	:	std_logic;
		FallValid	:	std_logic
		---------------------------


	) return std_logic ;
	------------------------------------------------
    
    function Compute_ValidSampledTapsDSP (

		---- Valid Gen Signals ----
		RiseValid	:	std_logic;
		FallValid	:	std_logic
		---------------------------


	) return std_logic ;
	----------------------------------------------------------------------------


	---- FUNCTIONS AND PROCEDURES FOR AXI4 STREAM XUS(X7S) VIRTUAL TDL WRAPPER ------

	---- CO vs O CARRY8(4) Taps in Xilinx UltraScale (7-Series) ---
	--! \brief This procedure is used in the *AXI4Stream_XUS(X7S)_VirtualTDLWrapper* module in order to select the CO outputs of each buffer or the O output of each buffer.
	--! It takes in input *TYPE_TDL*, *CO_Taps* and *O_Taps* and gives in output *AsyncTaps_TDL*.
	--! If *TYPE_TDL* = "C" it associates to *AsyncTaps_TDL* the outputs *CO_Taps*.
	--! If *TYPE_TDL* = "O" it associates to *AsyncTaps_TDL* the outputs *O_Taps*.

	procedure	Choose_AsyncTaps_Carry (

		---------------- Select Types ---------------
		type_tdl	:	string;															-- CO vs O Sampling	(Like a Generic)
		---------------------------------------------

		------------- Tapped Delay-Line --------------
		signal	CO_Taps	:	IN	STD_LOGIC_VECTOR;										-- CO Taps in output, AsyncInput delayed not inverted	(like a Signal)
		signal	O_Taps	:	IN	STD_LOGIC_VECTOR;										-- O Taps in output, AsyncInput delayed and inverted	(like a Signal)
		----------------------------------------------

		------ Async Tapped Delay-Line Outputs ---------
		signal	AsyncTaps_TDL	:	OUT	STD_LOGIC_VECTOR								-- Async Taps

		----------------------------------------------

	);
	-----------------------------------------------
    
    procedure	Choose_AsyncTaps_DSP (


		signal	Taps	:	IN	STD_LOGIC_VECTOR;										
		
		signal	AsyncTaps_TDL	:	OUT	STD_LOGIC_VECTOR								

		----------------------------------------------

	);

	

end LocalPackage_TDL;


package body LocalPackage_TDL is


	-------- FUNCTIONS AND PROCEDURES FOR XUS(X7S)_TAPPED_DELAY_LINE_CARRY8(4) ---------

	------- Compute the Number of Carry Blocks ------
	--! Description of the signals of the procedure:
	--! \param num_tap_tdl Bits of the TDL (number of buffers in the TDL)
	--! \param bit_carry_block Bits inside the primitive (carry block)

	function Compute_Num_DSP (


		num_tap_tdl		:	integer;
		bit_dsp	:	positive


	) return integer is

		 variable  num_dsp : integer;

	begin

		 num_dsp := integer(num_tap_tdl)/integer(bit_dsp);

		 if (integer(num_tap_tdl) mod integer(bit_dsp)) > 0 then
			 num_dsp := num_dsp + 1;
		 end if;

		 return integer(num_dsp);
	end function;
	
	
	function Compute_NumCarryBlock (

		------ TDL Dimension ------
		num_tap_tdl		:	integer;
		bit_carry_block	:	positive
		---------------------------

	) return integer is

		variable	num_carry_block	:	integer;

	begin

		-- Compute the Number of Carry Blocks required, aproximated by defect
		num_carry_block	:= integer(num_tap_tdl)/integer(bit_carry_block);

		-- If this is not a perfect division, add one block more
		if (integer(num_tap_tdl) mod integer(bit_carry_block)) > 0 then
			num_carry_block	:=	num_carry_block + 1;
		end if;

		return	integer(num_carry_block);
	end function;
	------------------------------------------------

	----------------------------------------------------------------------------


	--------------- FUNCTIONS AND PROCEDURES FOR SAMPLING TDL ------------------

	------------------- PARAMETER DESCRIPTION ---------------------

	----------------------------------------------------------------------------

	---------- Sampling properly the TDL -------------
	--! Description of the signals of the procedure:
	--! \param type_tdl CO vs O Sampling
	--! \param num_tap_tdl Bits of the TDL (number of buffers in the TDL)
	--! \param offset_tap_tdl The TDL is sampled with an initial offset of bit with respect to the Tap step of *NUM_TAP_TDL*/*BIT_SMP_TDL*
	--! \param bit_smp_tdl Bits Sampled from the TDL each *NUM_TAP_TDL* / *BIT_SMP_TDL* after OFFSET_TAP_TDL, obviously equal in all TDLs. Basically it is the number of Flip Flops
	--! \param bit_smp_pre_tdl Bits sampled from the PRE-TDL taps
	--! \param num_tap_pre_tdl Taps of the PRE-TDL
	--! \param AsyncTaps_TDL AsyncTaps

	function Sample_AsyncTapsCarry (

		------- Select Types ------
		type_tdl		:	string;
		---------------------------

		------ Sampler Dim --------
		num_tap_tdl		:	positive;
		offset_tap_tdl	:	natural;
		bit_smp_tdl		:	positive;
		---------------------------

		--------- Pre TDL ---------
		bit_smp_pre_tdl		:	integer;
		num_tap_pre_tdl		:	integer;
		---------------------------

		--------- Async TDL -------
		AsyncTaps_preTDL	:	std_logic_vector;
		AsyncTaps_TDL		:	std_logic_vector
		---------------------------

	) return std_logic_vector is

		variable	step_tap_tdl		:	integer;
		Variable	step_tap_pre_tdl	:	integer;
		variable	offset_tap_tmp	    :	integer;


		variable	SampledTaps_preTDL_tmp	:	std_logic_vector(bit_smp_pre_tdl -1 downto 0);
		variable	SampledTaps_TDL_tmp		:	std_logic_vector(bit_smp_tdl -1 downto 0);

		variable	SampledTaps_tmp			:	std_logic_vector(bit_smp_tdl + bit_smp_pre_tdl -1 downto 0);

	begin

		-- Step used to sample the tdl, approximated by defect
		step_tap_tdl		:=	integer(num_tap_tdl)/integer(bit_smp_tdl);

		if bit_smp_pre_tdl > 0 then
			step_tap_pre_tdl	:=	integer(num_tap_pre_tdl)/integer(bit_smp_pre_tdl);
		else
			step_tap_pre_tdl	:=	0;
		end if;




		-- If NUM_TAP_TDL < BIT_SMP_TDL we have to sample all the Taps
		if step_tap_tdl = 0 then
			step_tap_tdl := 1;
		end if;

		if step_tap_pre_tdl = 0 then
			step_tap_pre_tdl := 1;
		end if;

		-- Initialization of the SampledTaps_tmp required by the type_tdl
		-- In this way the cells that are not sampled are set at the default value
		if type_tdl = "C" then
			SampledTaps_tmp	:= (Others => '0');

		elsif type_tdl = "O"  then
			SampledTaps_tmp	:= (Others => '1');

		end if;


		-- Sampling of the BIT_SMP_PRE_TDL from the NUM_TAP_PRE_TDL AsyncTaps_preTDL
		for I in 0 to bit_smp_pre_tdl -1 loop
			SampledTaps_preTDL_tmp(I)	:=	AsyncTaps_preTDL(I*step_tap_pre_tdl);
		end loop;





		-- Sampling of the BIT_SMP_TDL from the NUM_TAP_TDL AsyncTaps_TDL, starting from OFFSET_TAP_TDL each step_tap_tdl
		for I in 0 to bit_smp_tdl -1 loop

			-- Resize Offset
			if offset_tap_tdl >= step_tap_tdl then
				offset_tap_tmp	:=	offset_tap_tdl mod step_tap_tdl;
			else
				offset_tap_tmp	:=	offset_tap_tdl;
			end if;

			if I*step_tap_tdl + offset_tap_tmp < num_tap_tdl + num_tap_pre_tdl then
				SampledTaps_TDL_tmp(I)	:=	AsyncTaps_TDL(I*step_tap_tdl + offset_tap_tmp);
			end if;

		end loop;


		SampledTaps_tmp	:=	SampledTaps_TDL_tmp & SampledTaps_preTDL_tmp;

		return	SampledTaps_tmp;

	end function;
	------------------------------------------------
    
    
    function Sample_AsyncTapsDSP (

		------ Sampler Dim --------
		num_tap_tdl		:	positive;
--		offset_tap_tdl	:	natural;
		bit_smp_tdl		:	positive;
		---------------------------

		--------- Pre TDL ---------
		bit_smp_pre_tdl		:	integer;
		num_tap_pre_tdl		:	integer;
		---------------------------

		--------- Async TDL -------
		AsyncTaps_preTDL	:	std_logic_vector;
		AsyncTaps_TDL		:	std_logic_vector
		---------------------------

	) return std_logic_vector is

		variable	step_tap_tdl		:	integer;
		Variable	step_tap_pre_tdl	:	integer;
--		variable	offset_tap_tmp	    :	integer;


		variable	SampledTaps_preTDL_tmp	:	std_logic_vector(bit_smp_pre_tdl -1 downto 0);
		variable	SampledTaps_TDL_tmp		:	std_logic_vector(bit_smp_tdl -1 downto 0);

		variable	SampledTaps_tmp			:	std_logic_vector(bit_smp_tdl + bit_smp_pre_tdl -1 downto 0);

	begin

		-- Step used to sample the tdl, approximated by defect
		step_tap_tdl		:=	integer(num_tap_tdl)/integer(bit_smp_tdl);

		if bit_smp_pre_tdl > 0 then
			step_tap_pre_tdl	:=	integer(num_tap_pre_tdl)/integer(bit_smp_pre_tdl);
		else
			step_tap_pre_tdl	:=	0;
		end if;




		-- If NUM_TAP_TDL < BIT_SMP_TDL we have to sample all the Taps
		if step_tap_tdl = 0 then
			step_tap_tdl := 1;
		end if;

		if step_tap_pre_tdl = 0 then
			step_tap_pre_tdl := 1;
		end if;

		SampledTaps_tmp	:= (Others => '1');

		for I in 0 to bit_smp_pre_tdl -1 loop
			SampledTaps_preTDL_tmp(I)	:=	AsyncTaps_preTDL(I*step_tap_pre_tdl);
		end loop;





		-- Sampling of the BIT_SMP_TDL from the NUM_TAP_TDL AsyncTaps_TDL, starting from OFFSET_TAP_TDL each step_tap_tdl
		for I in 0 to bit_smp_tdl -1 loop

--			-- Resize Offset
--			if offset_tap_tdl >= step_tap_tdl then
--				offset_tap_tmp	:=	offset_tap_tdl mod step_tap_tdl;
--			else
--				offset_tap_tmp	:=	offset_tap_tdl;
--			end if;

--			if I*step_tap_tdl + offset_tap_tmp < num_tap_tdl + num_tap_pre_tdl then
--				SampledTaps_TDL_tmp(I)	:=	AsyncTaps_TDL(I*step_tap_tdl + offset_tap_tmp);
--			end if;
			if I*step_tap_tdl < num_tap_tdl + num_tap_pre_tdl then
				SampledTaps_TDL_tmp(I)	:=	AsyncTaps_TDL(I*step_tap_tdl);
			end if;

		end loop;


		SampledTaps_tmp	:=	SampledTaps_TDL_tmp & SampledTaps_preTDL_tmp;

		return	SampledTaps_tmp;

	end function;

	------ Wrap the ValidPosition_SampledTaps ------
	--! Description of the signals of the procedure:
	--! \param min_valid_pos Minimal position inside SampledTaps used by *ValidPositionTap* to extract the valid
	--! \param step_valid_pos Step used between *MAX_VALID_TAP_POS* and *MIM_VALID_POS* for assigned ValidPositionTap
	--! \param max_valid_pos Maximal position inside SampledTaps used by *ValidPositionTap* to extract the valid
	--! \param bit_smp_pre_tdl Number of bits sampled from the TDL
	--! \param SampledTaps_TDL Sampled data from both the preTDL and TDL


	function Compute_ValidPositionSampledTapsTDL (

		------ Valid Gen Pos ------
		min_valid_pos	:	integer;
		step_valid_pos	:	positive;
		max_valid_pos	:	natural;
		---------------------------
		------ Valid Gen Pos ------
		bit_smp_pre_tdl	: integer;
		---------------------------

		------- Sampled TDL -------
		SampledTaps_TDL	:	std_logic_vector
		---------------------------

	) return std_logic_vector is

		variable	ValidPosition_SampledTaps_lng	:	integer;
		variable	ValidPosition_SampledTaps_mod	:	integer;
		variable	ValidPosition_SampledTaps_tmp	:	std_logic_vector(SampledTaps_TDL'RANGE);


	begin

		-- Define the LENGTH of ValidPosition_SampledTaps
		ValidPosition_SampledTaps_lng	:=	integer(max_valid_pos - min_valid_pos +1)/integer(step_valid_pos);
		--Define the rest of the division
		ValidPosition_SampledTaps_mod  :=  integer(max_valid_pos - min_valid_pos +1) mod integer(step_valid_pos);

		if ValidPosition_SampledTaps_lng = 0 then
			ValidPosition_SampledTaps_lng := 1;
		end if;

		--In case the division gives a rest, we have to add another flip flop
		if ValidPosition_SampledTaps_mod > 0 then
			ValidPosition_SampledTaps_lng := ValidPosition_SampledTaps_lng +1;
		end if;

		-- Move the SampledTaps_TDL between max_valid_pos downto min_valid_pos with step step_valid_pos into ValidPosition_SampledTaps
		for I in 0 to ValidPosition_SampledTaps_lng-1 loop

			if I*step_valid_pos + min_valid_pos <= max_valid_pos then
				ValidPosition_SampledTaps_tmp(I)	:=	SampledTaps_TDL(I*step_valid_pos + min_valid_pos + bit_smp_pre_tdl);
			end if;

		end loop;


		return	ValidPosition_SampledTaps_tmp(ValidPosition_SampledTaps_lng-1 downto 0);

	end function;
	------------------------------------------------

	------- Compute the Valid_SampledTaps_TDL ------
	--! Description of the signals of the procedure:
	--! \param type_tdl CO vs O Sampling
	--! \param RiseValid Value of the bit in *ValidPosition_SampledTaps* chosen by the *ValidPositionTap*
	--! \param FallValid Signal chosen in such a way that the *m00_axis_undeco_tvalid* will last just 1 clock cycle

	function Compute_ValidSampledTapsCarry (

		------- Select Types ------
		type_tdl	:	string;
		---------------------------

		---- Valid Gen Signals ----
		RiseValid	:	std_logic;
		FallValid	:	std_logic
		---------------------------

	) return std_logic is

		variable	valid_tmp	:std_logic;

	begin

		if type_tdl = "C" then

			if RiseValid = '1' and  FallValid = '0' then
				valid_tmp	:=	'1';
			else
				valid_tmp	:=	'0';
			end if;

		elsif type_tdl = "O"  then

			if RiseValid = '0' and  FallValid = '1' then
				valid_tmp	:=	'1';
			else
				valid_tmp	:=	'0';
			end if;

		end if;


		return	valid_tmp;

	end function;
	------------------------------------------------

    
    function Compute_ValidSampledTapsDSP (

		---- Valid Gen Signals ----
		RiseValid	:	std_logic;
		FallValid	:	std_logic
		---------------------------

	) return std_logic is

		variable	valid_tmp	:std_logic;

	begin

		if RiseValid = '0' and  FallValid = '1' then
			valid_tmp	:=	'1';
		else
			valid_tmp	:=	'0';
		end if;

	    return	valid_tmp;

	end function;

	----------------------------------------------------------------------------



	---- FUNCTIONS AND PROCEDURES FOR AXI4 STREAM XUS(X7S) VIRTUAL TDL WRAPPER ------

	---- CO vs O CARRY8(4) Taps in Xilinx UltraScale ---
	--! Description of the signals of the procedure:
	--! \param type_tdl CO vs O Sampling
	--! \param CO_Taps CO Taps in output, AsyncInput delayed not inverted
	--! \param O_Taps O Taps in output, AsyncInput delayed and inverted
	--! \param AsyncTaps_TDL Async Taps

	procedure	Choose_AsyncTaps_Carry (

		---------------- Select Types ---------------
		type_tdl	:	string;													-- CO vs O Sampling	(Like a Generic)
		---------------------------------------------

		------------- Tapped Delay-Line --------------
		signal	CO_Taps	:	IN	STD_LOGIC_VECTOR;								-- CO Taps in output, AsyncInput delayed not inverted
		signal	O_Taps	:	IN	STD_LOGIC_VECTOR;								-- O Taps in output, AsyncInput delayed and inverted
		----------------------------------------------

		------ Async Tapped Delay-Line Input ---------
		signal	AsyncTaps_TDL	:	OUT	STD_LOGIC_VECTOR						-- Async Taps

		----------------------------------------------

	) is

	begin

		-- Choose TDL between CO and O Taps of CARRY8(4) in Xilinx UltraScale (7-Series)
		if type_tdl = "C" then
			AsyncTaps_TDL	<=	CO_Taps;

		elsif type_tdl = "O" then
			AsyncTaps_TDL 	<=	O_Taps;


		end if;


	end procedure;
	-----------------------------------------------
    
    
    procedure	Choose_AsyncTaps_DSP (

		signal	Taps	:	IN	STD_LOGIC_VECTOR;								
		
		signal	AsyncTaps_TDL	:	OUT	STD_LOGIC_VECTOR						-- Async Taps

		----------------------------------------------

	) is

	begin

		AsyncTaps_TDL	<=	Taps;

	end procedure;
	
end LocalPackage_TDL;
