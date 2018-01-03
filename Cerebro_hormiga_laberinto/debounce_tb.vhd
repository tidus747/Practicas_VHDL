--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   20:00:09 12/08/2014
-- Design Name:   
-- Module Name:   C:/Users/Ivan/Desktop/Practicas digital  Repeticion/Realizacion/Cerebr_hormiga/debounce_tb.vhd
-- Project Name:  Cerebr_hormiga
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: debounce
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY debounce_tb IS
END debounce_tb;
 
ARCHITECTURE behavior OF debounce_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT debounce
    PORT(
         clk : IN  std_logic;
         antena_izq : IN  std_logic;
         antena_der : IN  std_logic;
         result : OUT  std_logic_vector(1 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal antena_izq : std_logic := '0';
   signal antena_der : std_logic := '0';

 	--Outputs
   signal result : std_logic_vector(1 downto 0);

   -- Clock period definitions
   constant clk_period : time := 20 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: debounce PORT MAP (
          clk => clk,
          antena_izq => antena_izq,
          antena_der => antena_der,
          result => result
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.	
		
		antena_izq <= '0';
		antena_der <= '0' ;
		
		wait for 100 ms;
		
		antena_izq <= '1';
		antena_der <= '0';
		
		wait for 100 ms;
		
		antena_izq <= '0';
		antena_der <= '1';
		
		wait for 100 ms;
		
		antena_izq <= '1';
		antena_der <= '1';

      wait for clk_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;
