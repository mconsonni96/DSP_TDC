----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/10/2022 11:27:07 AM
-- Design Name: 
-- Module Name: tb_AXI4Stream_DSP_TDC_Wrapper - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;
library work;
--! Tapped Delay-Line local package
	use work.LocalPackage_TDL.all;
-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity tb_AXI4Stream_VirtualTDL_Wrapper is
--  Port ( );
end tb_AXI4Stream_VirtualTDL_Wrapper;

architecture Behavioral of tb_AXI4Stream_VirtualTDL_Wrapper is
     
    constant	CLK_PERIOD 		: time := 1 ns;									
	constant	ASYNC_PERIOD 	: time := 12 ns;								
	
	constant    XUS_VS_X7S   :   STRING  :=  "XUS";
	
	constant	TYPE_TDL_ARRAY		:	CO_VS_O_ARRAY_STRING	:= (Others => "C");
	
	constant    DEBUG_MODE : BOOLEAN := FALSE;
	
	constant	NUMBER_OF_CARRY_CHAINS	:	NATURAL	RANGE 0 TO 16 	:= 1;
	constant	NUMBER_OF_DSP_CHAINS	:	NATURAL	RANGE 0 TO 16 	:= 1;
	
	constant	BUFFERING_STAGE	:	BOOLEAN	:= FALSE;
	
	constant    MIN_VALID_TAP_POS	:	INTEGER		:=	0;
	constant    STEP_VALID_TAP_POS	:	POSITIVE	:=	1;
	constant    MAX_VALID_TAP_POS	:	NATURAL		:=	7;
	
	constant	OFFSET_TAP_TDL_ARRAY	:	OFFSET_TAP_TDL_ARRAY_TYPE	:=	(Others => 0);
	
	constant    VALID_POSITION_TAP_INIT		:	INTEGER	RANGE 0 TO 4095		:=	0;
	constant    VALID_NUMBER_OF_TDL_INIT	:	INTEGER	RANGE 0 TO 15		:=	0;
	
	constant	NUM_TAP_TDL		:	POSITIVE	RANGE 4 TO 4096	:= 512;
	constant	BIT_SMP_TDL		:	POSITIVE	RANGE 1 TO 4096	:= 512;
	
	constant	NUM_TAP_PRE_TDL		:	INTEGER	RANGE 0 TO 1024	:= 0;
	constant	BIT_SMP_PRE_TDL		:	INTEGER	RANGE 0 TO 1024	:= 0;
	
	component AXI4Stream_VirtualTDL_Wrapper is

	generic (

        XUS_VS_X7S      :   STRING  := "XUS";
        
        TYPE_TDL_ARRAY		:	CO_VS_O_ARRAY_STRING	:= ("C", "O", Others => "C");
	
		DEBUG_MODE		:	BOOLEAN	:=	FALSE;

        NUMBER_OF_CARRY_CHAINS   :   NATURAL    RANGE 0 TO 16   := 4;

		NUMBER_OF_DSP_CHAINS     :   NATURAL    RANGE 0 TO 16   := 4;

		NUM_TAP_TDL		:	POSITIVE	RANGE 4 TO 4096	:= 512;
		
		BUFFERING_STAGE	:	BOOLEAN	:= TRUE;

		MIN_VALID_TAP_POS	:	INTEGER		:=	5;

		STEP_VALID_TAP_POS	:	POSITIVE	:=	3;

		MAX_VALID_TAP_POS	:	NATURAL		:=	7;

		VALID_POSITION_TAP_INIT		:	INTEGER	RANGE 0 TO 4095		:=	2;

		VALID_NUMBER_OF_TDL_INIT	:	INTEGER	RANGE 0 TO 15		:=	0;

		OFFSET_TAP_TDL_ARRAY	:	OFFSET_TAP_TDL_ARRAY_TYPE	:=	(1, Others => 0);
		
		BIT_SMP_TDL		     :	POSITIVE	RANGE 1 TO 4096	:= 512;

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
    end component;


    signal  reset : std_logic;
    
    signal  clk   : std_logic := '1';
    
    signal	AsyncInput	:	STD_LOGIC;

	signal	m00_axis_undeco_tvalid	:	STD_LOGIC;
	signal	m00_axis_undeco_tdata	:	STD_LOGIC_VECTOR(1 + (NUMBER_OF_CARRY_CHAINS + NUMBER_OF_DSP_CHAINS)*BIT_SMP_TDL-1 DOWNTO 0);
	
	signal  PolarityIn : std_logic := '1';
	
	signal  ValidPositionTap		:	std_logic_vector(31 DOWNTO 0)   := (Others => '0');

	signal	ValidNumberOfTdl        :   std_logic_vector(31 DOWNTO 0)   := ( Others => '0');
	
begin
    
    
    dut_AXI4Stream_VirtualTDL_Wrapper : AXI4Stream_VirtualTDL_Wrapper
     
       generic map ( 
                   
          XUS_VS_X7S => XUS_VS_X7S,
          TYPE_TDL_ARRAY => TYPE_TDL_ARRAY,
          DEBUG_MODE  => DEBUG_MODE,
          NUMBER_OF_CARRY_CHAINS => NUMBER_OF_CARRY_CHAINS,
          NUMBER_OF_DSP_CHAINS => NUMBER_OF_DSP_CHAINS,
          NUM_TAP_TDL => NUM_TAP_TDL,
          BUFFERING_STAGE => BUFFERING_STAGE,
          MIN_VALID_TAP_POS  => MIN_VALID_TAP_POS,
          STEP_VALID_TAP_POS => STEP_VALID_TAP_POS,
          MAX_VALID_TAP_POS  => MAX_VALID_TAP_POS,
          VALID_POSITION_TAP_INIT	 => VALID_POSITION_TAP_INIT,
		  VALID_NUMBER_OF_TDL_INIT => VALID_NUMBER_OF_TDL_INIT,
		  BIT_SMP_TDL => BIT_SMP_TDL,
		  NUM_TAP_PRE_TDL		=>	NUM_TAP_PRE_TDL,
		  BIT_SMP_PRE_TDL		=>	BIT_SMP_PRE_TDL
       )
       port map ( 
       
          reset => reset,
          clk   => clk,
          AsyncInput => AsyncInput,
          m00_axis_undeco_tvalid => m00_axis_undeco_tvalid,
          m00_axis_undeco_tdata  => m00_axis_undeco_tdata,
          
          PolarityIn => PolarityIn,
          
          ValidPositionTap  => ValidPositionTap,
          ValidNumberOfTdl  => ValidNumberOfTdl
          
       );
       
       
    clk_process :process
	begin
	   clk <= '0';
	   wait for CLK_PERIOD/2;
	   clk <= '1';
	   wait for CLK_PERIOD/2;
	end process;
	
	
	AsyncInput_process :process
	begin

		AsyncInput <= '0';
		wait for ASYNC_PERIOD/2;
		AsyncInput <= '1';
		wait ;

	end process;

end Behavioral;
