--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   21:39:06 11/24/2014
-- Design Name:   
-- Module Name:   C:/Users/Ivan/Desktop/Practicas digital  Repeticion/Realizacion/Segundo_examen/Maquina_tb.vhd
-- Project Name:  Segundo_examen
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Maquina
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
 
ENTITY Maquina_tb IS
END Maquina_tb;
 
ARCHITECTURE behavior OF Maquina_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Maquina
    PORT(
         x1 : IN  std_logic;
         x2 : IN  std_logic;
         clk : IN  std_logic;
         reset : IN  std_logic;
         ce : IN  std_logic;
         y : OUT  std_logic_vector(4 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal x1 : std_logic := '0';
   signal x2 : std_logic := '0';
   signal clk : std_logic := '0';
   signal reset : std_logic := '1';
   signal ce : std_logic := '1';

 	--Outputs
   signal y : std_logic_vector(4 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Maquina PORT MAP (
          x1 => x1,
          x2 => x2,
          clk => clk,
          reset => reset,
          ce => ce,
          y => y
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
		x1 <= '0';
		x2 <= '0';
		
		wait for 100 ns;
		
		x1 <= '1';
		x2 <= '1';
		
		wait for 100 ns;
		
		x1 <= '0';
		x2 <= '1';
		
		wait for 100 ns;
		
		x1 <= '1';
		x2 <= '0';
		wait for 100 ns;
		
		x1 <= '1';
		x2 <= '1';

      wait for clk_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;
