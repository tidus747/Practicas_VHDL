----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:00:17 10/21/2014 
-- Design Name: 
-- Module Name:    ca1_4bits - Behavioral 
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

entity ca1_4bits is
    Port ( din : in  STD_LOGIC_VECTOR (3 downto 0);
           dout : out  STD_LOGIC_VECTOR (3 downto 0);
           op_select : in  STD_LOGIC);
end ca1_4bits;

architecture Behavioral of ca1_4bits is

begin

dout(0) <= din(0) XOR op_select ;
dout(1) <= din(1) XOR op_select ; 
dout(2) <= din(2) XOR op_select ; 
dout(3) <= din(3) XOR op_select ;



end Behavioral;

