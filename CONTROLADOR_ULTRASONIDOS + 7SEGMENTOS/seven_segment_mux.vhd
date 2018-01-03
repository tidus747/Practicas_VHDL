----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:58:10 10/07/2014 
-- Design Name: 
-- Module Name:    seven_segment_mux - Behavioral 
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

entity seven_segment_mux is
    Port ( dig_0 : in  STD_LOGIC_VECTOR (3 downto 0);
			  dig_1 : in  STD_LOGIC_VECTOR (3 downto 0);
			  dig_2 : in  STD_LOGIC_VECTOR (3 downto 0);
           clk : in  STD_LOGIC;
			  reset : in  STD_LOGIC;
           led : out  STD_LOGIC_VECTOR (6 downto 0);
           an : out  STD_LOGIC_VECTOR (3 downto 0));
end seven_segment_mux;

architecture Behavioral of seven_segment_mux is

	COMPONENT multiplexor
	PORT(
		in_0 : IN std_logic_vector(3 downto 0);
		in_1 : IN std_logic_vector(3 downto 0);
		in_2 : IN std_logic_vector(3 downto 0);
		in_3 : IN std_logic_vector(3 downto 0);
		sel : IN std_logic_vector(1 downto 0);          
		output : OUT std_logic_vector(3 downto 0)
		);
	END COMPONENT;
	
	COMPONENT DecBin2a4
	PORT(
		A : IN std_logic_vector(1 downto 0);          
		D : OUT std_logic_vector(3 downto 0)
		);
	END COMPONENT;
	
	COMPONENT decodificador
	PORT(
		bcd : IN std_logic_vector(3 downto 0);          
		led : OUT std_logic_vector(6 downto 0)
		);
	END COMPONENT;
	
	COMPONENT seq_generator
	PORT(
		clk : IN std_logic;
		reset : IN std_logic;          
		seq : OUT std_logic_vector(1 downto 0)
		);
	END COMPONENT;
	
	signal bcd : std_logic_vector(3 downto 0);
	signal sel : std_logic_vector(1 downto 0);
	signal decoder_out : std_logic_vector(3 downto 0);
	
	constant dig_3 : std_logic_vector(3 downto 0) := "0000";

begin

	Inst_DecBin2a4: DecBin2a4 PORT MAP(
		A => sel,
		D => decoder_out
	);
	
		Inst_decodificador: decodificador PORT MAP(
		bcd => bcd,
		led => led
	);

	Inst_multiplexor: multiplexor PORT MAP(
		in_0 => dig_0,
		in_1 => dig_1,
		in_2 => dig_2,
		in_3 => dig_3,
		sel => sel,
		output => bcd 
	);
	
		Inst_seq_generator: seq_generator PORT MAP(
		clk => clk,
		reset => reset,
		seq => sel 
	);
	
	an <= not decoder_out;
	
end Behavioral;

