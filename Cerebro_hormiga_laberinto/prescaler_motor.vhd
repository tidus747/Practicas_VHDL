library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity preescalado_motor is
port (clk : in std_logic; -- Reloj de la tarjeta 50MHz
  reset : in std_logic;
  reloj250 : out std_logic); --Salida: reloj que usará el contador PWM(250KHz)
end preescalado_motor;

architecture Behavioral of preescalado_motor is

 constant preescal : std_logic_vector(6 downto 0):= CONV_STD_LOGIC_VECTOR(100, 7);
 
 signal clk_out_aux : std_logic:= '0';

 begin
  output: process(clk,reset)
     variable cuenta : std_logic_vector(6 downto 0):="0000000";
   begin
   if (reset='1') then -- Reset asíncrono
    cuenta:=(others=>'0'); -- Inicializar contador
   elsif (clk'event and clk='1') then -- Flanco de subida en reloj
     cuenta:=(cuenta+1); -- Incrementar contador
    if (cuenta=preescal) then -- usamos la mitad del periodo
     clk_out_aux <= not clk_out_aux;
     cuenta:=(others=>'0'); -- Inicializar contador
    end if;
   end if;
   end process;
   
  reloj250 <= clk_out_aux;
 end Behavioral;

