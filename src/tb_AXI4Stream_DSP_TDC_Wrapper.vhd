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

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity tb_AXI4Stream_DSP_TDC_Wrapper is
--  Port ( );
end tb_AXI4Stream_DSP_TDC_Wrapper;

architecture Behavioral of tb_AXI4Stream_DSP_TDC_Wrapper is
     
    constant	CLK_PERIOD 		: time := 1 ns;									
	constant	ASYNC_PERIOD 	: time := 12 ns;								
	
	constant	TYPE_TDL : STRING := "O";
	
	constant	NUM_TAP_TDL		:	POSITIVE	RANGE 4 TO 4096	:= 48;
	constant	BIT_SMP_TDL		:	POSITIVE	RANGE 1 TO 4096	:= 48;
	
	component AXI4Stream_DSP_TDC_Wrapper is
    generic (
        
        TYPE_TDL        :   STRING  := "O";
		
		NUM_TAP_TDL		:	POSITIVE	RANGE 4 TO 4096	:= 96;										
		
		BIT_SMP_TDL		:	POSITIVE	RANGE 1 TO 4096	:= 48						
		
	);


	port(

		reset	:	IN	STD_LOGIC;																	
		
		clk	:	IN	STD_LOGIC;			 															
		
		
		AsyncInput	:	IN	STD_LOGIC;															
		

		
		m00_axis_undeco_tvalid	:	OUT	STD_LOGIC;															
		m00_axis_undeco_tdata	:	OUT	STD_LOGIC_VECTOR(BIT_SMP_TDL-1 DOWNTO 0) 			
		
		
	);


    end component;


    signal reset : std_logic;
    
    signal clk   : std_logic := '1';
    
    signal	AsyncInput	:	STD_LOGIC;

	signal	m00_axis_undeco_tvalid	:	STD_LOGIC;
	signal	m00_axis_undeco_tdata	:	STD_LOGIC_VECTOR(BIT_SMP_TDL-1 DOWNTO 0);
	
begin
    
    
    dut_AXI4Stream_DSP_TDC_Wrapper : AXI4Stream_DSP_TDC_Wrapper
     
       generic map ( 
                   
          TYPE_TDL    => TYPE_TDL,
          NUM_TAP_TDL => NUM_TAP_TDL,
          BIT_SMP_TDL => BIT_SMP_TDL
       )
       port map ( 
       
          reset => reset,
          clk   => clk,
          AsyncInput => AsyncInput,
          m00_axis_undeco_tvalid => m00_axis_undeco_tvalid,
          m00_axis_undeco_tdata  => m00_axis_undeco_tdata
          
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
