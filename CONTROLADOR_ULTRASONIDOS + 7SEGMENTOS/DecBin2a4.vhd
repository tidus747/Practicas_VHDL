----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:36:47 10/07/2014 
-- Design Name: 
-- Module Name:    DecBin2a4 - Behavioral 
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

entity DecBin2a4 is
    Port ( A : in  STD_LOGIC_VECTOR (1 downto 0);
           D : out  STD_LOGIC_VECTOR (3 downto 0));
end DecBin2a4;

architecture Behavioral of DecBin2a4 is

begin
	
	process (A)
	begin
		
		case A is
			when "00" =>
				D <= "0001";
			when "01" =>
				D <= "0010";
			when "10" =>
				D <= "0100";
			when "11" =>
				D <= "1000";
			when others =>
				D <= "0000";
		end case;
	end process;
	

end Behavioral;

