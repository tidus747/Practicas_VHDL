library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ffD_reset is
    Port ( d : in  STD_LOGIC_VECTOR(3 downto 0);
           clk : in  STD_LOGIC;
           reset : in  STD_LOGIC;
           ce : in  STD_LOGIC;
           q : out  STD_LOGIC_VECTOR(3 downto 0));
end ffD_reset;

architecture Behavioral of ffD_reset is

begin

	process(clk, reset)
	begin
		if reset='1' then
			q <= (others=>'0');
		elsif (clk'event and clk='1') then
			if ce='1' then
				q <= d;
			end if;
		end if;
	end process;
	
end Behavioral;

