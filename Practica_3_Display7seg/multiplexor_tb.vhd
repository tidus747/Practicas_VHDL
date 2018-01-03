--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   01:56:37 10/12/2014
-- Design Name:   
-- Module Name:   C:/Users/Ivan/Desktop/Practicas digital  Repeticion/Realizacion/Practica_3REP/multiplexor_tb.vhd
-- Project Name:  Practica_3REP
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: multiplexor
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
 
ENTITY multiplexor_tb IS
END multiplexor_tb;
 
ARCHITECTURE behavior OF multiplexor_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT multiplexor
    PORT(
         in_0 : IN  std_logic_vector(3 downto 0);
         in_1 : IN  std_logic_vector(3 downto 0);
         in_2 : IN  std_logic_vector(3 downto 0);
         in_3 : IN  std_logic_vector(3 downto 0);
         sel : IN  std_logic_vector(1 downto 0);
         output : OUT  std_logic_vector(3 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal in_0 : std_logic_vector(3 downto 0) := (others => '0');
   signal in_1 : std_logic_vector(3 downto 0) := (others => '0');
   signal in_2 : std_logic_vector(3 downto 0) := (others => '0');
   signal in_3 : std_logic_vector(3 downto 0) := (others => '0');
   signal sel : std_logic_vector(1 downto 0) := (others => '0');

 	--Outputs
   signal output : std_logic_vector(3 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: multiplexor PORT MAP (
          in_0 => in_0,
          in_1 => in_1,
          in_2 => in_2,
          in_3 => in_3,
          sel => sel,
          output => output
        );

	
     -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
    	
		
		in_0 <= "0101";
		in_1 <= "0011";
		in_2 <= "0100";
		in_3 <= "1000";
		sel <= "00" ;
		
		  wait for 100 ns;	
		  
		  sel <= "01";
		  
		    wait for 100 ns;	
			 
		sel <= "10" ;
		
		wait for 100 ns;
		
		sel <= "11" ;
		
		wait for 100 ns;

      

      -- insert stimulus here 

      wait;
   end process;

END;
