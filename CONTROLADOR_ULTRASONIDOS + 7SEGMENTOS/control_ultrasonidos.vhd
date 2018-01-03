----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    01:53:15 11/27/2014 
-- Design Name: 
-- Module Name:    control_ultrasonidos - Behavioral 
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

entity control_ultrasonidos is
    Port ( rst : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           en : in  STD_LOGIC;
           sig_inout : inout  STD_LOGIC;
           cm_reg : out  STD_LOGIC_VECTOR (3 downto 0);
           dm_reg : out  STD_LOGIC_VECTOR (3 downto 0);
           m_reg : out  STD_LOGIC_VECTOR (3 downto 0));
end control_ultrasonidos;

architecture Behavioral of control_ultrasonidos is

	COMPONENT cont_preescalado
	PORT(
		clk : IN std_logic;
		reset : IN std_logic;
		en : IN std_logic;
		reloj_1mhz : OUT std_logic
		);
	END COMPONENT;
	
	COMPONENT cycle_counter_19455
	PORT(
		clk : IN std_logic;
		rst : IN std_logic;
		en : IN std_logic;          
		t : OUT std_logic;
		count : OUT std_logic_vector(14 downto 0)
		);
	END COMPONENT;

	COMPONENT fsm_control
	PORT(
		clk : IN std_logic;
		rst : IN std_logic;
		en : IN std_logic;
		cycle_count_in : IN std_logic_vector(14 downto 0);          
		measure_en_out : OUT std_logic;
		measure_load_out : OUT std_logic;
		measure_reset_out : OUT std_logic;
		trigger_pulse_out : OUT std_logic;
		tristate_control_out : OUT std_logic
		);
	END COMPONENT;

	COMPONENT top_bi_dir
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
	
	COMPONENT measures_registers
	PORT(
		load : IN std_logic;
		register_cm_in : IN std_logic_vector(3 downto 0);
		register_dm_in : IN std_logic_vector(3 downto 0);
		register_m_in : IN std_logic_vector(3 downto 0);
		rst : IN std_logic;
		clk : IN std_logic;          
		register_cm_out : OUT std_logic_vector(3 downto 0);
		register_dm_out : OUT std_logic_vector(3 downto 0);
		register_m_out : OUT std_logic_vector(3 downto 0)
		);
	END COMPONENT;
	
	signal clk_1MHz : std_logic;
	signal sig_fsm_control : std_logic_vector(14 downto 0);
	signal tristate_control : std_logic;
	signal trigger_pulse : std_logic;
	signal load: std_logic;
	signal eco_rst : std_logic;
	signal eco_en_1 : std_logic;
	signal eco_in : std_logic;
	signal eco_en_2 : std_logic;
	signal cm : std_logic_vector(3 downto 0);
	signal dm : std_logic_vector(3 downto 0);
	signal m : std_logic_vector(3 downto 0);
	
begin

	Inst_cont_preescalado: cont_preescalado PORT MAP(
		clk => clk,
		en => en,
		reset => rst,
		reloj_1mhz => clk_1MHz  
	);
	
	Inst_cycle_counter_19455: cycle_counter_19455 PORT MAP(
		clk => clk_1MHz,
		rst => rst,
		en => en,
		t => open,
		count => sig_fsm_control 
	);

	Inst_fsm_control: fsm_control PORT MAP(
		clk => clk_1MHz,
		rst => rst,
		en => en,
		cycle_count_in => sig_fsm_control,
		measure_en_out => eco_en_1,
		measure_load_out => load,
		measure_reset_out => eco_rst,
		trigger_pulse_out => trigger_pulse,
		tristate_control_out => tristate_control 
	);
	
	Inst_top_bi_dir: top_bi_dir PORT MAP(
		dir => tristate_control,
		sig_out => trigger_pulse,
		sig_in => eco_in,
		bi => sig_inout 
	);
	
	eco_en_2 <= eco_in and eco_en_1;
	
	Inst_eco_counter: eco_counter PORT MAP(
		clk => clk_1MHz,
		en => eco_en_2,
		rst => eco_rst,
		cm_count => cm,
		dm_count => dm,
		m_count => m
	);

	Inst_measures_registers: measures_registers PORT MAP(
		load => load,
		register_cm_in => cm,
		register_dm_in => dm,
		register_m_in => m,
		rst => rst,
		clk => clk_1MHz,
		register_cm_out => cm_reg,
		register_dm_out => dm_reg,
		register_m_out => m_reg
	);
end Behavioral;

