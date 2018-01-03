
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity seq_generator is
   port(
      clk, reset: in std_logic;
      seq: out std_logic_vector(1 downto 0)
   );
end seq_generator ;

architecture arch of seq_generator is
   -- each 7-seg led enabled (2^18/4)*25 ns (40 ms)
   constant N: integer:=18;
   signal q_reg, q_next: unsigned(N-1 downto 0);
	
begin
   -- register
   process(clk,reset)
   begin
      if reset='1' then
         q_reg <= (others=>'0');
      elsif (clk'event and clk='1') then
         q_reg <= q_next;
      end if;
   end process;

   -- next-state logic for the counter
   q_next <= q_reg + 1;

   -- 2 MSBs of counter to control 4-to-1 multiplexing
   seq <= std_logic_vector(q_reg(N-1 downto N-2));
   
end arch;