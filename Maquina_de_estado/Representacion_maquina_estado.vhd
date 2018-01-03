----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:01:14 11/22/2014 
-- Design Name: 
-- Module Name:    Representacion_maquina_estado - Behavioral 
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

entity Representacion_maquina_estado is
    Port ( reset : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           ce : in  STD_LOGIC;
           x1 : in  STD_LOGIC;
           x2 : in  STD_LOGIC;
           led : out  STD_LOGIC_VECTOR (6 downto 0);
           an : out  STD_LOGIC_VECTOR (3 downto 0));
end Representacion_maquina_estado;

architecture Behavioral of Representacion_maquina_estado is

COMPONENT Maquina
	PORT(
		x1 : IN std_logic;
		x2 : IN std_logic;
		clk : IN std_logic;
		reset : IN std_logic;
		ce : IN std_logic;          
		y : OUT std_logic_vector(4 downto 0)
		);
	END COMPONENT;
	
COMPONENT decodificador2a4
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
	
	COMPONENT Intercambiador
	PORT(
		y : IN std_logic_vector(4 downto 0);          
		digito0 : OUT std_logic_vector(3 downto 0);
		digito1 : OUT std_logic_vector(3 downto 0)
		);
	END COMPONENT;
	
	COMPONENT seq_generator
	PORT(
		clk : IN std_logic;
		reset : IN std_logic;          
		seq : OUT std_logic_vector(1 downto 0)
		);
	END COMPONENT;

signal ycable : std_logic_vector (4 downto 0);
signal dig_0 : std_logic_vector (3 downto 0);
signal dig_1 : std_logic_vector (3 downto 0);
signal bcdcable : std_logic_vector (3 downto 0);
signal selcable : std_logic_vector (1 downto 0);
signal dcable : std_logic_vector (3 downto 0);

constant dig_2 : std_logic_vector (3 downto 0) := "0000" ;
constant dig_3 : std_logic_vector (3 downto 0) := "0000" ;

begin

Inst_Maquina: Maquina PORT MAP(
		x1 => x1 ,
		x2 => x2,
		clk => clk ,
		reset => reset ,
		ce => ce ,
		y => ycable
	);
	

	Inst_decodificador2a4: decodificador2a4 PORT MAP(
		A => selcable ,
		D => dcable
	);

	Inst_decodificador: decodificador PORT MAP(
		bcd => bcdcable ,
		led => led
	);

	Inst_multiplexor: multiplexor PORT MAP(
		in_0 => dig_0 ,
		in_1 => dig_1,
		in_2 => dig_2 ,
		in_3 => dig_3,
		sel => selcable,
		output => bcdcable
	);
	
		Inst_seq_generator: seq_generator PORT MAP(
		clk => clk,
		reset => reset ,
		seq => selcable
	);
	
	Inst_Intercambiador: Intercambiador PORT MAP(
		y => ycable ,
		digito0 => dig_0 ,
		digito1 => dig_1
	);

an <= NOT dcable;


end Behavioral;
