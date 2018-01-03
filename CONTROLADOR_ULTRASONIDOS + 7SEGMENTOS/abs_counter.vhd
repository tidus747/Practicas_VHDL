----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    21:27:40 11/26/2014 
-- Design Name: 
-- Module Name:    abs_counter - Behavioral 
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
use IEEE.STD_LOGIC_ARITH.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity abs_counter is
	generic(N_bits : integer;
			abs_const : integer
		);
		Port ( clk : in STD_LOGIC;
				 rst : in STD_LOGIC;
				 en : in STD_LOGIC;
				 t : out STD_LOGIC;
				 count : out STD_LOGIC_VECTOR (N_bits-1 downto 0)
				 );
end abs_counter;

architecture Behavioral of abs_counter is

	signal q : std_logic_vector(N_bits-1 downto 0) := (others => '0');
	constant abs_constant : std_logic_vector(N_bits-1 downto 0) := conv_std_logic_vector(abs_const-1, N_bits);
	
begin

	process(clk, rst)
	begin
		if rst = '1' then
			q <= (others => '0');
		elsif rising_edge(clk) then
			if en = '1' then
				if q = abs_constant then
					q <= (others => '0');
				else
					q <= q + '1';
				end if;
			end if;
		end if;
	end process;
	
	process(en, q)
	begin
		if q = abs_constant and en = '1' then
			t <= '1';
		else
			t <= '0';
		end if;
	end process;
	
	count <= q;
	
end Behavioral;

