----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    22:14:53 11/26/2014 
-- Design Name: 
-- Module Name:    Contador_19455 - Behavioral 
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

entity cycle_counter is
    Port ( rst : in  STD_LOGIC;
           en : in  STD_LOGIC;
           clk: in  STD_LOGIC;
           count : out  STD_LOGIC_VECTOR (14 downto 0));
end cycle_counter;

architecture Behavioral of cycle_counter is

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

begin

cycle_counter: abs_counter --cuenta 60 pulsos que se corresponden con un cm
generic map(N_bits => 15,
				abs_const =>19455
)
PORT MAP(
	clk =>clk,
	rst => rst,
	en => en,
	t => open,
	count => count
	);

end Behavioral;