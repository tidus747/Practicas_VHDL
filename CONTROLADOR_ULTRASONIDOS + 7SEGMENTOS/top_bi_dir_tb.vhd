--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   01:31:59 11/27/2014
-- Design Name:   
-- Module Name:   C:/Users/Tami/Desktop/PRACTICAS DIGITAL/ULTRASONIDOS/CONTROLADOR_ULTRASONIDOS/top_bi_dir_tb.vhd
-- Project Name:  CONTROLADOR_ULTRASONIDOS
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: top_bi_dir
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
 
ENTITY top_bi_dir_tb IS
END top_bi_dir_tb;
 
ARCHITECTURE behavior OF top_bi_dir_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT top_bi_dir
    PORT(
         dir : IN  std_logic;
         sig_out : IN  std_logic;
         sig_in : OUT  std_logic;
         bi : INOUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal dir : std_logic := '0';
   signal sig_out : std_logic := '0';

	--BiDirs
   signal bi : std_logic;

 	--Outputs
   signal sig_in : std_logic;
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
   constant <clock>_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: top_bi_dir PORT MAP (
          dir => dir,
          sig_out => sig_out,
          sig_in => sig_in,
          bi => bi
        );

   -- Clock process definitions
   <clock>_process :process
   begin
		<clock> <= '0';
		wait for <clock>_period/2;
		<clock> <= '1';
		wait for <clock>_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	
		dir <= '0';
		sig_in <= '0';
		sig_out <= '1';
      wait for 100 ns;	
		dir <= '1';
		sig_in <= '1';
		sig_out <= '0';
      wait for <clock>_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;
