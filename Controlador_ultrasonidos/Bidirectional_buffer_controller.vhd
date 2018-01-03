----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    21:47:02 11/26/2014 
-- Design Name: 
-- Module Name:    Bidirectional_buffer_controller - Behavioral 
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

entity Bidirectional_buffer_controller is
	port(dir : in std_logic;
			sig_out : in std_logic;
			sig_in : out std_logic;
			bi : inout std_logic
			);
end Bidirectional_buffer_controller;

architecture Behavioral of Bidirectional_buffer_controller is

begin

	bi <= sig_out when dir = '0' else 'Z'; --dir = '0' -> salida
	sig_in <= bi; --dir= '1' -> bi <= 'Z' -> entrada


end Behavioral;

