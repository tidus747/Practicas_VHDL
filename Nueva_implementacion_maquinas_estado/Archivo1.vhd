----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:29:22 11/25/2014 
-- Design Name: 
-- Module Name:    Archivo1 - Behavioral 
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

entity Archivo1 is
	port(clk,rst : in std_logic;
	x : in std_logic_vector (1 downto 0);
	y : out std_logic_vector (4 downto 0)
	);
end Archivo1;

architecture Behavioral of Archivo1 is

type state_type is(st0_wait_measure, st1_trigger,st2_holdoff,st3_measure);

signal state,next_state: state_type;

begin

memoria: process (clk, rst)
begin
	if rst = '1' then
		state <= st0_wait_measure;
		--elsif clk' event and clk='1' then
	elsif rising_edge(clk) then
	state <= next_state;
	end if;
	
end process;

next_state_proc : process(x,state) --es un proceso combinacional que no depende del reloj
begin

next_state <= state ;

	case state is
		when st0_wait_measure => 
			if x= "00" then
				next_state <= st1_trigger;
				end if;
		when st1_trigger =>
			if x= "01" then
				next_state <= st2_holdoff;
				end if;
		when st2_holdoff => 
			if x="10" then
				next_state <= st3_measure;
				end if;
		when st3_measure =>
			if x="11" then
				next_state <= st0_wait_measure;
				end if;
		when others => 
			next_state <= st0_wait_measure;
		end case;
	

end process;

salida: process(state)
begin
	case state is
	
	when st0_wait_measure =>
		y <= "10010";
	when st1_trigger =>
		y <= "01001";
	when st2_holdoff =>
		y <= "10001";
	when st3_measure =>
		y <= "10100";
		
	when others => 
		y <= "00000";
		
	end case;

end process;

end Behavioral;

