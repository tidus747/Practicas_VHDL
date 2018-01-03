----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    09:15:25 10/21/2014 
-- Design Name: 
-- Module Name:    mux_2a1 - Behavioral 
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

entity mux_2a1 is
    Port ( d0 : in  STD_LOGIC;
           d1 : in  STD_LOGIC;
           sel : in  STD_LOGIC;
           z : out  STD_LOGIC);
end mux_2a1;

architecture Behavioral of mux_2a1 is

begin

with sel select 	
	z <= d0 when '0',
			d1 when others;


end Behavioral;

