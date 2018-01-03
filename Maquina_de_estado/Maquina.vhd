----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    23:21:24 11/21/2014 
-- Design Name: 
-- Module Name:    Maquina - Behavioral 
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


entity Maquina is
    Port ( x1 : in  STD_LOGIC;
           x2 : in  STD_LOGIC;
			  clk : in STD_LOGIC;
			  reset: in STD_LOGIC;
			  ce : in STD_LOGIC;
           y : out  STD_LOGIC_VECTOR (4 downto 0)
			  );
           
end Maquina;

architecture Behavioral of Maquina is

COMPONENT ffD_reset
	PORT(
		d : IN std_logic;
		clk : IN std_logic;
		ce : IN std_logic;
		reset : IN std_logic;          
		q : OUT std_logic
		);
	END COMPONENT;
	
signal d1 : std_logic ;
signal d0 : std_logic ;

signal y1 : std_logic ;
signal y2 : std_logic ;
signal y3 : std_logic ;
signal y4 : std_logic ;
signal y5 : std_logic ;

signal q0 : std_logic ;
signal q1: std_logic ;

begin

	Inst_ffD_reset_Q1: ffD_reset PORT MAP(
		d =>d1 ,
		clk => clk ,
		ce => ce,
		q => q1 ,
		reset => reset
	);

	Inst_ffD_reset_Q0: ffD_reset PORT MAP(
		d =>d0 ,
		clk => clk ,
		ce => ce,
		q => q0 ,
		reset => reset
	);
	
d0 <= (q0 AND (q1 XOR x1)) OR ((NOT x2) AND (x1 XNOR q1)) ;
d1 <= (q1 AND ((NOT x2) OR (NOT q0))) OR ((NOT x1) AND ((x2 AND q0) OR q1));

y1 <= (NOT q0) OR q1;
y2 <= q0 AND (NOT q1);
y3 <= q1 AND q0;
y4 <= q1 NOR q0;
y5 <= q1 XOR q0;

y(0) <= y5 ;
y(1) <= y4 ;
y(2) <= y3 ;
y(3) <= y2 ;
y(4) <= y1 ;


end Behavioral;

