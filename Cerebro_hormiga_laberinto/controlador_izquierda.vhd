----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    22:52:05 11/13/2014 
-- Design Name: 
-- Module Name:    Motor - Behavioral 
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

entity controlador_izquierda is
    Port ( reset : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           consigna_velocidad : in  STD_LOGIC_VECTOR (7 downto 0);
           giro_in : in  STD_LOGIC_VECTOR(1 downto 0);
           giro_adelante : out  STD_LOGIC;
           giro_atras : out  STD_LOGIC;
			  en : in STD_LOGIC;
           pwm : out  STD_LOGIC);
end controlador_izquierda;

architecture Behavioral of controlador_izquierda is


COMPONENT Comparador_8bits
	PORT(
		PuertoA : IN std_logic_vector(7 downto 0);
		PuertoB : IN std_logic_vector(7 downto 0);
		reset : IN std_logic;
		en : IN std_logic;          
		pwm : OUT std_logic
		);
	END COMPONENT;
	
COMPONENT preescalado_motor
	PORT(
		clk : IN std_logic;
		reset : IN std_logic;          
		reloj250 : OUT std_logic
		);
	END COMPONENT;
	
COMPONENT contador
	PORT(
		rst : IN std_logic;
		clk : IN std_logic;          
		q : OUT std_logic_vector(7 downto 0)
		);
	END COMPONENT;
	
signal reloj : std_logic;
signal puertoacable : std_logic_vector (7 downto 0);

begin

Inst_Comparador_8bits: Comparador_8bits PORT MAP(
		PuertoA => puertoacable ,
		PuertoB => consigna_velocidad,
		en => en,
		reset => reset,
		pwm => pwm
	);

Inst_preescalado_motor: preescalado_motor PORT MAP(
		clk => clk ,
		reset => reset ,
		reloj250 => reloj 
	);

	Inst_contador: contador PORT MAP(
		rst =>reset ,
		clk => reloj,
		q => puertoacable 
	);

giro_adelante <= giro_in(0) ;
giro_atras <= giro_in(1) ;



end Behavioral;