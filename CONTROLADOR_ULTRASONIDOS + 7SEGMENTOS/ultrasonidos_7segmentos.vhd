----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    02:50:09 11/27/2014 
-- Design Name: 
-- Module Name:    ultrasonidos_7segmentos - Behavioral 
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

entity ultrasonidos_7segmentos is
    Port ( clk : in  STD_LOGIC;
           en : in  STD_LOGIC;
           rst : in  STD_LOGIC;
           sig_inout : inout  STD_LOGIC;
           an : out  STD_LOGIC_VECTOR (3 downto 0);
           led : out  STD_LOGIC_VECTOR (6 downto 0));
end ultrasonidos_7segmentos;

architecture Behavioral of ultrasonidos_7segmentos is

	COMPONENT control_ultrasonidos
	PORT(
		rst : IN std_logic;
		clk : IN std_logic;
		en : IN std_logic;    
		sig_inout : INOUT std_logic;      
		cm_reg : OUT std_logic_vector(3 downto 0);
		dm_reg : OUT std_logic_vector(3 downto 0);
		m_reg : OUT std_logic_vector(3 downto 0)
		);
	END COMPONENT;
	
	COMPONENT seven_segment_mux
	PORT(
		dig_0 : IN std_logic_vector(3 downto 0);
		dig_1 : IN std_logic_vector(3 downto 0);
		dig_2 : IN std_logic_vector(3 downto 0);
		clk : IN std_logic;
		reset : IN std_logic;          
		led : OUT std_logic_vector(6 downto 0);
		an : OUT std_logic_vector(3 downto 0)
		);
	END COMPONENT;
	
	signal medida_cm : std_logic_vector(3 downto 0);
	signal medida_dm : std_logic_vector(3 downto 0);
	signal medida_m : std_logic_vector(3 downto 0);
	
begin

	Inst_control_ultrasonidos: control_ultrasonidos PORT MAP(
		rst => rst,
		clk => clk,
		en => en,
		sig_inout => sig_inout,
		cm_reg => medida_cm,
		dm_reg => medida_dm,
		m_reg => medida_m 
	);

	Inst_seven_segment_mux: seven_segment_mux PORT MAP(
		dig_0 => medida_cm,
		dig_1 => medida_dm,
		dig_2 => medida_m,
		clk => clk,
		reset => rst,
		led => led,
		an => an
	);
	
end Behavioral;

