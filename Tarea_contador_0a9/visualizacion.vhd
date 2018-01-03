----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    22:25:16 11/11/2014 
-- Design Name: 
-- Module Name:    visualizacion - Behavioral 
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

entity visualizacion is
    Port ( reset : in  STD_LOGIC;
           ce : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           led : out  STD_LOGIC_VECTOR (6 downto 0));
end visualizacion;

architecture Behavioral of visualizacion is

COMPONENT contador0_a_9
	PORT(
		reset : IN std_logic;
		ce : IN std_logic;
		clk : IN std_logic;          
		count : OUT std_logic_vector(3 downto 0)
		);
	END COMPONENT;
	
COMPONENT decodificador
	PORT(
		bcd : IN std_logic_vector(3 downto 0);          
		led : OUT std_logic_vector(6 downto 0)
		);
	END COMPONENT;
	
COMPONENT segundo
	PORT(
		clk : IN std_logic;       
		pulso : INOUT std_logic
		);
	END COMPONENT;
	
signal bcd1 : std_logic_vector(3 downto 0);
signal pulso1 : std_logic;

begin

Inst_contador0_a_9: contador0_a_9 PORT MAP(
		reset => reset ,
		ce => ce,
		clk => pulso1,
		count => bcd1
	);
	Inst_decodificador: decodificador PORT MAP(
		bcd => bcd1 ,
		led => led
	);
	
	Inst_segundo: segundo PORT MAP(
		pulso =>pulso1 ,
		clk => clk
	);
end Behavioral;

