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
        
        DEBUG_MODE		:	BOOLEAN	:=	FALSE;
        
        NUMBER_OF_TDL   :   POSITIVE    RANGE 1 TO 16   := 4;
		
		NUM_TAP_TDL		:	POSITIVE	RANGE 4 TO 1920	:= 480;										
		
		MIN_VALID_TAP_POS	:	INTEGER		:=	5;
		
		STEP_VALID_TAP_POS	:	POSITIVE	:=	3;
		
		MAX_VALID_TAP_POS	:	NATURAL		:=	7;
		
		VALID_POSITION_TAP_INIT		:	INTEGER	RANGE 0 TO 4095		:=	2;
		
		VALID_NUMBER_OF_TDL_INIT	:	INTEGER	RANGE 0 TO 15		:=	0;	
		
		BIT_SMP_TDL		     :	POSITIVE	RANGE 1 TO 1920	:= 480;
		
		NUM_TAP_PRE_TDL		 :	INTEGER	RANGE 0 TO 480	:= 48;
		
		BIT_SMP_PRE_TDL		 :	INTEGER	RANGE 0 TO 480	:= 48	
	
	);


	port(

		reset	:	IN	STD_LOGIC;
		
		clk	    :	IN	STD_LOGIC;			 															
		
		
		AsyncInput	:	IN	STD_LOGIC;															
		
        PolarityIn	:	IN	STD_LOGIC;
		
		m00_axis_undeco_tvalid	:	OUT	STD_LOGIC;															
		m00_axis_undeco_tdata	:	OUT	STD_LOGIC_VECTOR(1 + NUMBER_OF_TDL*BIT_SMP_TDL-1 DOWNTO 0);
		
		ValidPositionTap		:	IN	STD_LOGIC_VECTOR(31 DOWNTO 0)   := ( 1 => '1', Others => '0');
		
		ValidNumberOfTdl        :   IN  STD_LOGIC_VECTOR(31 DOWNTO 0)   := ( Others => '0')		
		
	);


end AXI4Stream_DSP_TDC_Wrapper;


architecture Behavioral of AXI4Stream_DSP_TDC_Wrapper is
    
    type	TDL_ARRAY_TYPE	is array (0 to NUMBER_OF_TDL-1) of STD_LOGIC_VECTOR(NUM_TAP_TDL -1 downto 0);
    
    type	PRE_TDL_ARRAY_TYPE	is array (0 to NUMBER_OF_TDL-1) of STD_LOGIC_VECTOR(NUM_TAP_PRE_TDL-1 downto 0);

    type	SMP_TDL_ARRAY_TYPE	is array (0 to NUMBER_OF_TDL-1) of STD_LOGIC_VECTOR(BIT_SMP_TDL-1 downto 0);
    
    type	VALID_POS_INTEGER_ARRAY_TYPE	is array (0 to NUMBER_OF_TDL-1) of INTEGER;
    
    procedure	From_SampledTaps_to_Undeco (

		constant bit_smp_tdl		:	IN	POSITIVE;
		signal	SampledTaps_TDL		:	IN	SMP_TDL_ARRAY_TYPE;
		signal	undeco_tdata		:	OUT	STD_LOGIC_VECTOR

	) is

		variable	number_of_tdl	:	integer	:=	SampledTaps_TDL'LENGTH;
		variable	bit_tdl			:	integer	:=	SampledTaps_TDL(0)'LENGTH;

		variable	undeco_tmp		:	std_logic_vector(number_of_tdl*bit_smp_tdl-1 downto 0);


	begin

		for I in 0 to number_of_tdl-1 loop

			undeco_tmp((I+1)*bit_smp_tdl -1 downto I*bit_smp_tdl)	:=	SampledTaps_TDL(I)(bit_smp_tdl -1 downto 0);

		end loop;

		undeco_tdata	<=	undeco_tmp;

	end procedure;
    
	component DSP_TDC is
	generic (

        NUM_TAP_TDL				:	POSITIVE	RANGE 4 TO 1920	:= 480;
        
        NUM_TAP_PRE_TDL			:	INTEGER	    RANGE 0 TO 1920	:= 480					
		
	);
	port(
		
		clk : in std_logic;
		
		AsyncInput	:	in  std_logic;											
		
        Taps_TDL	:	out	std_logic_vector(NUM_TAP_TDL-1 downto 0);
        
        Taps_preTDL :   out std_logic_vector(NUM_TAP_PRE_TDL-1 downto 0)				
		
	);
    end component;

	-----------------------------------------------

	component Sampler_TDC is
	generic (

		
		DEBUG_MODE	      	:	BOOLEAN	:=	FALSE;	
		
		MIN_VALID_TAP_POS	:	INTEGER		:=	5;
		STEP_VALID_TAP_POS	:	POSITIVE	:=	3;
		MAX_VALID_TAP_POS	:	NATURAL		:=	7;
		
		VALID_POSITION_TAP_INIT		:	INTEGER	RANGE 0 TO 4095		:=	2;								
		
		NUM_TAP_TDL			:	POSITIVE	RANGE 4 TO 4096	:= 96;						
		
		BIT_SMP_TDL			:	POSITIVE	RANGE 1 TO 4096	:= 96;
		
		NUM_TAP_PRE_TDL		:	INTEGER	RANGE 0 TO 480	:= 48;
		
		BIT_SMP_PRE_TDL		:	INTEGER	RANGE 0 TO 480	:= 48						

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
    
    
    
    signal	Taps_TDL          :   TDL_ARRAY_TYPE;
    signal	Taps_preTDL       :   PRE_TDL_ARRAY_TYPE;
    signal	AsyncTaps_TDL     :   TDL_ARRAY_TYPE;
    signal	AsyncTaps_preTDL  :	  PRE_TDL_ARRAY_TYPE;
	
	signal	Polarity			:	STD_LOGIC_VECTOR(0 to NUMBER_OF_TDL-1);
	
	signal	Valid_SampledTaps_TDL		:	STD_LOGIC_VECTOR(0 to NUMBER_OF_TDL-1);
	
	signal	SampledTaps_TDL				:	SMP_TDL_ARRAY_TYPE;
	
	signal 	ValidNumberOfTdl_int    :	INTEGER	RANGE	0	TO	Valid_SampledTaps_TDL'HIGH	:=	VALID_NUMBER_OF_TDL_INIT;
	
begin
    
    VirtualTDL : for I in 0 to NUMBER_OF_TDL-1 generate

		Inst_TDC	:	DSP_TDC
			generic map(

				NUM_TAP_TDL		=>	NUM_TAP_TDL,
				NUM_TAP_PRE_TDL	=> NUM_TAP_PRE_TDL
				
			)
			port map(
				
				clk         =>   clk,
				AsyncInput	=>	AsyncInput,
				Taps_TDL    => Taps_TDL(I),
				Taps_preTDL => Taps_preTDL(I)
			);
		
		
		X7S_Choose_AsyncTaps_TDL (

			
			Taps_TDL(I),														
			
			AsyncTaps_TDL(I)													
			
		);
		
		X7S_Choose_AsyncTaps_TDL (

			
			Taps_preTDL(I),														
			
			AsyncTaps_preTDL(I)													
			
		);


		Inst_Sampler_TDC	:	Sampler_TDC
			generic map(

				DEBUG_MODE	    =>	 DEBUG_MODE,
				
				MIN_VALID_TAP_POS	=>	MIN_VALID_TAP_POS,
				STEP_VALID_TAP_POS	=>	STEP_VALID_TAP_POS,
				MAX_VALID_TAP_POS	=>	MAX_VALID_TAP_POS,
				
				VALID_POSITION_TAP_INIT	 => VALID_POSITION_TAP_INIT,
				
				NUM_TAP_TDL		=>	NUM_TAP_TDL,
				
				BIT_SMP_TDL		=>	BIT_SMP_TDL,
				
				NUM_TAP_PRE_TDL			=>	NUM_TAP_PRE_TDL,
				
				BIT_SMP_PRE_TDL			=>	BIT_SMP_PRE_TDL
	
			)
			port map(
				
				reset   =>	reset,
				
				clk     =>	clk,
				
				AsyncTaps_TDL	=>	AsyncTaps_TDL(I),
				
				AsyncTaps_preTDL	=>	AsyncTaps_preTDL(I),
				
				Valid_SampledTaps_TDL	=>	Valid_SampledTaps_TDL(I),
				
				SampledTaps_TDL			=>	SampledTaps_TDL(I),
				
				PolarityIn			=>	PolarityIn,
				
				PolarityOut			=>	Polarity(I),
				
				ValidPositionTap	=>	ValidPositionTap
				
			);

     end generate;
     
     
	 m00_axis_undeco_tvalid	<=	Valid_SampledTaps_TDL(ValidNumberOfTdl_int);
	 
	 m00_axis_undeco_tdata(1 + NUMBER_OF_TDL*BIT_SMP_TDL -1)	<=  Polarity(ValidNumberOfTdl_int);
	 
	 From_SampledTaps_to_Undeco
	(
		BIT_SMP_TDL,
		SampledTaps_TDL,
		m00_axis_undeco_tdata(NUMBER_OF_TDL*BIT_SMP_TDL-1 DOWNTO 0)

	);
	
	ValidDebug : if DEBUG_MODE = TRUE generate

		ValidNumberOfTdl_int	<=
		to_integer(
			unsigned(
				ValidNumberOfTdl
			)
		);

	end generate;
	
	
end Behavioral;