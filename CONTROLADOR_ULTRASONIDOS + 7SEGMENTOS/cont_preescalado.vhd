library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity cont_preescalado is
port (clk : in std_logic; -- Reloj de la tarjeta 50MHz
		en : in std_logic;
		reset : in std_logic;
		reloj_1mhz : out std_logic); --Salida: reloj que usar� el contador PWM(250KHz)
end cont_preescalado;

architecture Behavioral of cont_preescalado is

	constant preescal : std_logic_vector(4 downto 0):= CONV_STD_LOGIC_VECTOR(25, 5);
	
	signal clk_out_aux : std_logic:= '0';

	begin
		output: process(clk,reset,en)
					variable cuenta : std_logic_vector(4 downto 0):="00000";
			begin
			if (reset='1') then -- Reset as�ncrono
				cuenta:=(others=>'0'); -- Inicializar contador
			elsif (clk'event and clk='1' and en='1') then -- Flanco de subida en reloj
					cuenta:=(cuenta+1); -- Incrementar contador
				if (cuenta=preescal) then -- usamos la mitad del periodo
					clk_out_aux <= not clk_out_aux;
					cuenta:=(others=>'0'); -- Inicializar contador
				end if;
			end if;
			end process;
			
		reloj_1mhz <= clk_out_aux;
	end Behavioral;

