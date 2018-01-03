----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:44:23 10/21/2014 
-- Design Name: 
-- Module Name:    sumador_completo - Behavioral 
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

entity sumador_completo is
    Port ( x : in  STD_LOGIC_VECTOR (3 downto 0);
           y : in  STD_LOGIC_VECTOR (3 downto 0);
           control1 : in  STD_LOGIC;
           control2 : in  STD_LOGIC;
           op_select : in  STD_LOGIC;
           overflow : out  STD_LOGIC;
           salida : out  STD_LOGIC_VECTOR (3 downto 0));
end sumador_completo;

architecture Behavioral of sumador_completo is

COMPONENT mux_2a1_4bits
	PORT(
		d0 : IN std_logic_vector(3 downto 0);
		d1 : IN std_logic_vector(3 downto 0);
		sel : IN std_logic;          
		z : OUT std_logic_vector(3 downto 0)
		);
	END COMPONENT;
	
COMPONENT Ejercicio2
	PORT(
		a : IN std_logic_vector(3 downto 0);
		b : IN std_logic_vector(3 downto 0);
		cin : IN std_logic;          
		s1 : OUT std_logic_vector(3 downto 0);
		overflow : OUT std_logic
		);
	END COMPONENT;
	
COMPONENT ca1_4bits
	PORT(
		din : IN std_logic_vector(3 downto 0);
		op_select : IN std_logic;          
		dout : OUT std_logic_vector(3 downto 0)
		);
	END COMPONENT;
	
signal int0 : std_logic_vector(3 downto 0 );
signal int1 : std_logic_vector(3 downto 0 );
signal int2 : std_logic_vector(3 downto 0 );          

begin

	Inst_mux_2a1_4bits_1: mux_2a1_4bits PORT MAP(
		d0 => x ,
		d1 => y ,
		sel => control2 ,
		z => int1 
	);
	
		Inst_mux_2a1_4bits_2: mux_2a1_4bits PORT MAP(
		d0 => x,
		d1 => y ,
		sel => control1 ,
		z => int0
	);
 
 Inst_ca1_4bits: ca1_4bits PORT MAP(
		din => int1 ,
		dout => int2 ,
		op_select => op_select
	);
	
	Inst_Ejercicio2: Ejercicio2 PORT MAP(
		a => int0 ,
		b => int2,
		cin => op_select,
		s1 => salida,
		overflow => overflow 
	);


end Behavioral;

