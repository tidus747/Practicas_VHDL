----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:41:04 12/02/2014 
-- Design Name: 
-- Module Name:    Cerebro - Behavioral 
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

entity Cerebro is
    Port ( antenas : in  STD_LOGIC_VECTOR(1 downto 0);
           derecha : out  STD_LOGIC;
           izquierda : out  STD_LOGIC;
			  en : in STD_LOGIC;
			  rst : in STD_LOGIC;
			  clk : in STD_LOGIC);
end Cerebro;

architecture Behavioral of Cerebro is

type state_type is(sta, stb,stc,std);

signal state,next_state: state_type;

begin

memoria: process (clk, rst)
begin
	if rst = '1' then
		state <= sta;
		--elsif clk' event and clk='1' then
	elsif rising_edge(clk) then
	
	if en= '1' then
			state <= next_state;
			end if;
		end if;
	
end process;

next_state_proc : process(antenas,state) --es un proceso combinacional que no depende del reloj
begin

next_state <= state ;

	case state is
		when sta => 
			if antenas= "01" then
				next_state <= stb;
				end if;
			if antenas= "10" then
				next_state <= std;
				end if;
			if antenas = "11" then
				next_state <= stc;
				end if;
		when stb =>
			if antenas = "00" then
				next_state <= sta;
				end if;
			if antenas = "11" then
				next_state <= stc ;
				end if;
		when stc => 
			if antenas ="01" then
				next_state <= stb;
				end if;
		when std =>
			if antenas = "00" then
				next_state <= sta;
				end if;
		when others => 
			next_state <= sta;
		end case;
	

end process;

salida: process(state)
begin
	case state is
	
	when sta =>  
	
		derecha <= '1'; 
		izquierda <= '1';
	
	when stb =>  
	
	   derecha <= '1';
		izquierda <= '0';
		
	
	when stc => 
		
		  derecha <= '1';
		izquierda <= '0';
		
	when std =>
	
		derecha <= '0';
		izquierda <= '1';
		
	when others => 
	
				derecha <= '1'; 
		izquierda <= '1';
	

		
	end case;

end process;

end Behavioral;


