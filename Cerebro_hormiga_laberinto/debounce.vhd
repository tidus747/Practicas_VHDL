--------------------------------------------------------------------------------
--
--   FileName:         debounce.vhd
--   Dependencies:     none
--   Design Software:  Quartus II 32-bit Version 11.1 Build 173 SJ Full Version
--
--   HDL CODE IS PROVIDED "AS IS."  DIGI-KEY EXPRESSLY DISCLAIMS ANY
--   WARRANTY OF ANY KIND, WHETHER EXPRESS OR IMPLIED, INCLUDING BUT NOT
--   LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY, FITNESS FOR A
--   PARTICULAR PURPOSE, OR NON-INFRINGEMENT. IN NO EVENT SHALL DIGI-KEY
--   BE LIABLE FOR ANY INCIDENTAL, SPECIAL, INDIRECT OR CONSEQUENTIAL
--   DAMAGES, LOST PROFITS OR LOST DATA, HARM TO YOUR EQUIPMENT, COST OF
--   PROCUREMENT OF SUBSTITUTE GOODS, TECHNOLOGY OR SERVICES, ANY CLAIMS
--   BY THIRD PARTIES (INCLUDING BUT NOT LIMITED TO ANY DEFENSE THEREOF),
--   ANY CLAIMS FOR INDEMNITY OR CONTRIBUTION, OR OTHER SIMILAR COSTS.
--
--   Version History
--   Version 1.0 3/26/2012 Scott Larson
--     Initial Public Release
--
--------------------------------------------------------------------------------

LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;

ENTITY debounce IS
  GENERIC(
    counter_size  :  INTEGER := 19); --counter size (24 bits gives 335.5ms with 50MHz clock)
  PORT(
    clk     : IN  STD_LOGIC;  --input clock
    antena_izq  : IN  STD_LOGIC;  --input signal to be debounced
	 antena_der : IN STD_LOGIC;
    result  : OUT STD_LOGIC_VECTOR (1 downto 0) := "00"); --debounced signal
END debounce;

ARCHITECTURE logic OF debounce IS
  SIGNAL flipflops_1   : STD_LOGIC_VECTOR(1 DOWNTO 0) := (OTHERS => '0'); --input flip flops
  SIGNAL flipflops_2   : STD_LOGIC_VECTOR(1 DOWNTO 0) := (OTHERS => '0'); --input flip flops
  SIGNAL counter_set_1 : STD_LOGIC := '0';  --sync reset to zero
  SIGNAL counter_set_2 : STD_LOGIC := '0';  --sync reset to zero
  SIGNAL counter_out : STD_LOGIC_VECTOR(counter_size DOWNTO 0) := (OTHERS => '0'); --counter output

BEGIN
	
  counter_set_1 <= flipflops_1(0) xor flipflops_1(1);
  counter_set_2 <= flipflops_2(0) xor flipflops_2(1);  --determine when to start/reset counter
  
  PROCESS(clk)
  BEGIN
    IF(clk'EVENT and clk = '1') THEN
			flipflops_1(0) <= antena_izq ;
			flipflops_2(0) <= antena_der;
			flipflops_1(1) <= flipflops_1(0);
			flipflops_2(1) <= flipflops_2(0);
      If(counter_set_1 = '1' or counter_set_2 ='1' ) THEN                  --reset counter because input is changing
        counter_out <= (OTHERS => '0');
      ELSIF(counter_out(counter_size) = '0') THEN --stable input time is not yet met
        counter_out <= counter_out + 1;
      ELSE                                        --stable input time is met
        result(1) <= flipflops_1(1);
		  result(0) <= flipflops_2(1);
      END IF;    
    END IF;
  END PROCESS;
END logic;
