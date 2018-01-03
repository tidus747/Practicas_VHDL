----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:28:54 11/11/2014 
-- Design Name: 
-- Module Name:    Comparador_8bits - Behavioral 
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

entity Comparador_8bits is
    Port ( PuertoA : in  STD_LOGIC_VECTOR (7 downto 0);
           PuertoB : in  STD_LOGIC_VECTOR (7 downto 0);
			  reset : in STD_LOGIC;
			  en : in STD_LOGIC;
           pwm : out  STD_LOGIC);
end Comparador_8bits;

architecture Behavioral of Comparador_8bits is

begin

process(PuertoA,PuertoB,reset,en) 

begin 


if (reset='1' or en='0') then
	pwm <='0';
	end if;
if (reset='0' and en='1') then

if PuertoA>=PuertoB then pwm <= '0';
	else pwm <= '1' ;

end if ;
end if;

end process ;




end Behavioral;

