----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    00:57:32 11/27/2014 
-- Design Name: 
-- Module Name:    meaures_registers - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity measures_registers is
    Port ( load : in  STD_LOGIC;
           register_cm_in : in  STD_LOGIC_VECTOR (3 downto 0);
           register_dm_in : in  STD_LOGIC_VECTOR (3 downto 0);
           register_m_in : in  STD_LOGIC_VECTOR (3 downto 0);
           rst : in  STD_LOGIC;
			  clk : in  STD_LOGIC;
           register_cm_out : out  STD_LOGIC_VECTOR (3 downto 0);
           register_dm_out : out  STD_LOGIC_VECTOR (3 downto 0);
           register_m_out : out  STD_LOGIC_VECTOR (3 downto 0));
end measures_registers;

architecture Behavioral of measures_registers is

	COMPONENT ffD_reset
	PORT(
		d : IN std_logic_vector(3 downto 0);
		clk : IN std_logic;
		reset : IN std_logic;
		ce : IN std_logic;          
		q : OUT std_logic_vector(3 downto 0)
		);
	END COMPONENT;

begin

	Inst_ffD_reset_0: ffD_reset PORT MAP(
		d => register_cm_in,
		clk => clk,
		reset => rst,
		ce => load,
		q => register_cm_out
	);

	Inst_ffD_reset_1: ffD_reset PORT MAP(
		d => register_dm_in,
		clk => clk,
		reset => rst,
		ce => load,
		q => register_dm_out
	);
	
	Inst_ffD_reset_2: ffD_reset PORT MAP(
		d => register_m_in,
		clk => clk,
		reset => rst,
		ce => load,
		q => register_m_out
	);
	
end Behavioral;

