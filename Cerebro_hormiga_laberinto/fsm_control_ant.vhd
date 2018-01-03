
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;

entity fsm_control_ant is
	port( clk : in std_logic;
			rst : in std_logic;
			en : in std_logic;
			antenas : in std_logic_vector (1 downto 0);
			ident: out std_logic_vector (3 downto 0);
			salida_der : out std_logic;
			salida_izq : out std_logic		
	);
end fsm_control_ant;

architecture Behavioral of fsm_control_ant is

type state_type is (st_l, st_a, st_b, st_c); -- definimos los 4 estados

	signal state, next_state : state_type; -- variable tipo type

begin

memoria : process(clk, rst, en)                      --implementamos la memoria, tenemos que añadir el reset a la lista de sensibilidad, es secuencial
begin

		if rst = '1' then
			state <= st_l;   --si reset on, volvemos al estado 1
		-- elsif clk'event and clk = '1' then o bien escribimos
			elsif (rising_edge(clk)) then
				if (en='1') then
				state <= next_state;
				end if;
		end if;

end process;

next_state_proc : process(antenas, state) --como es combinacional tienen q aparecer todas las entradas del sistema
begin

	next_state <= state;  -- se le asigna al valor siguiente el valor del estado actual, para poder entrar al case
	
	case state is
		when st_l =>
			if antenas = "01" then
				next_state <= st_a;
				end if;
			if antenas = "10" then
				next_state <= st_a;
				end if;
			if antenas = "11" then
				next_state <= st_a;
				end if;
		when st_a =>
			if antenas = "00" then
				next_state <= st_b;
				end if;
			
		when st_b =>
			if antenas = "01" then
				next_state <= st_c;
				end if;
			if antenas = "11" then
				next_state <= st_a;
				end if;
		when st_c =>
			if antenas = "00" then
				next_state <= st_b;
				end if;
			if antenas = "11" then
				next_state <= st_a;
				end if;
		when others =>
			next_state <= st_l;
	end case;
	
end process;

	salida:process(state)
	--la salida tambien es combinacional no depende de clk sólo (x, state) como es de moore solo state, no depende de las entradas
	begin
	
	case state is
	
		when st_l =>
		
			salida_izq <= '1';
			salida_der <= '1';
			ident <= "1111"; -- Representacion de la L
			
		when st_a =>
		
			salida_izq <= '0';
			salida_der <= '1';
			ident <= "1010"; -- letra A
			
		when st_b =>
			
			salida_izq <= '1';
			salida_der <= '1';
			ident <= "1011"; --Representacion de la B
			
		when st_c =>
			
			salida_izq <= '1';
			salida_der <= '1';
			ident <= "1100"; -- Representacion de la C
			
		when others =>

			salida_izq <= '1';
			salida_der <= '1';
			ident <= "1111"; -- Representacion de la L
			
	end case;
end process;
	
end Behavioral;

