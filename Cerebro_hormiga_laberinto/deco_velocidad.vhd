----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:57:10 12/08/2014 
-- Design Name: 
-- Module Name:    deco_velocidad - Behavioral 
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
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity deco_velocidad is

    Port ( 
			  consigna_vel_der : out STD_LOGIC_VECTOR (7 downto 0);
			  estado: in STD_LOGIC_VECTOR (3 downto 0);
			  consigna_vel_izq : out STD_LOGIC_VECTOR (7 downto 0);
			  m_in : in std_logic_vector (3 downto 0);
			  cm_in : in std_logic_vector (3 downto 0);
			  dm_in : in std_logic_vector (3 downto 0)
			  );
			  
end deco_velocidad;

architecture Behavioral of deco_velocidad is

constant sig_vmax : std_logic_vector (7 downto 0) := conv_std_logic_vector(255,8);
constant sig_lost : std_logic_vector (7 downto 0) := conv_std_logic_vector(120,8);
constant sig_vmed : std_logic_vector (7 downto 0) := conv_std_logic_vector(125,8);
constant sig_vmin : std_logic_vector (7 downto 0) := conv_std_logic_vector(50,8);
constant dist_min : std_logic_vector (11 downto 0) := conv_std_logic_vector(9, 12);
signal distancia : std_logic_vector (11 downto 0);

 
begin

	distancia(0) <= cm_in(0);
	distancia(1) <= cm_in(1);
	distancia(2) <= cm_in(2);
	distancia(3) <= cm_in(3);
	
	distancia(4) <= dm_in(0);
	distancia(5) <= dm_in(1);
	distancia(6) <= dm_in(2);
	distancia(7) <= dm_in(3);

	distancia(8) <= m_in(0);
	distancia(9) <= m_in(1);
	distancia(10) <= m_in(2);
	distancia(11) <= m_in(3);
	
	 process(estado, distancia)
	 
	 begin 
	 
	 if(estado="1111") then   -- Estado LOST --      
		consigna_vel_der <= sig_lost;
		consigna_vel_izq <= sig_lost;
		end if;
		
	 if(estado="1010") then   -- Estado A --
		consigna_vel_der <= sig_vmax;
		consigna_vel_izq <= sig_vmax;
		end if;
		
	if (estado="1011") then   -- Estado B --
		consigna_vel_der <= sig_vmin;
		consigna_vel_izq <= sig_vmed;
		
		elsif (estado="1011" and distancia <= dist_min) then   -- Estado B  Especial --
				consigna_vel_der <= sig_vmed;
				consigna_vel_izq <= sig_vmax;
	end if;
		
	if (estado="1100") then   -- Estado C --
		consigna_vel_der <= sig_vmed;
		consigna_vel_izq <= sig_vmin;
		
		elsif (estado="1100" and distancia <= dist_min) then -- Estado C Especial --
		consigna_vel_der <= sig_vmed;
		consigna_vel_izq <= sig_vmax;
	end if;

 end process;
 

end Behavioral;
