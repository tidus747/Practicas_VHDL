----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    22:35:49 11/26/2014 
-- Design Name: 
-- Module Name:    Ultra_ping - Behavioral 
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

entity Ultra_ping is
    Port ( rst : in  STD_LOGIC;
           en : in  STD_LOGIC;
           clk_50mhz : in  STD_LOGIC;
           sig_IO : inout  STD_LOGIC;
           cm_reg : out  STD_LOGIC_VECTOR (3 downto 0);
           dm_reg : out  STD_LOGIC_VECTOR (3 downto 0);
           m_reg : out  STD_LOGIC_VECTOR (3 downto 0)
		
			  );
end Ultra_ping;

architecture Behavioral of Ultra_ping is

COMPONENT cycle_counter
	PORT(
		rst : IN std_logic;
		en : IN std_logic;
		clk : IN std_logic;          
		count : OUT std_logic_vector(14 downto 0)
		);
	END COMPONENT;

	
COMPONENT Maquina_d_estados
	PORT(
		cycle_count_in : IN std_logic_vector(14 downto 0);
		clk : IN std_logic;
		en : IN std_logic;
		rst : IN std_logic;          
		measure_en_out : OUT std_logic;
		measure_load_out : OUT std_logic;
		measure_reset_out : OUT std_logic;
		trigger_pulse_out : OUT std_logic;
		tristate_control_out : OUT std_logic
		);
	END COMPONENT;
	
COMPONENT Bidirectional_buffer_controller
	PORT(
		dir : IN std_logic;
		sig_out : IN std_logic;    
		bi : INOUT std_logic;      
		sig_in : OUT std_logic
		);
	END COMPONENT;

COMPONENT eco_counter
	PORT(
		clk : IN std_logic;
		en : IN std_logic;
		rst : IN std_logic;          
		cm_count : OUT std_logic_vector(3 downto 0);
		dm_count : OUT std_logic_vector(3 downto 0);
		m_count : OUT std_logic_vector(3 downto 0)
		);
	END COMPONENT;
	
COMPONENT measure_registers
	PORT(
		load : IN std_logic;
		cm : IN std_logic_vector(3 downto 0);
		dm : IN std_logic_vector(3 downto 0);
		m : IN std_logic_vector(3 downto 0);
		clk : IN std_logic;          
		cm_reg : OUT std_logic_vector(3 downto 0);
		dm_reg : OUT std_logic_vector(3 downto 0);
		reset : IN std_logic;
		m_reg : OUT std_logic_vector(3 downto 0)
		);
	END COMPONENT;
	

	COMPONENT cont_preescalado
	PORT(
		clk : IN std_logic;
		reset : IN std_logic;
		en : IN std_logic;          
		reloj_1mhz : OUT std_logic
		);
	END COMPONENT;
	
signal cycle_count : std_logic_vector (14 downto 0);
signal tristate : std_logic ;
signal trigger : std_logic ;
signal eco_in : std_logic;
signal eco_en : std_logic;
signal eco_rst : std_logic;
signal load : std_logic;
signal cm_count: std_logic_vector(3 downto 0);
signal dm_count: std_logic_vector(3 downto 0);
signal m_count: std_logic_vector(3 downto 0);
signal reloj : std_logic;
signal puerta : std_logic;


begin



Inst_Maquina_d_estados: Maquina_d_estados PORT MAP(
		cycle_count_in => cycle_count ,
		clk => reloj ,
		en => en ,
		rst => rst ,
		measure_en_out => eco_en ,
		measure_load_out => load,
		measure_reset_out => eco_rst,
		trigger_pulse_out => tristate ,
		tristate_control_out => trigger
	);
	
Inst_Bidirectional_buffer_controller: Bidirectional_buffer_controller PORT MAP(
		dir => trigger ,
		sig_out => tristate ,
		sig_in => eco_in,
		bi => sig_IO
	);
	
Inst_eco_counter: eco_counter PORT MAP(
		clk => reloj,
		en => puerta ,
		rst => eco_rst ,
		cm_count => cm_count ,
		dm_count => dm_count,
		m_count => m_count
	);
	
	Inst_measure_registers: measure_registers PORT MAP(
		load => load ,
		cm => cm_count,
		dm => dm_count ,
		m => m_count ,
		clk => reloj ,
		cm_reg => cm_reg ,
		dm_reg => dm_reg,
		m_reg => m_reg,
		reset => rst
	);
	
		Inst_cont_preescalado: cont_preescalado PORT MAP(
		clk => clk_50mhz ,
		reset => rst ,
		reloj_1mhz => reloj ,
		en => en
	);
	
	Inst_cycle_counter: cycle_counter PORT MAP(
		rst => rst ,
		en => en ,
		clk => reloj,
		count => cycle_count
	);
	
puerta <= eco_in AND eco_en;

end Behavioral;

