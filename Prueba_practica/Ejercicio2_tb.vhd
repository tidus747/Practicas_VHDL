--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   09:58:21 10/14/2014
-- Design Name:   
-- Module Name:   C:/Users/Ivan/Desktop/Practicas digital  Repeticion/Realizacion/Prueba_practica/Ejercicio2_tb.vhd
-- Project Name:  Prueba_practica
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Ejercicio2
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
 
ENTITY Ejercicio2_tb IS
END Ejercicio2_tb;
 
ARCHITECTURE behavior OF Ejercicio2_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Ejercicio2
    PORT(
         a : IN  std_logic_vector(2 downto 0);
         b : IN  std_logic_vector(2 downto 0);
         cin : IN  std_logic;
         s1 : OUT  std_logic_vector(2 downto 0);
         overflow : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal a : std_logic_vector(2 downto 0) := (others => '0');
   signal b : std_logic_vector(2 downto 0) := (others => '0');
   signal cin : std_logic := '0';

 	--Outputs
   signal s1 : std_logic_vector(2 downto 0);
   signal overflow : std_logic;
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
  
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Ejercicio2 PORT MAP (
          a => a,
          b => b,
          cin => cin,
          s1 => s1,
          overflow => overflow
        );

   
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
     
    cin <= '0';
	 b <= "001";
    a <= "001" ;
	 
	 wait for 100 ns ;
	 
	 a <= "010" ;
	 
	 wait for 100 ns ;
	 
	 a <= "011" ;
	 
	 wait for 100 ns ;
	 
	 a <= "100" ;
	 
	 wait for 100 ns ;
	 
	 a <= "101" ;
	 
	 wait for 100 ns ;
	 
	 a <= "110" ;
	 
	 wait for 100 ns ;
	 
	 a <= "111" ;
	 
	 

      -- insert stimulus here 

      wait;
   end process;

END;
