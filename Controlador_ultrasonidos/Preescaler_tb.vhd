--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   13:15:35 11/27/2014
-- Design Name:   
-- Module Name:   C:/Users/Ivan/Desktop/Practicas digital  Repeticion/Realizacion/Controlador_ultrasonidos/Preescaler_tb.vhd
-- Project Name:  Controlador_ultrasonidos
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: cont_preescalado
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
 
ENTITY Preescaler_tb IS
END Preescaler_tb;
 
ARCHITECTURE behavior OF Preescaler_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT cont_preescalado
    PORT(
         clk : IN  std_logic;
         reset : IN  std_logic;
         reloj_1mhz : OUT  std_logic;
         en : IN  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal reset : std_logic := '1';
   signal en : std_logic := '0';

 	--Outputs
   signal reloj_1mhz : std_logic;

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: cont_preescalado PORT MAP (
          clk => clk,
          reset => reset,
          reloj_1mhz => reloj_1mhz,
          en => en
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
		
		reset <= '0';
      wait for 100 ns;	
		en <= '1';

      wait for clk_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;
