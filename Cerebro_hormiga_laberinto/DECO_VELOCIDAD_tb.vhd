--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   20:28:15 12/08/2014
-- Design Name:   
-- Module Name:   C:/Users/Ivan/Desktop/Practicas digital  Repeticion/Realizacion/Cerebr_hormiga/DECO_VELOCIDAD_tb.vhd
-- Project Name:  Cerebr_hormiga
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: DECO_GIRO
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
 
ENTITY DECO_VELOCIDAD_tb IS
END DECO_VELOCIDAD_tb;
 
ARCHITECTURE behavior OF DECO_VELOCIDAD_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT DECO_GIRO
    PORT(
         motor_der : IN  std_logic;
         motor_izq : IN  std_logic;
         cont_der : OUT  std_logic_vector(1 downto 0);
         cont_izq : OUT  std_logic_vector(1 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal motor_der : std_logic := '0';
   signal motor_izq : std_logic := '0';

 	--Outputs
   signal cont_der : std_logic_vector(1 downto 0);
   signal cont_izq : std_logic_vector(1 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: DECO_GIRO PORT MAP (
          motor_der => motor_der,
          motor_izq => motor_izq,
          cont_der => cont_der,
          cont_izq => cont_izq
        );



   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;

			motor_der <= '0';
			motor_izq <= '0';
			
			wait for 100 ns;
			
			motor_der <= '0';
			motor_izq <= '1';
			
			wait for 100 ns;
			
			motor_der <= '1';
			motor_izq <= '0';
			
			wait for 100 ns;
			
			motor_der <= '1';
			motor_izq <= '1';
			
			
			



      -- insert stimulus here 

      wait;
   end process;

END;
