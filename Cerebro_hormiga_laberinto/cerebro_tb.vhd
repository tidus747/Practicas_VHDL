--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   11:34:02 12/02/2014
-- Design Name:   
-- Module Name:   C:/Users/Ivan/Desktop/Practicas digital  Repeticion/Realizacion/Cerebr_hormiga/cerebro_tb.vhd
-- Project Name:  Cerebr_hormiga
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Cerebro
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
 
ENTITY cerebro_tb IS
END cerebro_tb;
 
ARCHITECTURE behavior OF cerebro_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Cerebro
    PORT(
         antenas : IN  std_logic_vector(1 downto 0);
         derecha : OUT  std_logic;
         izquierda : OUT  std_logic;
         en : IN  std_logic;
         rst : IN  std_logic;
         clk : IN  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal antenas : std_logic_vector(1 downto 0) := (others => '0');
   signal en : std_logic := '1';
   signal rst : std_logic := '0';
   signal clk : std_logic := '1';

 	--Outputs
   signal derecha : std_logic;
   signal izquierda : std_logic;

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Cerebro PORT MAP (
          antenas => antenas,
          derecha => derecha,
          izquierda => izquierda,
          en => en,
          rst => rst,
          clk => clk
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
		
		antenas <= "00" ;
		
		wait for 100 ns;
		
		

      wait for clk_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;
