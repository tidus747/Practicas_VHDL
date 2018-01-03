----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    22:38:35 12/08/2014 
-- Design Name: 
-- Module Name:    hormiga - Behavioral 
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

entity hormiga is
    Port ( ant_izq : in  STD_LOGIC;
           ant_der : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           en : in  STD_LOGIC;
           rst : in  STD_LOGIC;
           izq_at : out  STD_LOGIC;
           izq_ad : out  STD_LOGIC;
           izq_pwm : out  STD_LOGIC;
           der_at : out  STD_LOGIC;
			  led_izq: out STD_LOGIC;
			  led_der:out STD_LOGIC;
           der_ad : out  STD_LOGIC;
           der_pwm : out  STD_LOGIC;
           an : out  STD_LOGIC_VECTOR (3 downto 0);
           led : out  STD_LOGIC_VECTOR (6 downto 0);
           sig_io : inout  STD_LOGIC);
end hormiga;

architecture Behavioral of hormiga is



	COMPONENT debounce
	PORT(
		clk : IN std_logic;
		antena_izq : IN std_logic;
		antena_der : IN std_logic;          
		result : OUT std_logic_vector(1 downto 0)
		);
	END COMPONENT;
	
	COMPONENT fsm_control_ant
	PORT(
		clk : IN std_logic;
		rst : IN std_logic;
		en : IN std_logic;
		antenas : IN std_logic_vector(1 downto 0); 
		ident :out std_logic_vector (3 downto 0);
		salida_der : OUT std_logic;
		salida_izq : OUT std_logic
		);
	END COMPONENT;
	
	COMPONENT DECO_GIRO
	PORT(
		motor_der : IN std_logic;
		motor_izq : IN std_logic;          
		cont_der : OUT std_logic_vector(1 downto 0);
		cont_izq : OUT std_logic_vector(1 downto 0)
		);
	END COMPONENT;

	COMPONENT deco_velocidad
	PORT(
		estado : IN std_logic_vector(3 downto 0);
		m_in : IN std_logic_vector(3 downto 0);
		cm_in : IN std_logic_vector(3 downto 0);
		dm_in : IN std_logic_vector(3 downto 0);          
		consigna_vel_der : OUT std_logic_vector(7 downto 0);
		consigna_vel_izq : OUT std_logic_vector(7 downto 0)
		);
	END COMPONENT;
	
	COMPONENT Ultra_ping
	PORT(
		rst : IN std_logic;
		en : IN std_logic;
		clk_50mhz : IN std_logic;    
		sig_IO : INOUT std_logic;      
		cm_reg : OUT std_logic_vector(3 downto 0);
		dm_reg : OUT std_logic_vector(3 downto 0);
		m_reg : OUT std_logic_vector(3 downto 0)
		);
	END COMPONENT;
	
	COMPONENT seven_segment_mux
	PORT(
		dig_0 : IN std_logic_vector(3 downto 0);
		dig_1 : IN std_logic_vector(3 downto 0);
		dig_2 : IN std_logic_vector(3 downto 0);
		dig_3 : IN std_logic_vector(3 downto 0);
		clk : IN std_logic;          
		led : OUT std_logic_vector(6 downto 0);
		an : OUT std_logic_vector(3 downto 0)
		);
	END COMPONENT;

COMPONENT controlador_derecha
	PORT(
		reset : IN std_logic;
		clk : IN std_logic;
		consigna_velocidad : IN std_logic_vector(7 downto 0);
		giro_in : IN std_logic_vector(1 downto 0);
		en : IN std_logic;          
		giro_adelante : OUT std_logic;
		giro_atras : OUT std_logic;
		pwm : OUT std_logic
		);
	END COMPONENT;
	
	COMPONENT controlador_izquierda
	PORT(
		reset : IN std_logic;
		clk : IN std_logic;
		consigna_velocidad : IN std_logic_vector(7 downto 0);
		giro_in : IN std_logic_vector(1 downto 0);          
		giro_adelante : OUT std_logic;
		en : IN std_logic;
		giro_atras : OUT std_logic;
		pwm : OUT std_logic
		);
	END COMPONENT;

	
	
	

signal antenas : std_logic_vector (1 downto 0);
signal cable_motor_der : std_logic;
signal cable_motor_izq : std_logic;
signal cable_cont_der : std_logic_vector (1 downto 0);
signal cable_cont_izq : std_logic_vector (1 downto 0);

signal cable_cm : std_logic_vector (3 downto 0);
signal cable_dm : std_logic_vector (3 downto 0);
signal cable_m : std_logic_vector (3 downto 0);
signal cable_consigna_der : std_logic_vector (7 downto 0);
signal cable_consigna_izq : std_logic_vector (7 downto 0);
signal cable_ident : std_logic_vector (3 downto 0);

begin

	Inst_debounce: debounce PORT MAP(
		clk => clk,
		antena_izq =>not ant_izq ,
		antena_der =>not ant_der ,
		result => antenas
	);
	
	Inst_fsm_control_ant: fsm_control_ant PORT MAP(
		clk => clk,
		rst => rst ,
		en => en,
		antenas => antenas ,
		ident => cable_ident,
		salida_der => cable_motor_der  ,
		salida_izq => cable_motor_izq
	);
	
		Inst_DECO_GIRO: DECO_GIRO PORT MAP(
		motor_der => cable_motor_der ,
		motor_izq => cable_motor_izq,
		cont_der => cable_cont_der ,
		cont_izq => cable_cont_izq
	);

	Inst_deco_velocidad: deco_velocidad PORT MAP(
		consigna_vel_der => cable_consigna_der,
		estado => cable_ident,
		consigna_vel_izq => cable_consigna_izq,
		m_in => cable_m,
		cm_in => cable_cm,
		dm_in => cable_dm
	);
	
	Inst_Ultra_ping: Ultra_ping PORT MAP(
		rst => rst ,
		en => en ,
		clk_50mhz => clk ,
		sig_IO => sig_io ,
		cm_reg => cable_cm ,
		dm_reg => cable_dm ,
		m_reg => cable_m 
	);
	
	Inst_seven_segment_mux: seven_segment_mux PORT MAP(
		dig_0 => cable_cm ,
		dig_1 => cable_dm,
		dig_2 => cable_m,
		dig_3 => cable_ident ,
		clk => clk,
		led => led ,
		an => an
	);


	Inst_controlador_derecha: controlador_derecha PORT MAP(
		reset => rst,
		clk => clk,
		consigna_velocidad => cable_consigna_der,
		giro_in => cable_cont_der ,
		en => en,
		giro_adelante => der_ad ,
		giro_atras => der_at ,
		pwm => der_pwm
	);
	
	Inst_controlador_izquierda: controlador_izquierda PORT MAP(
		reset =>rst ,
		clk => clk,
		consigna_velocidad =>cable_consigna_izq ,
		giro_in => cable_cont_izq ,
		en=>en,
		giro_adelante => izq_ad,
		giro_atras => izq_at ,
		pwm => izq_pwm
	);

led_izq <= not ant_izq ;
led_der <= not ant_der;




end Behavioral;

