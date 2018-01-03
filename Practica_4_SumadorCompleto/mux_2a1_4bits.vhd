----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    09:31:46 10/21/2014 
-- Design Name: 
-- Module Name:    mux_2a1_4bits - Behavioral 
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

entity mux_2a1_4bits is
    Port ( d0 : in  STD_LOGIC_VECTOR (3 downto 0);
           d1 : in  STD_LOGIC_VECTOR (3 downto 0);
           sel : in  STD_LOGIC;
           z : out  STD_LOGIC_VECTOR (3 downto 0));
end mux_2a1_4bits;

architecture Behavioral of mux_2a1_4bits is

COMPONENT mux_2a1
	PORT(
		d0 : IN std_logic;
		d1 : IN std_logic;
		sel : IN std_logic;          
		z : OUT std_logic
		);
	END COMPONENT;

	

begin

Inst_mux_2a1_0: mux_2a1 PORT MAP(
		d0 => d0(0) ,
		d1 => d1(0),
		sel => sel ,
		z => z(0)
	);
	
Inst_mux_2a1_1: mux_2a1 PORT MAP(
		d0 => d0(1) ,
		d1 => d1(1) ,
		sel => sel,
		z => z(1) 
	);	
	
Inst_mux_2a1_2: mux_2a1 PORT MAP(
		d0 => d0(2) ,
		d1 => d1(2) ,
		sel => sel ,
		z => z(2) 
	);	
Inst_mux_2a1_0_3: mux_2a1 PORT MAP(
		d0 => d0(3) ,
		d1 => d1(3),
		sel => sel ,
		z => z(3)
	);	


end Behavioral;

