----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    19:10:36 10/11/2014 
-- Design Name: 
-- Module Name:    decodificador - Behavioral 
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

entity decodificador is
    Port ( bcd : in  STD_LOGIC_VECTOR (3 downto 0);
           led : out  STD_LOGIC_VECTOR (6 downto 0);
			  diodo : out STD_LOGIC
			  );
			  
			  end decodificador;

architecture Behavioral of decodificador is



begin

with bcd select 
	led <= "1000000" when "0000" , --0
			"1111001" when "0001" , --1
			"0100100" when "0010" , --2
			"0110000" when "0011" , --3
			"0011001" when "0100" , --4
			"0010010" when "0101" , --5
			"0000010" when "0110" , --6
			"1111000" when "0111" , --7
			"1111001" when "0001" , -- -1
			"0100100" when "0010" , -- -2
			"0110000" when "0011" , -- -3
			"0011001" when "0100" , -- -4
			"0010010" when "0101" , -- -5
			"0000010" when "0110" , -- -6
			"1111000" when "0111" , -- -7
			"0000000" when "1000" , -- -8
			"1111111" when others ; -- Sentencias imposibles
			
with bcd(3) select
	diodo <= '1' when '1' ,
	   '0' when others ;
	



end Behavioral;

