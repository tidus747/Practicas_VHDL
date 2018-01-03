----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    01:26:05 11/27/2014 
-- Design Name: 
-- Module Name:    top_bi_dir - Behavioral 
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

entity top_bi_dir is
    Port ( dir : in  STD_LOGIC;
           sig_out : in  STD_LOGIC;
           sig_in : out  STD_LOGIC;
           bi : inout  STD_LOGIC);
end top_bi_dir;

architecture Behavioral of top_bi_dir is

begin

	bi <= sig_out when dir = '0' else 'Z';
	sig_in <= bi;

end Behavioral;

