----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    19:34:33 11/11/2014 
-- Design Name: 
-- Module Name:    contador0_a_9 - Behavioral 
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

entity contador0_a_9 is
    Port ( reset : in  STD_LOGIC;
           ce : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           count : out  STD_LOGIC_VECTOR (3 downto 0));
end contador0_a_9;

architecture Behavioral of contador0_a_9 is

COMPONENT ffD_reset
	PORT(
		d : IN std_logic;
		clk : IN std_logic;
		ce : IN std_logic;
		reset : IN std_logic;          
		q : OUT std_logic
		);
	END COMPONENT;
	
signal da : std_logic;
signal db : std_logic;
signal dc : std_logic;
signal dd : std_logic;
signal qa : std_logic;
signal qb : std_logic;
signal qc : std_logic;
signal qd : std_logic;

begin

Inst_ffD_resetA: ffD_reset PORT MAP(
		d => da,
		clk => clk ,
		ce => ce ,
		q => qa,
		reset => reset
	);
Inst_ffD_resetB: ffD_reset PORT MAP(
		d => db ,
		clk => clk,
		ce => ce,
		q => qb,
		reset => reset
	);
Inst_ffD_resetC: ffD_reset PORT MAP(
		d => dc ,
		clk => clk ,
		ce => ce ,
		q => qc,
		reset => reset
	);
Inst_ffD_resetD: ffD_reset PORT MAP(
		d => dd,
		clk => clk ,
		ce => ce,
		q => qd,
		reset => reset
	);

da <= (((qc and qd)and qb) or (((not qc)and(not qd))and qa));
db <= (qd and qc) xor qb ;
dc <= ((qc and (not qd)) or (((not qa) and (not qc)) and qd));
dd <= (not qd);

count(0) <= qd ;
count(1) <= qc ;
count(2) <= qb ;
count(3) <= qa ;

end Behavioral;

