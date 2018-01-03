----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    09:17:16 09/30/2014 
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
           led : out  STD_LOGIC_VECTOR (6 downto 0));
end decodificador;

architecture Behavioral of decodificador is

begin
		process (bcd)
		begin
		
			case bcd is
				when "0000" =>
					led <= "1000000";
				when "0001" =>
					led <= "1111001";
				when "0010" =>
					led <= "0100100";
				when "0011" =>
					led <= "0110000";
				when "0100" =>
					led <= "0011001";
				when "0101" =>
					led <= "0010010";
				when "0110" =>
					led <= "0000010";
				when "0111" =>
					led <= "1111000";
				when "1000" =>
					led <= "0000000";
				when "1001" =>
					led <= "0010000";
				when others =>
					led <= "0000110";
			
			end case;
			end process;
			
end Behavioral;

