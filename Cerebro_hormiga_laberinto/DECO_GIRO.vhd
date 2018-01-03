----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:20:41 12/08/2014 
-- Design Name: 
-- Module Name:    DECO_GIRO - Behavioral 
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
USE ieee.std_logic_unsigned.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity DECO_GIRO is
    Port ( motor_der : in  STD_LOGIC;
           motor_izq : in  STD_LOGIC;
           cont_der : out  STD_LOGIC_VECTOR (1 downto 0);
           cont_izq : out  STD_LOGIC_VECTOR (1 downto 0));
end DECO_GIRO;

architecture Behavioral of DECO_GIRO is

 signal sig_deco_case : std_logic_vector (1 downto 0);

begin

 sig_deco_case(0) <= motor_der;
 sig_deco_case(1) <= motor_izq;
 
 process (sig_deco_case)
 begin
 
  case (sig_deco_case) is
  
   when "00" =>
    cont_der <= "00";
    cont_izq <= "00";
    
   when "01" =>
    cont_der <= "01";
    cont_izq <= "10";
    
   when "10" =>
    cont_der <= "10";
    cont_izq <= "01";

   when "11" =>
    cont_der <= "01";
    cont_izq <= "01";
    
   when others =>
    cont_der <= "00";
    cont_izq <= "00";   
    
  end case;
 end process;
 
end Behavioral;