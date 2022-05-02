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

	use work.LocalPackage_TDL.all;
------------------------------------

--------------------------------------------------------------------------------




entity AXI4Stream_VirtualTDL_Wrapper is

	generic (

        XUS_VS_X7S      :   STRING  := "XUS";
        
        TYPE_TDL_ARRAY		:	CO_VS_O_ARRAY_STRING	:= ("C", "O", Others => "C");
	
		DEBUG_MODE		:	BOOLEAN	:=	FALSE;

        NUMBER_OF_CARRY_CHAINS   :   NATURAL   RANGE 0 TO 16   := 4;

		NUMBER_OF_DSP_CHAINS     :   NATURAL    RANGE 0 TO 16   := 4;

		NUM_TAP_TDL		:	POSITIVE	RANGE 4 TO 4096	:= 512;
		
		BUFFERING_STAGE	:	BOOLEAN	:= TRUE;

		MIN_VALID_TAP_POS	:	INTEGER		:=	5;

		STEP_VALID_TAP_POS	:	POSITIVE	:=	3;

		MAX_VALID_TAP_POS	:	NATURAL		:=	7;

		VALID_POSITION_TAP_INIT		:	INTEGER	RANGE 0 TO 4095		:=	2;

		VALID_NUMBER_OF_TDL_INIT	:	INTEGER	RANGE 0 TO 15		:=	0;

		OFFSET_TAP_TDL_ARRAY	:	OFFSET_TAP_TDL_ARRAY_TYPE	:=	(1, Others => 0);
		
		BIT_SMP_TDL		     :	POSITIVE	RANGE 1 TO 1920	:= 512;

		NUM_TAP_PRE_TDL		 :	INTEGER	RANGE 0 TO 1024	:= 128;

		BIT_SMP_PRE_TDL		 :	INTEGER	RANGE 0 TO 1024	:= 128

	);


	port(

		reset	:	IN	STD_LOGIC;

		clk	    :	IN	STD_LOGIC;


		AsyncInput	:	IN	STD_LOGIC;

        PolarityIn	:	IN	STD_LOGIC;

		m00_axis_undeco_tvalid	:	OUT	STD_LOGIC;
		m00_axis_undeco_tdata	:	OUT	STD_LOGIC_VECTOR(1 + (NUMBER_OF_CARRY_CHAINS + NUMBER_OF_DSP_CHAINS)*BIT_SMP_TDL-1 DOWNTO 0);

		ValidPositionTap		:	IN	STD_LOGIC_VECTOR(31 DOWNTO 0)   := ( 1 => '1', Others => '0');

		ValidNumberOfTdl        :   IN  STD_LOGIC_VECTOR(31 DOWNTO 0)   := ( Others => '0')

	);


end AXI4Stream_VirtualTDL_Wrapper;


architecture Behavioral of AXI4Stream_VirtualTDL_Wrapper is

    
    type	CARRY_TDL_ARRAY_TYPE	is array (0 to NUMBER_OF_CARRY_CHAINS -1) of STD_LOGIC_VECTOR(NUM_TAP_TDL -1 downto 0);
    type	DSP_TDL_ARRAY_TYPE	is array (0 to NUMBER_OF_DSP_CHAINS -1) of STD_LOGIC_VECTOR(NUM_TAP_TDL -1 downto 0);

    type	CARRY_PRE_TDL_ARRAY_TYPE	is array (0 to NUMBER_OF_CARRY_CHAINS -1) of STD_LOGIC_VECTOR(NUM_TAP_PRE_TDL-1 downto 0);
    type	DSP_PRE_TDL_ARRAY_TYPE	is array (0 to NUMBER_OF_DSP_CHAINS -1) of STD_LOGIC_VECTOR(NUM_TAP_PRE_TDL-1 downto 0);

    type	SMP_CARRY_TDL_ARRAY_TYPE	is array (0 to NUMBER_OF_CARRY_CHAINS -1) of STD_LOGIC_VECTOR(BIT_SMP_TDL-1 downto 0);
    type	SMP_DSP_TDL_ARRAY_TYPE	is array (0 to NUMBER_OF_DSP_CHAINS -1) of STD_LOGIC_VECTOR(BIT_SMP_TDL-1 downto 0);
    type	SMP_TDL_ARRAY_TYPE	is array (0 to NUMBER_OF_CARRY_CHAINS + NUMBER_OF_DSP_CHAINS -1) of STD_LOGIC_VECTOR(BIT_SMP_TDL-1 downto 0);

    procedure	From_SampledTaps_to_Undeco (

		constant bit_smp_tdl		:	IN	POSITIVE;
		signal	SampledTaps_TDL_Carry	:	IN	SMP_CARRY_TDL_ARRAY_TYPE;
		signal	SampledTaps_TDL_DSP		:	IN	SMP_DSP_TDL_ARRAY_TYPE;
		signal	undeco_tdata		:	OUT	STD_LOGIC_VECTOR

	) is

		variable	number_of_carry	:	integer	:=	SampledTaps_TDL_Carry'LENGTH;
		variable    number_of_dsp   :   integer :=  SampledTaps_TDL_DSP'LENGTH;
		
		variable	undeco_tmp_carry		:	std_logic_vector(number_of_carry*bit_smp_tdl-1 downto 0);
		variable	undeco_tmp_dsp  		:	std_logic_vector(number_of_dsp*bit_smp_tdl-1 downto 0);


	begin

		for I in 0 to number_of_carry-1 loop

			undeco_tmp_carry((I+1)*bit_smp_tdl -1 downto I*bit_smp_tdl)	:=	SampledTaps_TDL_Carry(I)(bit_smp_tdl -1 downto 0);

		end loop;
		
		for I in 0 to number_of_dsp-1 loop

			undeco_tmp_dsp((I+1)*bit_smp_tdl -1 downto I*bit_smp_tdl)	:=	SampledTaps_TDL_DSP(I)(bit_smp_tdl -1 downto 0);

		end loop;

		undeco_tdata	<=	undeco_tmp_dsp & undeco_tmp_carry;

	end procedure;

	component CARRY_TDL is
	generic (

		XUS_VS_X7S   :  STRING := "XUS";
		
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
		OFFSET_TAP_TDL		:	NATURAL		RANGE 0 TO 2047	:= 0;						--! The TDL is sampled with an initial offset of bit with respect to the Tap step of NUM_TAP_TDL/BIT_SMP_TDL

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

	component DSP_Sampler is
	generic (

		DEBUG_MODE	      	:	BOOLEAN	:=	FALSE;

		MIN_VALID_TAP_POS	:	INTEGER		:=	5;
		STEP_VALID_TAP_POS	:	POSITIVE	:=	3;
		MAX_VALID_TAP_POS	:	NATURAL		:=	7;

		VALID_POSITION_TAP_INIT		:	INTEGER	RANGE 0 TO 4095		:=	2;

		NUM_TAP_TDL			:	POSITIVE	RANGE 4 TO 4096	:= 96;
        OFFSET_TAP_TDL		:	NATURAL		RANGE 0 TO 4096	:= 0;
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
	
	

    signal	CO_Taps_TDL          :   CARRY_TDL_ARRAY_TYPE;
    signal	CO_Taps_preTDL       :   CARRY_PRE_TDL_ARRAY_TYPE;
    
    signal	O_Taps_TDL           :   CARRY_TDL_ARRAY_TYPE;
    signal	O_Taps_preTDL        :   CARRY_PRE_TDL_ARRAY_TYPE;
    
    signal  Taps_DSP           :  DSP_TDL_ARRAY_TYPE;
    signal  Taps_preDSP        :  DSP_PRE_TDL_ARRAY_TYPE;
    
    signal	AsyncTaps_TDL_Carry     :   CARRY_TDL_ARRAY_TYPE;
    signal	AsyncTaps_preTDL_Carry  :	CARRY_PRE_TDL_ARRAY_TYPE;
    
    signal	AsyncTaps_TDL_DSP     :   DSP_TDL_ARRAY_TYPE;
    signal	AsyncTaps_preTDL_DSP  :	  DSP_PRE_TDL_ARRAY_TYPE;

	signal	Polarity_Carry			:	STD_LOGIC_VECTOR(0 to NUMBER_OF_CARRY_CHAINS -1);
	signal	Polarity_DSP			:	STD_LOGIC_VECTOR(0 to NUMBER_OF_DSP_CHAINS -1);

	signal	Valid_SampledTaps_Carry		:	STD_LOGIC_VECTOR(0 to NUMBER_OF_CARRY_CHAINS -1);
	signal	Valid_SampledTaps_DSP		:	STD_LOGIC_VECTOR(0 to NUMBER_OF_DSP_CHAINS -1);

	signal	SampledTaps_TDL_Carry				:	SMP_CARRY_TDL_ARRAY_TYPE;
	signal	SampledTaps_TDL_DSP 				:	SMP_DSP_TDL_ARRAY_TYPE;

	signal 	ValidNumberOfTdl_int    :	INTEGER	RANGE	0	TO	NUMBER_OF_CARRY_CHAINS + NUMBER_OF_DSP_CHAINS -1	:=	VALID_NUMBER_OF_TDL_INIT;

begin

    Virtual_Carry_Chain : for I in 0 to NUMBER_OF_CARRY_CHAINS -1 generate

		Inst_CARRY_TDL	:	CARRY_TDL
				generic map(

					XUS_VS_X7S      =>  XUS_VS_X7S,
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
        
        
		Choose_AsyncTaps_Carry (
            
            TYPE_TDL_ARRAY(I),													-- CO vs O Sampling	(Like a Generic)
			---------------------------------------------

			------------- Tapped Delay-Line --------------
			CO_Taps_TDL(I),															-- CO Taps in output, AsyncInput delayed not inverted	(like a Signal)
			O_Taps_TDL(I),															-- O Taps in output, AsyncInput delayed and inverted	(like a Signal)
			----------------------------------------------

			------ Async Tapped Delay-Line Input ---------
			AsyncTaps_TDL_Carry(I)

		);

		Choose_AsyncTaps_Carry (

            TYPE_TDL_ARRAY(I),													-- CO vs O Sampling	(Like a Generic)
			---------------------------------------------

			------------- Tapped Delay-Line --------------
			CO_Taps_preTDL(I),															-- CO Taps in output, AsyncInput delayed not inverted	(like a Signal)
			O_Taps_preTDL(I),															-- O Taps in output, AsyncInput delayed and inverted	(like a Signal)
			----------------------------------------------

			------ Async Tapped Delay-Line Input ---------
			AsyncTaps_preTDL_Carry(I)	

			);


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

				AsyncTaps_TDL	=>	AsyncTaps_TDL_Carry(I),

				AsyncTaps_preTDL	=>	AsyncTaps_preTDL_Carry(I),

				Valid_SampledTaps_TDL	=>	Valid_SampledTaps_Carry(I),

				SampledTaps_TDL			=>	SampledTaps_TDL_Carry(I),

				PolarityIn			=>	PolarityIn,

				PolarityOut			=>	Polarity_Carry(I),

				ValidPositionTap	=>	ValidPositionTap

			);

     end generate;

    Virtual_DSP_Chain : for I in 0 to NUMBER_OF_DSP_CHAINS -1 generate

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
		
		Choose_AsyncTaps_DSP (


				Taps_DSP(I),

				AsyncTaps_TDL_DSP(I)

		);

		Choose_AsyncTaps_DSP (


				Taps_preDSP(I),

				AsyncTaps_preTDL_DSP(I)

		);

		
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
				OFFSET_TAP_TDL	=>	OFFSET_TAP_TDL_ARRAY(I),
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
				AsyncTaps_TDL	=>	AsyncTaps_TDL_DSP(I),
				AsyncTaps_preTDL	=>	AsyncTaps_preTDL_DSP(I),
				----------------------------------------------
                SampledTaps_TDL			=>	SampledTaps_TDL_DSP(I),
				
				Valid_SampledTaps_TDL	=>	Valid_SampledTaps_DSP(I),
				----------------------------------------------
                PolarityIn  => PolarityIn,
                PolarityOut => Polarity_DSP(I),
				
				ValidPositionTap	=>	ValidPositionTap
				----------------------------------------------


			);
 	end generate;


	 m00_axis_undeco_tvalid	<=	Valid_SampledTaps_Carry(ValidNumberOfTdl_int);

	 m00_axis_undeco_tdata(1 + (NUMBER_OF_CARRY_CHAINS + NUMBER_OF_DSP_CHAINS)*BIT_SMP_TDL -1)	<=  Polarity_Carry(ValidNumberOfTdl_int);

	 From_SampledTaps_to_Undeco
	(
		BIT_SMP_TDL,
		SampledTaps_TDL_Carry,
		SampledTaps_TDL_DSP,
		m00_axis_undeco_tdata((NUMBER_OF_CARRY_CHAINS + NUMBER_OF_DSP_CHAINS)*BIT_SMP_TDL-1 DOWNTO 0)

	);

	ValidDebug : if DEBUG_MODE = TRUE generate

		ValidNumberOfTdl_int	<= to_integer(unsigned(ValidNumberOfTdl));

	end generate;


end Behavioral;