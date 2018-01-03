--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   22:51:28 11/22/2014
-- Design Name:   
-- Module Name:   C:/Users/Ivan/Desktop/Practicas digital  Repeticion/Realizacion/Maquina_de_estado/Representacin_tb.vhd
-- Project Name:  Maquina_de_estado
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Representacion_maquina_estado
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
 
ENTITY Representacin_tb IS
END Representacin_tb;
 
ARCHITECTURE behavior OF Representacin_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Representacion_maquina_estado
    PORT(
         reset : IN  std_logic;
         clk : IN  std_logic;
         ce : IN  std_logic;
         x1 : IN  std_logic;
         x2 : IN  std_logic;
         led : OUT  std_logic_vector(6 downto 0);
         an : OUT  std_logic_vector(3 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal reset : std_logic := '1';
   signal clk : std_logic := '0';
   signal ce : std_logic := '1';
   signal x1 : std_logic := '0';
   signal x2 : std_logic := '0';

 	--Outputs
   signal led : std_logic_vector(6 downto 0);
   signal an : std_logic_vector(3 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Representacion_maquina_estado PORT MAP (
          reset => reset,
          clk => clk,
          ce => ce,
          x1 => x1,
          x2 => x2,
          led => led,
          an => an
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
		reset <= '0';
      wait for 100 ns;
		
		x1 <= '0';
		x2 <= '0';
		
		wait for 100 ns;
		
		x1 <= '0' ;
		x2 <= '1' ;
		
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
