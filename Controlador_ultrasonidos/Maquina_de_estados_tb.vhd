--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   12:23:12 11/26/2014
-- Design Name:   
-- Module Name:   C:/Users/Ivan/Desktop/Practicas digital  Repeticion/Realizacion/Controlador_ultrasonidos/Maquina_de_estados_tb.vhd
-- Project Name:  Controlador_ultrasonidos
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Maquina_d_estados
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
 
ENTITY Maquina_de_estados_tb IS
END Maquina_de_estados_tb;
 
ARCHITECTURE behavior OF Maquina_de_estados_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Maquina_d_estados
    PORT(
         cycle_count_in : IN  std_logic_vector(14 downto 0);
         clk : IN  std_logic;
         en : IN  std_logic;
         rst : IN  std_logic;
         measure_en_out : OUT  std_logic;
         measure_load_out : OUT  std_logic;
         measure_reset_out : OUT  std_logic;
         trigger_pulse_out : OUT  std_logic;
         tristate_control_out : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal cycle_count_in : std_logic_vector(14 downto 0) := (others => '0');
   signal clk : std_logic := '0';
   signal en : std_logic := '1';
   signal rst : std_logic := '1';

 	--Outputs
   signal measure_en_out : std_logic;
   signal measure_load_out : std_logic;
   signal measure_reset_out : std_logic;
   signal trigger_pulse_out : std_logic;
   signal tristate_control_out : std_logic;

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Maquina_d_estados PORT MAP (
          cycle_count_in => cycle_count_in,
          clk => clk,
          en => en,
          rst => rst,
          measure_en_out => measure_en_out,
          measure_load_out => measure_load_out,
          measure_reset_out => measure_reset_out,
          trigger_pulse_out => trigger_pulse_out,
          tristate_control_out => tristate_control_out
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
			cycle_count_in <="000000000000000" ;
			
			wait for 100 ns;
		
		cycle_count_in <= "000000000000101" ;
		
		wait for 100 ns;
		
		cycle_count_in<= "000001011110011";
		
		wait for 100 ns;
		
		cycle_count_in <= "100101100110111";
		
		wait for 100 ns;
		
		cycle_count_in <= "000000000000000";

      wait for clk_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;
