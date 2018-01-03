--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   00:27:06 11/27/2014
-- Design Name:   
-- Module Name:   C:/Users/Ivan/Desktop/Practicas digital  Repeticion/Realizacion/Controlador_ultrasonidos/eco_tb.vhd
-- Project Name:  Controlador_ultrasonidos
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: eco_counter
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
 
ENTITY eco_tb IS
END eco_tb;
 
ARCHITECTURE behavior OF eco_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT eco_counter
    PORT(
         clk : IN  std_logic;
         en : IN  std_logic;
         rst : IN  std_logic;
         cm_count : OUT  std_logic_vector(3 downto 0);
         dm_count : OUT  std_logic_vector(3 downto 0);
         m_count : OUT  std_logic_vector(3 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal en : std_logic := '1';
   signal rst : std_logic := '1';

 	--Outputs
   signal cm_count : std_logic_vector(3 downto 0);
   signal dm_count : std_logic_vector(3 downto 0);
   signal m_count : std_logic_vector(3 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: eco_counter PORT MAP (
          clk => clk,
          en => en,
          rst => rst,
          cm_count => cm_count,
          dm_count => dm_count,
          m_count => m_count
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
			 rst <= '0';	
			
			

      wait for clk_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;
