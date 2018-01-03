--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   21:54:39 12/08/2014
-- Design Name:   
-- Module Name:   C:/Users/Ivan/Desktop/Practicas digital  Repeticion/Realizacion/Cerebr_hormiga/deco_velocidad_2_tb.vhd
-- Project Name:  Cerebr_hormiga
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: deco_velocidad
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
 
ENTITY deco_velocidad_2_tb IS
END deco_velocidad_2_tb;
 
ARCHITECTURE behavior OF deco_velocidad_2_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT deco_velocidad
    PORT(
         modo_av_rot : IN  std_logic;
         cm_in : IN  std_logic_vector(3 downto 0);
         consigna_vel : OUT  std_logic_vector(7 downto 0);
         dm_in : IN  std_logic_vector(3 downto 0);
         m_in : IN  std_logic_vector(3 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal modo_av_rot : std_logic := '0';
   signal cm_in : std_logic_vector(3 downto 0) := (others => '0');
   signal dm_in : std_logic_vector(3 downto 0) := (others => '0');
   signal m_in : std_logic_vector(3 downto 0) := (others => '0');

 	--Outputs
   signal consigna_vel : std_logic_vector(7 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 

 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: deco_velocidad PORT MAP (
          modo_av_rot => modo_av_rot,
          cm_in => cm_in,
          consigna_vel => consigna_vel,
          dm_in => dm_in,
          m_in => m_in
        );

  
 

   -- Stimulus process
   stim_proc: process
   begin		


      modo_av_rot <= '0';
		cm_in <= "1001";
		dm_in <= "0010";
		m_in <= "0000";
		
		wait for 100 ns;
		
		modo_av_rot <= '0';
		cm_in <= "0000";
		dm_in <= "0011";
		m_in <= "0000";
		
		wait for 100 ns;
		
		modo_av_rot <= '0';
		cm_in <= "0001";
		dm_in <= "0011";
		m_in <= "0000";

    
      -- insert stimulus here 

      wait;
   end process;

END;
