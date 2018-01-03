--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   13:21:26 11/27/2014
-- Design Name:   
-- Module Name:   C:/Users/Ivan/Desktop/Practicas digital  Repeticion/Realizacion/Controlador_ultrasonidos/cycle_counter_tb.vhd
-- Project Name:  Controlador_ultrasonidos
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: cycle_counter
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
 
ENTITY cycle_counter_tb IS
END cycle_counter_tb;
 
ARCHITECTURE behavior OF cycle_counter_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT cycle_counter
    PORT(
         rst : IN  std_logic;
         en : IN  std_logic;
         clk : IN  std_logic;
         count : OUT  std_logic_vector(14 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal rst : std_logic := '1';
   signal en : std_logic := '1';
   signal clk : std_logic := '0';

 	--Outputs
   signal count : std_logic_vector(14 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: cycle_counter PORT MAP (
          rst => rst,
          en => en,
          clk => clk,
          count => count
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
      rst <= '0';
		wait for 100 ns;	
		
		

      wait for clk_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;
