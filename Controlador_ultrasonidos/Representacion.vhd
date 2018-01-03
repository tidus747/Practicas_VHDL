----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    01:39:07 11/27/2014 
-- Design Name: 
-- Module Name:    Representacion - Behavioral 
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

entity Representacion is
    Port ( en : in std_logic;
				rst: in std_logic;
				sig_io : inout std_logic;
           clk : in  STD_LOGIC;
           an : out  STD_LOGIC_VECTOR (3 downto 0);
           led : out  STD_LOGIC_VECTOR (6 downto 0));
end Representacion;

architecture Behavioral of Representacion is

	COMPONENT Ultra_ping
	PORT(
		rst : IN std_logic;
		en : IN std_logic;
		clk_50mhz : IN std_logic;    
		sig_IO : INOUT std_logic;      
		cm_reg : OUT std_logic_vector(3 downto 0);
		dm_reg : OUT std_logic_vector(3 downto 0);
		m_reg : OUT std_logic_vector(3 downto 0)
		);
	END COMPONENT;
	
	COMPONENT seven_segment_mux 
    Port ( dig_0 : in  STD_LOGIC_VECTOR (3 downto 0);
				dig_1 : in STD_LOGIC_VECTOR (3 downto 0);
				dig_2 : in STD_LOGIC_VECTOR (3 downto 0);
				dig_3 : in STD_LOGIC_VECTOR (3 downto 0);
           clk : in  STD_LOGIC;
           led : out  STD_LOGIC_VECTOR (6 downto 0);
           an : out  STD_LOGIC_VECTOR (3 downto 0));
	END COMPONENT;
	
	signal cablem : std_logic_vector (3 downto 0);
	signal cabledm : std_logic_vector (3 downto 0);
	signal cablecm : std_logic_vector (3 downto 0);

begin


	Inst_Ultra_ping: Ultra_ping PORT MAP(
		rst => rst,
		en => en,
		clk_50mhz => clk ,
		sig_IO => sig_io,
		cm_reg => cablecm ,
		dm_reg => cabledm ,
		m_reg => cablem
	);
	
	Inst_seven_segment_mux: seven_segment_mux PORT MAP(
				dig_0 => cablecm,
				dig_1 =>cabledm ,
				dig_2 =>cablem,
				dig_3 => "0000",
           clk => clk,
           led => led,
           an => an
			  );

end Behavioral;

