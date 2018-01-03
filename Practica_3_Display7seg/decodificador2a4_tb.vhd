--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   16:12:04 10/12/2014
-- Design Name:   
-- Module Name:   C:/Users/Ivan/Desktop/Practicas digital  Repeticion/Realizacion/Practica_3REP/decodificador2a4_tb.vhd
-- Project Name:  Practica_3REP
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: decodificador2a4
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
 
ENTITY decodificador2a4_tb IS
END decodificador2a4_tb;
 
ARCHITECTURE behavior OF decodificador2a4_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT decodificador2a4
    PORT(
         A : IN  std_logic_vector(1 downto 0);
         D : OUT  std_logic_vector(3 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal A : std_logic_vector(1 downto 0) := (others => '0');

 	--Outputs
   signal D : std_logic_vector(3 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
  
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: decodificador2a4 PORT MAP (
          A => A,
          D => D
        );

 
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
    A <= "00";
	 
	 wait for 100 ns;
	 
	 A <= "01";
	 
	 wait for 100 ns;
	 
	 A <= "10" ;
	 
	 wait for 100 ns;
	 
	 A <= "11" ;



      -- insert stimulus here 

      wait;
   end process;

END;
