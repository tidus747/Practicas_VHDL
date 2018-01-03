----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    09:45:32 10/07/2014 
-- Design Name: 
-- Module Name:    multiplexor - Behavioral 
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

entity multiplexor is
    Port ( in_0 : in  STD_LOGIC_VECTOR (3 downto 0);
           in_1 : in  STD_LOGIC_VECTOR (3 downto 0);
           in_2 : in  STD_LOGIC_VECTOR (3 downto 0);
           in_3 : in  STD_LOGIC_VECTOR (3 downto 0);
           sel : in  STD_LOGIC_VECTOR (1 downto 0);
           output : out  STD_LOGIC_VECTOR (3 downto 0));
end multiplexor;

architecture Behavioral of multiplexor is

begin

with sel select
	output <= in_0 when "00",
				in_1 when "01",
				in_2 when "10",
				in_3 when others;
				

end Behavioral;

