--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   01:07:37 11/27/2014
-- Design Name:   
-- Module Name:   C:/Users/Tami/Desktop/PRACTICAS DIGITAL/ULTRASONIDOS/CONTROLADOR_ULTRASONIDOS/measures_registers_tb.vhd
-- Project Name:  CONTROLADOR_ULTRASONIDOS
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: measures_registers
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
 
ENTITY measures_registers_tb IS
END measures_registers_tb;
 
ARCHITECTURE behavior OF measures_registers_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT measures_registers
    PORT(
         load : IN  std_logic;
         register_cm_in : IN  std_logic_vector(3 downto 0);
         register_dm_in : IN  std_logic_vector(3 downto 0);
         register_m_in : IN  std_logic_vector(3 downto 0);
         rst : IN  std_logic;
         clk : IN  std_logic;
         register_cm_out : OUT  std_logic_vector(3 downto 0);
         register_dm_out : OUT  std_logic_vector(3 downto 0);
         register_m_out : OUT  std_logic_vector(3 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal load : std_logic := '0';
   signal register_cm_in : std_logic_vector(3 downto 0) := (others => '0');
   signal register_dm_in : std_logic_vector(3 downto 0) := (others => '0');
   signal register_m_in : std_logic_vector(3 downto 0) := (others => '0');
   signal rst : std_logic := '1';
   signal clk : std_logic := '0';

 	--Outputs
   signal register_cm_out : std_logic_vector(3 downto 0);
   signal register_dm_out : std_logic_vector(3 downto 0);
   signal register_m_out : std_logic_vector(3 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: measures_registers PORT MAP (
          load => load,
          register_cm_in => register_cm_in,
          register_dm_in => register_dm_in,
          register_m_in => register_m_in,
          rst => rst,
          clk => clk,
          register_cm_out => register_cm_out,
          register_dm_out => register_dm_out,
          register_m_out => register_m_out
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
		rst <= '0';
		
		
      wait for 100 ns;
		load <='0';
		register_cm_in <= "0001";
		register_dm_in <= "0001";
		register_m_in <= "0001";
      wait for 100 ns;
		load <='1';
		register_cm_in <= "1000";
		register_dm_in <= "0100";
		register_m_in <= "0011";
      wait for 100 ns;
		load <='0';
		register_cm_in <= "1000";
		register_dm_in <= "0100";
		register_m_in <= "0011";
      wait for 100 ns;
		load <='1';
		register_cm_in <= "1000";
		register_dm_in <= "0100";
		register_m_in <= "0011";		
      wait for 100 ns;
		load <='0';
		register_cm_in <= "1111";
		register_dm_in <= "0111";
		register_m_in <= "1000";		
      wait for clk_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;
