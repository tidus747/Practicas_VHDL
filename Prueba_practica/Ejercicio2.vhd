----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    09:32:40 10/14/2014 
-- Design Name: 
-- Module Name:    Ejercicio2 - Behavioral 
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

entity Ejercicio2 is
    Port ( a : in  STD_LOGIC_VECTOR (2 downto 0);
           b : in  STD_LOGIC_VECTOR (2 downto 0);
           cin : in  STD_LOGIC;
           s1 : out  STD_LOGIC_VECTOR (2 downto 0);
           overflow : out  STD_LOGIC);
end Ejercicio2;

architecture Behavioral of Ejercicio2 is

COMPONENT Ejercicio1
	PORT(
		a : IN std_logic;
		b : IN std_logic;
		cin : IN std_logic;          
		cout : OUT std_logic;
		s : OUT std_logic
		);
	END COMPONENT;
	


signal int0 : std_logic ;
signal int1 : std_logic ;
signal int2 : std_logic ;

begin

Inst_Ejercicio1: Ejercicio1 PORT MAP(
		a => a(0)  ,
		b => b(0) ,
		cin => cin,
		cout => int0 ,
		s => s1(0)
	); 
	
Inst_Ejercicio1_2: Ejercicio1 PORT MAP(
		a => a(1),
		b => b(1) ,
		cin => int0 ,
		cout => int1 ,
		s => s1(1)
	);

Inst_Ejercicio1_3: Ejercicio1 PORT MAP(
		a => a(2) ,
		b => b(2) ,
		cin => int1 ,
		cout => int2 ,
		s => s1(2)
	);

overflow <= (int2 XOR int1);


end Behavioral;

