--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   10:09:53 10/21/2014
-- Design Name:   
-- Module Name:   C:/Users/Ivan/Desktop/Practicas digital  Repeticion/Realizacion/Practica_4/ca1_4bits_tb.vhd
-- Project Name:  Practica_4
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: ca1_4bits
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
 
ENTITY ca1_4bits_tb IS
END ca1_4bits_tb;
 
ARCHITECTURE behavior OF ca1_4bits_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT ca1_4bits
    PORT(
         din : IN  std_logic_vector(3 downto 0);
         dout : OUT  std_logic_vector(3 downto 0);
         op_select : IN  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal din : std_logic_vector(3 downto 0) := (others => '0');
   signal op_select : std_logic := '0';

 	--Outputs
   signal dout : std_logic_vector(3 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
   
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: ca1_4bits PORT MAP (
          din => din,
          dout => dout,
          op_select => op_select
        );

  
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      din <= "1110" ;
		op_select <= '0' ;
		
		wait for 100 ns ;
		
		op_select <= '1' ;

      

      -- insert stimulus here 

      wait;
   end process;

END;
