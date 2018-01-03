----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    09:26:11 10/28/2014 
-- Design Name: 
-- Module Name:    Visualizacion - Behavioral 
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

entity Visualizacion is
    Port ( x : in  STD_LOGIC_VECTOR (3 downto 0);
           y : in  STD_LOGIC_VECTOR (3 downto 0);
           control1 : in  STD_LOGIC;
           control2 : in  STD_LOGIC;
           op_select : in  STD_LOGIC;
           overflow : out  STD_LOGIC;
           led : out  STD_LOGIC_VECTOR (6 downto 0);
           an : out  STD_LOGIC_VECTOR (3 downto 0);
           clk : in  STD_LOGIC;
			  diodo : out STD_LOGIC
			  );
end Visualizacion;

architecture Behavioral of Visualizacion is

COMPONENT sumador_completo
	PORT(
		x : IN std_logic_vector(3 downto 0);
		y : IN std_logic_vector(3 downto 0);
		control1 : IN std_logic;
		control2 : IN std_logic;
		op_select : IN std_logic;          
		overflow : OUT std_logic;
		salida : OUT std_logic_vector(3 downto 0)
		);
	END COMPONENT;
	
COMPONENT seven_segment_mux
	PORT(
		dig_0 : IN std_logic_vector(3 downto 0);
		clk : IN std_logic;          
		led : OUT std_logic_vector(6 downto 0);
		an : OUT std_logic_vector(3 downto 0)
		diodo : OUT std_logic ;
		);
	END COMPONENT;
	
signal salida: std_logic_vector (3 downto 0);

begin

	Inst_sumador_completo: sumador_completo PORT MAP(
		x => x ,
		y => y ,
		control1 => control1 ,
		control2 => control2 ,
		op_select => op_select ,
		overflow => overflow,
		salida => salida 
	);

Inst_seven_segment_mux: seven_segment_mux PORT MAP(
		dig_0 => salida ,
		clk => clk ,
		led => led ,
		an => an ,
		diodo => diodo
	);



end Behavioral;

