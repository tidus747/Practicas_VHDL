----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    21:53:42 11/25/2014 
-- Design Name: 
-- Module Name:    eco_counter - Behavioral 
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
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity eco_counter is
    Port ( clk	 : in  STD_LOGIC;
           en : in  STD_LOGIC;
           rst : in  STD_LOGIC;
           cm_count : out  STD_LOGIC_VECTOR (3 downto 0);
           dm_count : out  STD_LOGIC_VECTOR (3 downto 0);
           m_count : out  STD_LOGIC_VECTOR (3 downto 0));
end eco_counter;

architecture Behavioral of eco_counter is

COMPONENT abs_counter
Generic(N_bits : integer;
		abs_const : integer
			);
PORT(
		clk : IN std_logic;
		rst : IN std_logic;
		en  : IN std_logic;
		t   : OUT std_logic;
		count : OUT std_logic_vector(N_bits-1 downto 0)
		);
END COMPONENT;


signal t_measure_count : std_logic;
signal t_cm_count : std_logic;
signal t_dm_count : std_logic;




signal measure_counter_en : std_logic;
signal en_cm : std_logic;
signal en_dm : std_logic;
signal en_m : std_logic;

begin


measure_counter_en <= en;




measure_counter: abs_counter --cuenta 60 pulsos que se corresponden con un cm
generic map(N_bits => 6,
				abs_const =>60
)
PORT MAP(
	clk =>clk,
	rst => rst,
	en => measure_counter_en,
	t => t_measure_count,
	count => open
	);

--metric units counters

en_cm <= t_measure_count ;

cm_counter: abs_counter  --cm
Generic Map(N_bits => 4,
				abs_const =>10
)
PORT MAP(
	clk =>clk,
	rst => rst,
	en => en_cm,
	t => t_cm_count,
	count => cm_count
);

en_dm <= en_cm and t_cm_count;
dm_counter: abs_counter --dm

Generic Map(N_bits => 4,
				abs_const =>10
)
PORT MAP(
	clk =>clk,
	rst => rst,
	en => en_dm,
	t => t_dm_count,
	count => dm_count
);		

en_m <= en_dm and t_dm_count;

m_counter: abs_counter --dm
Generic Map(N_bits => 4,
				abs_const =>10
)
PORT MAP(
	clk =>clk,
	rst => rst,
	en => en_m,
	t => open,
	count => m_count
);		
end Behavioral;

