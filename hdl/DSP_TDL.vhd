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
------------------------- BRIEF MODULE DESCRIPTION -----------------------------
--! \file
--! \brief This module creates the chain containing a *NUM_TAP_TDL* long output data, starting from the basic block *DSP48E1* (for Xilinx 7-Series) or *DSP48E2* (for Xilinx Ultrascale/Ultrascale+), which contains a 48-bit long output data. The propagation
--! of the input signal consists in the propagation of the carry due to the operation of sum managed by the ALU, contained in the DSP slice.
--! In the following figure we can see the description of the *DSP48E1* primitive.
--! \image html DSP_FINAL.png [DSP48E1 image]

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

--------------------------------------------------------------------------------

-----------------------------ENTITY DESCRIPTION --------------------------------
--! \brief In this module the structure of the overall TDL is built, in a way that is described in the architecture description part.
--! The length of the chain is determined by *NUM_TAP_TDL* and in input of the chain we have the *AsyncInput* which propagates with the physical intrinsic delay of sum operation of the chain.
--------------------------------------------------------------------------------

entity DSP_TDL is
	generic (

      XUS_VS_X7S   :  STRING := "XUS";                                     --! Technology node (Ultrascale or 7-Series)
      
      NUM_TAP_TDL				   :	POSITIVE	RANGE 4 TO 4096	:= 96;         --! Bits of the TDL (number of taps in the TDL)

      NUM_TAP_PRE_TDL         :   INTEGER     RANGE 0 TO 1024  := 48       --! Bits of the PRE-Tapped Delay-Line (number of taps in the PRE-TDL)

	);
	port(

		clk : in std_logic;                                                  --! clock is needed to feed the output P flip-fops of the DSP block, in order to do the sampling of the TDL directly inside the block

		AsyncInput	:	in std_logic;                                         --! Asynchronous input data

      Taps_TDL	:	out std_logic_vector(NUM_TAP_TDL-1 downto 0);            --! Taps in output

      Taps_preTDL :   out std_logic_vector(NUM_TAP_PRE_TDL-1 downto 0)     --! Taps in output of the PRE-TDL

	);
end DSP_TDL;

------------------------ ARCHITECTURE DESCRIPTION ------------------------------
--! \brief In order to build the chain of DSP blocks, the module first computes (both for the PRE_TDL and the TDL) how many *DSP48E2* or *DSP48E1* we have to chain in order to get *NUM_TAP_TDL* taps and *NUM_TAP_PRE_TDL*, by means of the function *Compute_NumDSP*.
--! We need to chain *NUM_DSP_TDL* of *DSP48E2(E1)*.
--! Then, the module builds the chain of DSPs,
--! first by initializing the basic block *DSP48E2(E1)* and then by replicating it *NUM_DSP_TDL* times. 
--------------------------------------------------------------------------------

architecture Behavioral of DSP_TDL is

	 -------------------------------- CONSTANT ----------------------------------

	------- Num of Carry Blocks of TDL --------
	-- Bits inside the primitive (dsp block)
    constant	BIT_DSP	:	POSITIVE	:= 48;

   -- Number of dsp blocks required to have NUM_TAP_TDL
	 constant	NUM_DSP_TDL	:	INTEGER	:=
		Compute_Num_DSP
		(
			NUM_TAP_TDL,
			BIT_DSP
		);

   -- Number of dsp blocks required to have NUM_TAP_PRE_TDL
	 constant	NUM_DSP_PRE_TDL	:	INTEGER	:=
		Compute_Num_DSP
		(
			NUM_TAP_PRE_TDL,
			BIT_DSP
		);

   -- Number of total dsp blocks required
    constant NUM_DSP_TOT : POSITIVE := NUM_DSP_TDL + NUM_DSP_PRE_TDL;
    
	-- array needed to cascade the DSP blocks by means of their BCOUT output 
    type B_array_type  is  array(0 to NUM_DSP_TOT-1) of std_logic_vector(17 downto 0);
	signal BCOUT : B_array_type;
	 
	 ----- Output of the NUM_DSP_TDL -----
    signal O	: std_logic_vector(NUM_DSP_TOT*BIT_DSP-1 downto 0) := (Others => '0');

	 
    ----- Input signal of the first DSP in the chain. It will contain our Async Input
    signal B : std_logic_vector(17 downto 0);
    
    ----------------------------------------------------------------------------
  

begin
    
    -------------------------------- DATA FLOW  --------------------------------
	-- In case we have *NUM_TAP_TDL* and *NUM_TAP_PRE_TDL* that are not 48 multiples, we have to pay attention that in reality O output are all the BIT_DSP*NUM_DSP_TOT outputs of the DSP48E2(E1) chain, but we just want to take
	-- respectively *NUM_TAP_PRE_TDL* of them for what concern the PRE-TDL and *NUM_TAP_TDL* for what concern the V-TDL.
	
    --- Async Input ---
    B <= (0 => AsyncInput, Others => '0'); 
    
    --- Output connections ---
    Taps_preTDL	 <=	O(NUM_DSP_PRE_TDL*BIT_DSP - 1 downto NUM_DSP_PRE_TDL*BIT_DSP - NUM_TAP_PRE_TDL);
    Taps_TDL       <=  O(NUM_DSP_PRE_TDL*BIT_DSP + NUM_TAP_TDL -1 downto NUM_DSP_PRE_TDL*BIT_DSP);
    
    
    ---- XUS TDL generation ----
    XUS_DSP_GEN : if XUS_VS_X7S = "XUS" generate
    begin
    DSP48E2_inst : DSP48E2
         generic map (
            -- Feature Control Attributes: Data Path Selection
            AMULTSEL => "A",                   -- Selects A input to multiplier (A, AD)
            A_INPUT => "DIRECT",               -- Selects A input source, "DIRECT" (A port) or "CASCADE" (ACIN port)
            BMULTSEL => "B",                   -- Selects B input to multiplier (AD, B)
            B_INPUT => "DIRECT",               -- Selects B input source, "DIRECT" (B port) or "CASCADE" (BCIN port)
            PREADDINSEL => "A",                -- Selects input to pre-adder (A, B)
            RND => X"000000000000",            -- Rounding Constant
            USE_MULT => "NONE",            -- Select multiplier usage (DYNAMIC, MULTIPLY, NONE)
            USE_SIMD => "ONE48",               -- SIMD selection (FOUR12, ONE48, TWO24)
            USE_WIDEXOR => "FALSE",            -- Use the Wide XOR function (FALSE, TRUE)
            XORSIMD => "XOR24_48_96",          -- Mode of operation for the Wide XOR (XOR12, XOR24_48_96)
            -- Pattern Detector Attributes: Pattern Detection Configuration
            AUTORESET_PATDET => "NO_RESET",    -- NO_RESET, RESET_MATCH, RESET_NOT_MATCH
            AUTORESET_PRIORITY => "RESET",     -- Priority of AUTORESET vs. CEP (CEP, RESET).
            MASK => X"3fffffffffff",           -- 48-bit mask value for pattern detect (1=ignore)
            PATTERN => X"000000000000",        -- 48-bit pattern match for pattern detect
            SEL_MASK => "MASK",                -- C, MASK, ROUNDING_MODE1, ROUNDING_MODE2
            SEL_PATTERN => "PATTERN",          -- Select pattern value (C, PATTERN)
            USE_PATTERN_DETECT => "NO_PATDET", -- Enable pattern detect (NO_PATDET, PATDET)
            -- Programmable Inversion Attributes: Specifies built-in programmable inversion on specific pins
            IS_ALUMODE_INVERTED => "0000",     -- Optional inversion for ALUMODE
            IS_CARRYIN_INVERTED => '0',        -- Optional inversion for CARRYIN
            IS_CLK_INVERTED => '0',            -- Optional inversion for CLK
            IS_INMODE_INVERTED => "00000",     -- Optional inversion for INMODE
            IS_OPMODE_INVERTED => "000000000", -- Optional inversion for OPMODE
            IS_RSTALLCARRYIN_INVERTED => '0',  -- Optional inversion for RSTALLCARRYIN
            IS_RSTALUMODE_INVERTED => '0',     -- Optional inversion for RSTALUMODE
            IS_RSTA_INVERTED => '0',           -- Optional inversion for RSTA
            IS_RSTB_INVERTED => '0',           -- Optional inversion for RSTB
            IS_RSTCTRL_INVERTED => '0',        -- Optional inversion for RSTCTRL
            IS_RSTC_INVERTED => '0',           -- Optional inversion for RSTC
            IS_RSTD_INVERTED => '0',           -- Optional inversion for RSTD
            IS_RSTINMODE_INVERTED => '0',      -- Optional inversion for RSTINMODE
            IS_RSTM_INVERTED => '0',           -- Optional inversion for RSTM
            IS_RSTP_INVERTED => '0',           -- Optional inversion for RSTP
            -- Register Control Attributes: Pipeline Register Configuration
            ACASCREG => 0,                     -- Number of pipeline stages between A/ACIN and ACOUT (0-2)
            ADREG => 0,                        -- Pipeline stages for pre-adder (0-1)
            ALUMODEREG => 1,                   -- Pipeline stages for ALUMODE (0-1)
            AREG => 0,                         -- Pipeline stages for A (0-2)
            BCASCREG => 0,                     -- Number of pipeline stages between B/BCIN and BCOUT (0-2)
            BREG => 0,                         -- Pipeline stages for B (0-2)
            CARRYINREG => 0,                   -- Pipeline stages for CARRYIN (0-1)
            CARRYINSELREG => 1,                -- Pipeline stages for CARRYINSEL (0-1)
            CREG => 0,                         -- Pipeline stages for C (0-1)
            DREG => 0,                         -- Pipeline stages for D (0-1)
            INMODEREG => 1,                    -- Pipeline stages for INMODE (0-1)
            MREG => 0,                         -- Multiplier pipeline stages (0-1)
            OPMODEREG => 1,                    -- Pipeline stages for OPMODE (0-1)
            PREG => 1                          -- NEEDED TO SAMPLE THE TDL INTERNALLY
         )
         port map (
            -- Cascade outputs: Cascade Ports
            ACOUT => open,                   -- 30-bit output: A port cascade
            BCOUT => BCOUT(0),                   -- 18-bit output: B cascade
            CARRYCASCOUT => open,     -- 1-bit output: Cascade carry
            MULTSIGNOUT => open,       -- 1-bit output: Multiplier sign cascade
            PCOUT => open,                   -- 48-bit output: Cascade output
            -- Control outputs: Control Inputs/Status Bits
            OVERFLOW => open,             -- 1-bit output: Overflow in add/acc
            PATTERNBDETECT => open, -- 1-bit output: Pattern bar detect
            PATTERNDETECT => open,   -- 1-bit output: Pattern detect
            UNDERFLOW => open,           -- 1-bit output: Underflow in add/acc
            -- Data outputs: Data Ports
            CARRYOUT => open,             -- 4-bit output: Carry
            P => O(BIT_DSP-1 downto 0),                           -- 48-bit output: Primary data
            XOROUT => open,                 -- 8-bit output: XOR data
            -- Cascade inputs: Cascade Ports
            ACIN => (Others => '0'),                     -- 30-bit input: A cascade data
            BCIN => (Others => '0'),                     -- 18-bit input: B cascade
            CARRYCASCIN => '0',       -- 1-bit input: Cascade carry
            MULTSIGNIN => '0',         -- 1-bit input: Multiplier sign cascade
            PCIN => (Others => '0'),                     -- 48-bit input: P cascade
            -- Control inputs: Control Inputs/Status Bits
            ALUMODE => "0011",               -- 4-bit input: ALU control
            CARRYINSEL => "000",         -- 3-bit input: Carry select
            CLK => clk,                       -- 1-bit input: Clock
            INMODE => (Others => '0'),                 -- 5-bit input: INMODE control
            OPMODE => "000110011",                 -- 9-bit input: Operation mode
            -- Data inputs: Data Ports
            A => (Others => '0'),                           -- 30-bit input: A data
            B => B,                           -- 18-bit input: B data
            C => (Others => '0'),                           -- 48-bit input: C data
            CARRYIN => '0',               -- 1-bit input: Carry-in
            D => (Others => '0'),                           -- 27-bit input: D data
            -- Reset/Clock Enable inputs: Reset/Clock Enable Inputs
            CEA1 => '1',                     -- 1-bit input: Clock enable for 1st stage AREG
            CEA2 => '1',                     -- 1-bit input: Clock enable for 2nd stage AREG
            CEAD => '1',                     -- 1-bit input: Clock enable for ADREG
            CEALUMODE => '1',           -- 1-bit input: Clock enable for ALUMODE
            CEB1 => '1',                     -- 1-bit input: Clock enable for 1st stage BREG
            CEB2 => '1',                     -- 1-bit input: Clock enable for 2nd stage BREG
            CEC => '1',                       -- 1-bit input: Clock enable for CREG
            CECARRYIN => '1',           -- 1-bit input: Clock enable for CARRYINREG
            CECTRL => '1',                 -- 1-bit input: Clock enable for OPMODEREG and CARRYINSELREG
            CED => '1',                       -- 1-bit input: Clock enable for DREG
            CEINMODE => '1',             -- 1-bit input: Clock enable for INMODEREG
            CEM => '1',                       -- 1-bit input: Clock enable for MREG
            CEP => '1',                       -- 1-bit input: Clock enable for PREG
            RSTA => '0',                     -- 1-bit input: Reset for AREG
            RSTALLCARRYIN => '0',   -- 1-bit input: Reset for CARRYINREG
            RSTALUMODE => '0',         -- 1-bit input: Reset for ALUMODEREG
            RSTB => '0',                     -- 1-bit input: Reset for BREG
            RSTC => '0',                     -- 1-bit input: Reset for CREG
            RSTCTRL => '0',               -- 1-bit input: Reset for OPMODEREG and CARRYINSELREG
            RSTD => '0',                     -- 1-bit input: Reset for DREG and ADREG
            RSTINMODE => '0',           -- 1-bit input: Reset for INMODEREG
            RSTM => '0',                     -- 1-bit input: Reset for MREG
            RSTP => '0'                      -- 1-bit input: Reset for PREG
         );
               
               
               Gen_DSP48E2_TDC : for I in 1 to NUM_DSP_TOT-1 generate
               begin
                     DSP48E2_inst : DSP48E2
                       generic map (
                          -- Feature Control Attributes: Data Path Selection
                          AMULTSEL => "A",                   -- Selects A input to multiplier (A, AD)
                          A_INPUT => "DIRECT",               -- Selects A input source, "DIRECT" (A port) or "CASCADE" (ACIN port)
                          BMULTSEL => "B",                   -- Selects B input to multiplier (AD, B)
                          B_INPUT => "CASCADE",               -- Selects B input source, "DIRECT" (B port) or "CASCADE" (BCIN port)
                          PREADDINSEL => "A",                -- Selects input to pre-adder (A, B)
                          RND => X"000000000000",            -- Rounding Constant
                          USE_MULT => "NONE",            -- Select multiplier usage (DYNAMIC, MULTIPLY, NONE)
                          USE_SIMD => "ONE48",               -- SIMD selection (FOUR12, ONE48, TWO24)
                          USE_WIDEXOR => "FALSE",            -- Use the Wide XOR function (FALSE, TRUE)
                          XORSIMD => "XOR24_48_96",          -- Mode of operation for the Wide XOR (XOR12, XOR24_48_96)
                          -- Pattern Detector Attributes: Pattern Detection Configuration
                          AUTORESET_PATDET => "NO_RESET",    -- NO_RESET, RESET_MATCH, RESET_NOT_MATCH
                          AUTORESET_PRIORITY => "RESET",     -- Priority of AUTORESET vs. CEP (CEP, RESET).
                          MASK => X"3fffffffffff",           -- 48-bit mask value for pattern detect (1=ignore)
                          PATTERN => X"000000000000",        -- 48-bit pattern match for pattern detect
                          SEL_MASK => "MASK",                -- C, MASK, ROUNDING_MODE1, ROUNDING_MODE2
                          SEL_PATTERN => "PATTERN",          -- Select pattern value (C, PATTERN)
                          USE_PATTERN_DETECT => "NO_PATDET", -- Enable pattern detect (NO_PATDET, PATDET)
                          -- Programmable Inversion Attributes: Specifies built-in programmable inversion on specific pins
                          IS_ALUMODE_INVERTED => "0000",     -- Optional inversion for ALUMODE
                          IS_CARRYIN_INVERTED => '0',        -- Optional inversion for CARRYIN
                          IS_CLK_INVERTED => '0',            -- Optional inversion for CLK
                          IS_INMODE_INVERTED => "00000",     -- Optional inversion for INMODE
                          IS_OPMODE_INVERTED => "000000000", -- Optional inversion for OPMODE
                          IS_RSTALLCARRYIN_INVERTED => '0',  -- Optional inversion for RSTALLCARRYIN
                          IS_RSTALUMODE_INVERTED => '0',     -- Optional inversion for RSTALUMODE
                          IS_RSTA_INVERTED => '0',           -- Optional inversion for RSTA
                          IS_RSTB_INVERTED => '0',           -- Optional inversion for RSTB
                          IS_RSTCTRL_INVERTED => '0',        -- Optional inversion for RSTCTRL
                          IS_RSTC_INVERTED => '0',           -- Optional inversion for RSTC
                          IS_RSTD_INVERTED => '0',           -- Optional inversion for RSTD
                          IS_RSTINMODE_INVERTED => '0',      -- Optional inversion for RSTINMODE
                          IS_RSTM_INVERTED => '0',           -- Optional inversion for RSTM
                          IS_RSTP_INVERTED => '0',           -- Optional inversion for RSTP
                          -- Register Control Attributes: Pipeline Register Configuration
                          ACASCREG => 0,                     -- Number of pipeline stages between A/ACIN and ACOUT (0-2)
                          ADREG => 0,                        -- Pipeline stages for pre-adder (0-1)
                          ALUMODEREG => 1,                   -- Pipeline stages for ALUMODE (0-1)
                          AREG => 0,                         -- Pipeline stages for A (0-2)
                          BCASCREG => 0,                     -- Number of pipeline stages between B/BCIN and BCOUT (0-2)
                          BREG => 0,                         -- Pipeline stages for B (0-2)
                          CARRYINREG => 0,                   -- Pipeline stages for CARRYIN (0-1)
                          CARRYINSELREG => 1,                -- Pipeline stages for CARRYINSEL (0-1)
                          CREG => 0,                         -- Pipeline stages for C (0-1)
                          DREG => 0,                         -- Pipeline stages for D (0-1)
                          INMODEREG => 1,                    -- Pipeline stages for INMODE (0-1)
                          MREG => 0,                         -- Multiplier pipeline stages (0-1)
                          OPMODEREG => 1,                    -- Pipeline stages for OPMODE (0-1)
                          PREG => 1                          -- NEEDED TO SAMPLE THE TDL INTERNALLY
                       )
                       port map (
                          -- Cascade outputs: Cascade Ports
                          ACOUT => open,                   -- 30-bit output: A port cascade
                          BCOUT => BCOUT(I),                   -- 18-bit output: B cascade
                          CARRYCASCOUT => open,     -- 1-bit output: Cascade carry
                          MULTSIGNOUT => open,       -- 1-bit output: Multiplier sign cascade
                          PCOUT => open,                   -- 48-bit output: Cascade output
                          -- Control outputs: Control Inputs/Status Bits
                          OVERFLOW => open,             -- 1-bit output: Overflow in add/acc
                          PATTERNBDETECT => open, -- 1-bit output: Pattern bar detect
                          PATTERNDETECT => open,   -- 1-bit output: Pattern detect
                          UNDERFLOW => open,           -- 1-bit output: Underflow in add/acc
                          -- Data outputs: Data Ports
                          CARRYOUT => open,             -- 4-bit output: Carry
                          P => O(BIT_DSP*(I+1)-1 downto BIT_DSP*I),                           -- 48-bit output: Primary data
                          XOROUT => open,                 -- 8-bit output: XOR data
                          -- Cascade inputs: Cascade Ports
                          ACIN => (Others => '0'),                     -- 30-bit input: A cascade data
                          BCIN => BCOUT(I-1),                     -- 18-bit input: B cascade
                          CARRYCASCIN => '0',       -- 1-bit input: Cascade carry
                          MULTSIGNIN => '0',         -- 1-bit input: Multiplier sign cascade
                          PCIN => (Others => '0'),                     -- 48-bit input: P cascade
                          -- Control inputs: Control Inputs/Status Bits
                          ALUMODE => "0011",               -- 4-bit input: ALU control
                          CARRYINSEL => "000",         -- 3-bit input: Carry select
                          CLK => clk,                       -- 1-bit input: Clock
                          INMODE => (Others => '0'),                 -- 5-bit input: INMODE control
                          OPMODE => "000110011",                 -- 9-bit input: Operation mode
                          -- Data inputs: Data Ports
                          A => (Others => '0'),                           -- 30-bit input: A data
                          B => (Others => '0'),                           -- 18-bit input: B data
                          C => (Others => '0'),                           -- 48-bit input: C data
                          CARRYIN => '0',               -- 1-bit input: Carry-in
                          D => (Others => '0'),                           -- 27-bit input: D data
                          -- Reset/Clock Enable inputs: Reset/Clock Enable Inputs
                          CEA1 => '1',                     -- 1-bit input: Clock enable for 1st stage AREG
                          CEA2 => '1',                     -- 1-bit input: Clock enable for 2nd stage AREG
                          CEAD => '1',                     -- 1-bit input: Clock enable for ADREG
                          CEALUMODE => '1',           -- 1-bit input: Clock enable for ALUMODE
                          CEB1 => '1',                     -- 1-bit input: Clock enable for 1st stage BREG
                          CEB2 => '1',                     -- 1-bit input: Clock enable for 2nd stage BREG
                          CEC => '1',                       -- 1-bit input: Clock enable for CREG
                          CECARRYIN => '1',           -- 1-bit input: Clock enable for CARRYINREG
                          CECTRL => '1',                 -- 1-bit input: Clock enable for OPMODEREG and CARRYINSELREG
                          CED => '1',                       -- 1-bit input: Clock enable for DREG
                          CEINMODE => '1',             -- 1-bit input: Clock enable for INMODEREG
                          CEM => '1',                       -- 1-bit input: Clock enable for MREG
                          CEP => '1',                       -- 1-bit input: Clock enable for PREG
                          RSTA => '0',                     -- 1-bit input: Reset for AREG
                          RSTALLCARRYIN => '0',   -- 1-bit input: Reset for CARRYINREG
                          RSTALUMODE => '0',         -- 1-bit input: Reset for ALUMODEREG
                          RSTB => '0',                     -- 1-bit input: Reset for BREG
                          RSTC => '0',                     -- 1-bit input: Reset for CREG
                          RSTCTRL => '0',               -- 1-bit input: Reset for OPMODEREG and CARRYINSELREG
                          RSTD => '0',                     -- 1-bit input: Reset for DREG and ADREG
                          RSTINMODE => '0',           -- 1-bit input: Reset for INMODEREG
                          RSTM => '0',                     -- 1-bit input: Reset for MREG
                          RSTP => '0'                      -- 1-bit input: Reset for PREG
                       );
                       
               end generate;
       end generate;
       
      
      ---- X7S TDL generation ----
      X7S_DSP_GEN : if XUS_VS_X7S = "X7S" generate
      begin
        
        DSP48E1_inst : DSP48E1
            generic map (
              -- Feature Control Attributes: Data Path Selection
              A_INPUT => "DIRECT",               -- Selects A input source, "DIRECT" (A port) or "CASCADE" (ACIN port)
              B_INPUT => "DIRECT",               -- Selects B input source, "DIRECT" (B port) or "CASCADE" (BCIN port)
              USE_DPORT => FALSE,                -- Select D port usage (TRUE or FALSE)
              USE_MULT => "NONE",            -- Select multiplier usage ("MULTIPLY", "DYNAMIC", or "NONE")
              USE_SIMD => "ONE48",               -- SIMD selection ("ONE48", "TWO24", "FOUR12")
              -- Pattern Detector Attributes: Pattern Detection Configuration
              AUTORESET_PATDET => "NO_RESET",    -- "NO_RESET", "RESET_MATCH", "RESET_NOT_MATCH"
              MASK => X"3fffffffffff",           -- 48-bit mask value for pattern detect (1=ignore)
              PATTERN => X"000000000000",        -- 48-bit pattern match for pattern detect
              SEL_MASK => "MASK",                -- "C", "MASK", "ROUNDING_MODE1", "ROUNDING_MODE2"
              SEL_PATTERN => "PATTERN",          -- Select pattern value ("PATTERN" or "C")
              USE_PATTERN_DETECT => "NO_PATDET", -- Enable pattern detect ("PATDET" or "NO_PATDET")
              -- Register Control Attributes: Pipeline Register Configuration
              ACASCREG => 0,                     -- Number of pipeline stages between A/ACIN and ACOUT (0, 1 or 2)
              ADREG => 0,                        -- Number of pipeline stages for pre-adder (0 or 1)
              ALUMODEREG => 1,                   -- Number of pipeline stages for ALUMODE (0 or 1)
              AREG => 0,                         -- Number of pipeline stages for A (0, 1 or 2)
              BCASCREG => 0,                     -- Number of pipeline stages between B/BCIN and BCOUT (0, 1 or 2)
              BREG => 0,                         -- Number of pipeline stages for B (0, 1 or 2)
              CARRYINREG => 0,                   -- Number of pipeline stages for CARRYIN (0 or 1)
              CARRYINSELREG => 1,                -- Number of pipeline stages for CARRYINSEL (0 or 1)
              CREG => 0,                         -- Number of pipeline stages for C (0 or 1)
              DREG => 0,                         -- Number of pipeline stages for D (0 or 1)
              INMODEREG => 1,                    -- Number of pipeline stages for INMODE (0 or 1)
              MREG => 0,                         -- Number of multiplier pipeline stages (0 or 1)
              OPMODEREG => 1,                    -- Number of pipeline stages for OPMODE (0 or 1)
              PREG => 1                          -- NEEDED TO SAMPLE THE TDL INTERNALLY
           )
           port map (
              -- Cascade: 30-bit (each) output: Cascade Ports
              ACOUT => open,                   -- 30-bit output: A port cascade output
              BCOUT => BCOUT(0),                   -- 18-bit output: B port cascade output
              CARRYCASCOUT => open,     -- 1-bit output: Cascade carry output
              MULTSIGNOUT => open,       -- 1-bit output: Multiplier sign cascade output
              PCOUT => open,                   -- 48-bit output: Cascade output
              -- Control: 1-bit (each) output: Control Inputs/Status Bits
              OVERFLOW => open,             -- 1-bit output: Overflow in add/acc output
              PATTERNBDETECT => open, -- 1-bit output: Pattern bar detect output
              PATTERNDETECT => open,   -- 1-bit output: Pattern detect output
              UNDERFLOW => open,           -- 1-bit output: Underflow in add/acc output
              -- Data: 4-bit (each) output: Data Ports
              CARRYOUT => open,             -- 4-bit output: Carry output
              P => O(BIT_DSP-1 downto 0),                           -- 48-bit output: Primary data output
              -- Cascade: 30-bit (each) input: Cascade Ports
              ACIN => (Others => '0'),                     -- 30-bit input: A cascade data input
              BCIN => (Others => '0'),                     -- 18-bit input: B cascade input
              CARRYCASCIN => '0',       -- 1-bit input: Cascade carry input
              MULTSIGNIN => '0',         -- 1-bit input: Multiplier sign input
              PCIN => (Others => '0'),                     -- 48-bit input: P cascade input
              -- Control: 4-bit (each) input: Control Inputs/Status Bits
              ALUMODE => "0011",               -- 4-bit input: ALU control input
              CARRYINSEL => "000",         -- 3-bit input: Carry select input
              CLK => clk,                       -- 1-bit input: Clock input
              INMODE => (Others => '0'),                 -- 5-bit input: INMODE control input
              OPMODE => "0110011", --Others => '0'),                 -- 7-bit input: Operation mode input
              -- Data: 30-bit (each) input: Data Ports
              A => (Others => '0'),                           -- 30-bit input: A data input
              B => B,                           -- 18-bit input: B data input
              C => (Others => '0'),                           -- 48-bit input: C data input
              CARRYIN => '0',               -- 1-bit input: Carry input signal
              D => (Others => '0'),                           -- 25-bit input: D data input
              -- Reset/Clock Enable: 1-bit (each) input: Reset/Clock Enable Inputs
              CEA1 => '1',                     -- 1-bit input: Clock enable input for 1st stage AREG
              CEA2 => '1',                     -- 1-bit input: Clock enable input for 2nd stage AREG
              CEAD => '1',                     -- 1-bit input: Clock enable input for ADREG
              CEALUMODE => '1',           -- 1-bit input: Clock enable input for ALUMODE
              CEB1 => '1',                     -- 1-bit input: Clock enable input for 1st stage BREG
              CEB2 => '1',                     -- 1-bit input: Clock enable input for 2nd stage BREG
              CEC => '1',                       -- 1-bit input: Clock enable input for CREG
              CECARRYIN => '1',           -- 1-bit input: Clock enable input for CARRYINREG
              CECTRL => '1',                 -- 1-bit input: Clock enable input for OPMODEREG and CARRYINSELREG
              CED => '1',                       -- 1-bit input: Clock enable input for DREG
              CEINMODE => '1',             -- 1-bit input: Clock enable input for INMODEREG
              CEM => '1',                       -- 1-bit input: Clock enable input for MREG
              CEP => '1',                       -- 1-bit input: Clock enable input for PREG
              RSTA => '0',                     -- 1-bit input: Reset input for AREG
              RSTALLCARRYIN => '0',   -- 1-bit input: Reset input for CARRYINREG
              RSTALUMODE => '0',         -- 1-bit input: Reset input for ALUMODEREG
              RSTB => '0',                     -- 1-bit input: Reset input for BREG
              RSTC => '0',                     -- 1-bit input: Reset input for CREG
              RSTCTRL => '0',               -- 1-bit input: Reset input for OPMODEREG and CARRYINSELREG
              RSTD => '0',                     -- 1-bit input: Reset input for DREG and ADREG
              RSTINMODE => '0',           -- 1-bit input: Reset input for INMODEREG
              RSTM => '0',                     -- 1-bit input: Reset input for MREG
              RSTP => '0'                      -- 1-bit input: Reset input for PREG
           );
    
    
    
    
    
    
    
    
            Gen_DSP48E1_TDC : for I in 1 to NUM_DSP_TOT-1 generate
            begin
    
                DSP48E1_inst : DSP48E1
                    generic map (
                        -- Feature Control Attributes: Data Path Selection
                        A_INPUT => "DIRECT",               -- Selects A input source, "DIRECT" (A port) or "CASCADE" (ACIN port)
                        B_INPUT => "CASCADE",               -- Selects B input source, "DIRECT" (B port) or "CASCADE" (BCIN port)
                        USE_DPORT => FALSE,                -- Select D port usage (TRUE or FALSE)
                        USE_MULT => "NONE",            -- Select multiplier usage ("MULTIPLY", "DYNAMIC", or "NONE")
                        USE_SIMD => "ONE48",               -- SIMD selection ("ONE48", "TWO24", "FOUR12")
                        -- Pattern Detector Attributes: Pattern Detection Configuration
                        AUTORESET_PATDET => "NO_RESET",    -- "NO_RESET", "RESET_MATCH", "RESET_NOT_MATCH"
                        MASK => X"3fffffffffff",           -- 48-bit mask value for pattern detect (1=ignore)
                        PATTERN => X"000000000000",        -- 48-bit pattern match for pattern detect
                        SEL_MASK => "MASK",                -- "C", "MASK", "ROUNDING_MODE1", "ROUNDING_MODE2"
                        SEL_PATTERN => "PATTERN",          -- Select pattern value ("PATTERN" or "C")
                        USE_PATTERN_DETECT => "NO_PATDET", -- Enable pattern detect ("PATDET" or "NO_PATDET")
                        -- Register Control Attributes: Pipeline Register Configuration
                        ACASCREG => 0,                     -- Number of pipeline stages between A/ACIN and ACOUT (0, 1 or 2)
                        ADREG => 0,                        -- Number of pipeline stages for pre-adder (0 or 1)
                        ALUMODEREG => 1,                   -- Number of pipeline stages for ALUMODE (0 or 1)
                        AREG => 0,                         -- Number of pipeline stages for A (0, 1 or 2)
                        BCASCREG => 0,                     -- Number of pipeline stages between B/BCIN and BCOUT (0, 1 or 2)
                        BREG => 0,                         -- Number of pipeline stages for B (0, 1 or 2)
                        CARRYINREG => 0,                   -- Number of pipeline stages for CARRYIN (0 or 1)
                        CARRYINSELREG => 1,                -- Number of pipeline stages for CARRYINSEL (0 or 1)
                        CREG => 0,                         -- Number of pipeline stages for C (0 or 1)
                        DREG => 0,                         -- Number of pipeline stages for D (0 or 1)
                        INMODEREG => 1,                    -- Number of pipeline stages for INMODE (0 or 1)
                        MREG => 0,                         -- Number of multiplier pipeline stages (0 or 1)
                        OPMODEREG => 1,                    -- Number of pipeline stages for OPMODE (0 or 1)
                        PREG => 1                          -- NEEDED TO SAMPLE THE TDL INTERNALLY
                    )
                    port map (
                        -- Cascade: 30-bit (each) output: Cascade Ports
                        ACOUT => open,                   -- 30-bit output: A port cascade output
                        BCOUT => BCOUT(I),                   -- 18-bit output: B port cascade output
                        CARRYCASCOUT => open,     -- 1-bit output: Cascade carry output
                        MULTSIGNOUT => open,       -- 1-bit output: Multiplier sign cascade output
                        PCOUT => open,                   -- 48-bit output: Cascade output
                        -- Control: 1-bit (each) output: Control Inputs/Status Bits
                        OVERFLOW => open,             -- 1-bit output: Overflow in add/acc output
                        PATTERNBDETECT => open, -- 1-bit output: Pattern bar detect output
                        PATTERNDETECT => open,   -- 1-bit output: Pattern detect output
                        UNDERFLOW => open,           -- 1-bit output: Underflow in add/acc output
                        -- Data: 4-bit (each) output: Data Ports
                        CARRYOUT => open,             -- 4-bit output: Carry output
                        P => O(BIT_DSP*(I+1)-1 downto BIT_DSP*I),                           -- 48-bit output: Primary data output
                        -- Cascade: 30-bit (each) input: Cascade Ports
                        ACIN => (Others => '0'),                     -- 30-bit input: A cascade data input
                        BCIN => BCOUT(I-1),                     -- 18-bit input: B cascade input
                        CARRYCASCIN => '0',       -- 1-bit input: Cascade carry input
                        MULTSIGNIN => '0',         -- 1-bit input: Multiplier sign input
                        PCIN => (Others => '0'),                     -- 48-bit input: P cascade input
                        -- Control: 4-bit (each) input: Control Inputs/Status Bits
                        ALUMODE => "0011",               -- 4-bit input: ALU control input
                        CARRYINSEL => "000",         -- 3-bit input: Carry select input
                        CLK => clk,                       -- 1-bit input: Clock input
                        INMODE => (Others => '0'),                 -- 5-bit input: INMODE control input
                        OPMODE => ("0110011"), --Others => '0'),                 -- 7-bit input: Operation mode input
                        -- Data: 30-bit (each) input: Data Ports
                        A => (Others => '0'),                           -- 30-bit input: A data input
                        B => (Others => '0'),                           -- 18-bit input: B data input
                        C => (Others => '0'),
                        CARRYIN => '0',               -- 1-bit input: Carry input signal
                        D => (Others => '0'),                           -- 25-bit input: D data input
                        -- Reset/Clock Enable: 1-bit (each) input: Reset/Clock Enable Inputs
                        CEA1 => '1',                     -- 1-bit input: Clock enable input for 1st stage AREG
                        CEA2 => '1',                     -- 1-bit input: Clock enable input for 2nd stage AREG
                        CEAD => '1',                     -- 1-bit input: Clock enable input for ADREG
                        CEALUMODE => '1',           -- 1-bit input: Clock enable input for ALUMODE
                        CEB1 => '1',                     -- 1-bit input: Clock enable input for 1st stage BREG
                        CEB2 => '1',                     -- 1-bit input: Clock enable input for 2nd stage BREG
                        CEC => '1',                       -- 1-bit input: Clock enable input for CREG
                        CECARRYIN => '1',           -- 1-bit input: Clock enable input for CARRYINREG
                        CECTRL => '1',                 -- 1-bit input: Clock enable input for OPMODEREG and CARRYINSELREG
                        CED => '1',                       -- 1-bit input: Clock enable input for DREG
                        CEINMODE => '1',             -- 1-bit input: Clock enable input for INMODEREG
                        CEM => '1',                       -- 1-bit input: Clock enable input for MREG
                        CEP => '1',                       -- 1-bit input: Clock enable input for PREG
                        RSTA => '0',                     -- 1-bit input: Reset input for AREG
                        RSTALLCARRYIN => '0',   -- 1-bit input: Reset input for CARRYINREG
                        RSTALUMODE => '0',         -- 1-bit input: Reset input for ALUMODEREG
                        RSTB => '0',                     -- 1-bit input: Reset input for BREG
                        RSTC => '0',                     -- 1-bit input: Reset input for CREG
                        RSTCTRL => '0',               -- 1-bit input: Reset input for OPMODEREG and CARRYINSELREG
                        RSTD => '0',                     -- 1-bit input: Reset input for DREG and ADREG
                        RSTINMODE => '0',           -- 1-bit input: Reset input for INMODEREG
                        RSTM => '0',                     -- 1-bit input: Reset input for MREG
                        RSTP => '0'                       -- 1-bit input: Reset input for PREG
                    );
    
    
    
            end generate; 
      
       end generate;
end Behavioral;