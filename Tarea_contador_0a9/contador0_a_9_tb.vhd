--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   22:02:11 11/11/2014
-- Design Name:   
-- Module Name:   C:/Users/Ivan/Desktop/Practicas digital  Repeticion/Realizacion/Tarea_contador/contador0_a_9_tb.vhd
-- Project Name:  Tarea_contador
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: contador0_a_9
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
 
ENTITY contador0_a_9_tb IS
END contador0_a_9_tb;
 
ARCHITECTURE behavior OF contador0_a_9_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT contador0_a_9
    PORT(
         reset : IN  std_logic;
         ce : IN  std_logic;
         clk : IN  std_logic;
         count : OUT  std_logic_vector(3 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal reset : std_logic := '1';
   signal ce : std_logic := '1';
   signal clk : std_logic := '0';

 	--Outputs
   signal count : std_logic_vector(3 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: contador0_a_9 PORT MAP (
          reset => reset,
          ce => ce,
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
      wait for 100 ns;	
		
		reset <= '0' ;
		
		wait for 80 ns; 
		
		ce <= '0' ;
		
		wait for 100 ns; 
		
		ce <= '1' ;
		
		wait for 70 ns;
		
		reset <='1' ;
		

      wait for clk_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;
