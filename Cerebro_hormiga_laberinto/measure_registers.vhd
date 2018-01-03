----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    22:43:59 11/26/2014 
-- Design Name: 
-- Module Name:    measure_registers - Behavioral 
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

entity measure_registers is
    Port ( load : in  STD_LOGIC;
           cm : in  STD_LOGIC_VECTOR (3 downto 0);
           dm : in  STD_LOGIC_VECTOR (3 downto 0);
           m : in  STD_LOGIC_VECTOR (3 downto 0);
           clk : in  STD_LOGIC;
           cm_reg : out  STD_LOGIC_VECTOR (3 downto 0);
           dm_reg : out  STD_LOGIC_VECTOR (3 downto 0);
           m_reg : out  STD_LOGIC_VECTOR (3 downto 0);
			  reset : in STD_LOGIC
			  );
end measure_registers;

architecture Behavioral of measure_registers is

	COMPONENT ffD_reset
	PORT(
		d : IN std_logic_vector(3 downto 0);
		clk : IN std_logic;
		ce : IN std_logic;
		reset : IN std_logic;          
		q : OUT std_logic_vector(3 downto 0)
		);
	END COMPONENT;

begin


	Inst_ffD_resetcm: ffD_reset PORT MAP(
		d => cm,
		clk => clk ,
		ce => load,
		q => cm_reg ,
		reset => reset
	);
	Inst_ffD_resetdm: ffD_reset PORT MAP(
		d => dm ,
		clk => clk ,
		ce => load,
		q => dm_reg ,
		reset => reset
	);
	Inst_ffD_resetm: ffD_reset PORT MAP(
		d => m ,
		clk => clk,
		ce => load,
		q =>m_reg ,
		reset => reset 
	);


end Behavioral;

