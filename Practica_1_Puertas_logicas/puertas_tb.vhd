--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   18:38:09 10/11/2014
-- Design Name:   
-- Module Name:   C:/Users/Ivan/Desktop/Practicas digital  Repeticion/Realizacion/Practica_1REP/puertas_tb.vhd
-- Project Name:  Practica_1REP
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: puertas
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
 
ENTITY puertas_tb IS
END puertas_tb;
 
ARCHITECTURE behavior OF puertas_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT puertas
    PORT(
         a : IN  std_logic;
         b : IN  std_logic;
         f_inv : OUT  std_logic;
         f_and2 : OUT  std_logic;
         f_or2 : OUT  std_logic;
         f_nand2 : OUT  std_logic;
         f_nor2 : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal a : std_logic := '0';
   signal b : std_logic := '0';

 	--Outputs
   signal f_inv : std_logic;
   signal f_and2 : std_logic;
   signal f_or2 : std_logic;
   signal f_nand2 : std_logic;
   signal f_nor2 : std_logic;
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
   
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: puertas PORT MAP (
          a => a,
          b => b,
          f_inv => f_inv,
          f_and2 => f_and2,
          f_or2 => f_or2,
          f_nand2 => f_nand2,
          f_nor2 => f_nor2
        );

  
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      	

     a <= '0' ;
	  b <= '0' ;
	  
	  wait for 100 ns;
	  
	  a <= '0' ;
	  b <= '1' ;
	  
	  wait for 100 ns ;
	  
	  a <= '1' ;
	  b <= '0' ;
	  
	  wait for 100 ns ;
	  
	  a <= '1' ;
	  b <= '1' ;
	  
	  wait for 100 ns ;

      -- insert stimulus here 

      wait;
   end process;

END;
