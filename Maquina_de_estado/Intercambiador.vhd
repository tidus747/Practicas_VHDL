----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    22:36:12 11/22/2014 
-- Design Name: 
-- Module Name:    Intercambiador - Behavioral 
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

entity Intercambiador is
    Port ( y : in  STD_LOGIC_VECTOR (4 downto 0);
           digito0 : out  STD_LOGIC_VECTOR (3 downto 0);
           digito1 : out  STD_LOGIC_VECTOR (3 downto 0));
end Intercambiador;

architecture Behavioral of Intercambiador is

begin

process (y) 

begin

	case y is
	when "10010" =>
	digito0 <= "1000";
	digito1 <= "0001";
	when "01001" => 
	digito0 <= "1001";
	digito1 <= "0000";
	when "10001" =>
	digito0 <= "0111";
	digito1 <= "0001";
	when "10100" => 
	digito0 <= "0000";
	digito1 <= "0010";
	when others =>
	digito0 <= "0000";
	digito1 <= "0000";
	
	end case;
	
end process;


end Behavioral;

