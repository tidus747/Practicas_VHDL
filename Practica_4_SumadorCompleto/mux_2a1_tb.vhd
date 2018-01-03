--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   09:19:54 10/21/2014
-- Design Name:   
-- Module Name:   C:/Users/Ivan/Desktop/Practicas digital  Repeticion/Realizacion/Practica_4/mux_2a1_tb.vhd
-- Project Name:  Practica_4
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: mux_2a1
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
 
ENTITY mux_2a1_tb IS
END mux_2a1_tb;
 
ARCHITECTURE behavior OF mux_2a1_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT mux_2a1
    PORT(
         d0 : IN  std_logic;
         d1 : IN  std_logic;
         sel : IN  std_logic;
         z : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal d0 : std_logic := '0';
   signal d1 : std_logic := '0';
   signal sel : std_logic := '0';

 	--Outputs
   signal z : std_logic;
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 

 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: mux_2a1 PORT MAP (
          d0 => d0,
          d1 => d1,
          sel => sel,
          z => z
        );

 
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
   d0 <= '0' ;
	d1 <= '1' ;
	sel <= '0';
	
	wait for 100 ns ;
	
	sel <= '1' ;
	
	wait for 100 ns ;
	

    

      -- insert stimulus here 

      wait;
   end process;

END;
