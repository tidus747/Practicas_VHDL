----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    19:18:38 11/11/2014 
-- Design Name: 
-- Module Name:    variador_de_frecuencia - Behavioral 
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

entity segundo is
port ( pulso : inout std_logic:='0';
       clk   : in std_logic);
        
end entity;

architecture divisor of segundo is
signal count : integer :=1;
begin
process(clk) begin
   if(clk'event and clk='1') then
      count <=count+1;
      if(count = 50000000/1) then --count = frec de reloj/frec deseada
         PULSO <= not PULSO;
         count <=1;
      end if;
  end if;
end process;

end architecture; 