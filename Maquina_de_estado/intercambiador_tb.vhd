--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   23:20:53 11/22/2014
-- Design Name:   
-- Module Name:   C:/Users/Ivan/Desktop/Practicas digital  Repeticion/Realizacion/Maquina_de_estado/intercambiador_tb.vhd
-- Project Name:  Maquina_de_estado
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Intercambiador
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
 
ENTITY intercambiador_tb IS
END intercambiador_tb;
 
ARCHITECTURE behavior OF intercambiador_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Intercambiador
    PORT(
         y : IN  std_logic_vector(4 downto 0);
         digito0 : OUT  std_logic_vector(3 downto 0);
         digito1 : OUT  std_logic_vector(3 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal y : std_logic_vector(4 downto 0) := (others => '0');

 	--Outputs
   signal digito0 : std_logic_vector(3 downto 0);
   signal digito1 : std_logic_vector(3 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Intercambiador PORT MAP (
          y => y,
          digito0 => digito0,
          digito1 => digito1
        );


 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	
		
		y <= "10010";
		
		wait for 100 ns;
		
		y <= "00000";
		
		wait for 100 ns;
		
		y <= "01001" ;
		
		wait for 100 ns;
		
		y <= "10001" ;
		
		wait for 100 ns;
		
		y <= "10100";



      -- insert stimulus here 

      wait;
   end process;

END;
