--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   20:07:23 10/27/2014
-- Design Name:   
-- Module Name:   C:/Users/Ivan/Desktop/Practicas digital  Repeticion/Realizacion/Practica_4/Sumador_completo_tb.vhd
-- Project Name:  Practica_4
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: sumador_completo
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
 
ENTITY Sumador_completo_tb IS
END Sumador_completo_tb;
 
ARCHITECTURE behavior OF Sumador_completo_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT sumador_completo
    PORT(
         x : IN  std_logic_vector(3 downto 0);
         y : IN  std_logic_vector(3 downto 0);
         control1 : IN  std_logic;
         control2 : IN  std_logic;
         op_select : IN  std_logic;
         overflow : OUT  std_logic;
         salida : OUT  std_logic_vector(3 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal x : std_logic_vector(3 downto 0) := (others => '0');
   signal y : std_logic_vector(3 downto 0) := (others => '0');
   signal control1 : std_logic := '0';
   signal control2 : std_logic := '0';
   signal op_select : std_logic := '0';

 	--Outputs
   signal overflow : std_logic;
   signal salida : std_logic_vector(3 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 

 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: sumador_completo PORT MAP (
          x => x,
          y => y,
          control1 => control1,
          control2 => control2,
          op_select => op_select,
          overflow => overflow,
          salida => salida
        );

  
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      x <= "1101" ;
		y <= "1011" ;
		
		op_select <= '0' ;
		control2 <= '0' ;
		control1 <= '0' ;
		
		wait for 100 ns ;
		
		op_select <= '0' ;
		control2 <= '0' ;
		control1 <= '0' ;
		
		wait for 100 ns ;
		
		op_select <= '0' ;
		control2 <= '1' ;
		control1 <= '0' ;
		
		wait for 100 ns ;
		
		op_select <= '0' ;
		control2 <= '1' ;
		control1 <= '1' ;
		
		wait for 100 ns;
		
		op_select <= '1' ;
		control2 <= '0' ;
		control1 <= '0' ;
		
		wait for 100 ns ;
		
		op_select <= '1' ;
		control2 <= '0' ;
		control1 <= '1' ;
		
		wait for 100 ns ;
		
		op_select <= '1' ;
		control2 <= '1' ;
		control1 <= '0' ;
		
		wait for 100 ns ;
		
		op_select <= '1' ;
		control2 <= '1' ;
		control1 <= '1' ;

    

      -- insert stimulus here 

      wait;
   end process;

END;
