----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:41:36 11/04/2014 
-- Design Name: 
-- Module Name:    contador - Behavioral 
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
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity contador is

    Port ( rst : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           q : out  STD_LOGIC_VECTOR (7 downto 0));
			  
end contador;

architecture Behavioral of contador is

begin

process (clk,rst) 

variable cuenta : std_logic_vector (7 downto 0);

begin

-- Asincrono
if rst ='1' then
	cuenta := (others => '0');
	
-- Sincrono
	
elsif (clk'event and clk = '1' ) then 
	cuenta := cuenta +1 ;
end if ;
	q <= cuenta ;
	
end process;





end Behavioral;

