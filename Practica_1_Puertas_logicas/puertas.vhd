----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    18:27:54 10/11/2014 
-- Design Name: 
-- Module Name:    puertas - Behavioral 
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

entity puertas is
    Port ( a : in  STD_LOGIC;
           b : in  STD_LOGIC;
           f_inv : out  STD_LOGIC;
           f_and2 : out  STD_LOGIC;
           f_or2 : out  STD_LOGIC;
           f_nand2 : out  STD_LOGIC;
           f_nor2 : out  STD_LOGIC);
end puertas;

architecture Behavioral of puertas is

begin

	f_inv <= not a;
	f_and2 <= a and b;
	f_or2 <= a or b;
	f_nand2 <= a nand b;
	f_nor2 <= a nor b;


end Behavioral;

