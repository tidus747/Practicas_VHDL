----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:30:13 11/25/2014 
-- Design Name: 
-- Module Name:    algoritmicamente - Behavioral 
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
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity fsm_control is
	port( clk : in std_logic;
			rst : in std_logic;
			en : in std_logic;
			cycle_count_in : in std_logic_vector(14 downto 0);
			measure_en_out : out std_logic;
			measure_load_out : out std_logic;
			measure_reset_out : out std_logic;
			trigger_pulse_out : out std_logic;
			tristate_control_out : out std_logic			
	);
end fsm_control;

architecture Behavioral of fsm_control is

	constant transition_1 : std_logic_vector(14 downto 0) := conv_std_logic_vector(0, 15);
	constant transition_2 : std_logic_vector(14 downto 0) := conv_std_logic_vector(5, 15);
	constant transition_3 : std_logic_vector(14 downto 0) := conv_std_logic_vector(755, 15);
	constant transition_4 : std_logic_vector(14 downto 0) := conv_std_logic_vector(19255, 15);

type state_type is (st0_wait_for_next_measure, st1_trigger, st2_holdoff, st3_measure); -- definimos los 4 estados

	signal state, next_state : state_type; -- variable tipo type

begin

memoria : process(clk, rst, en)                      --implementamos la memoria, tenemos que añadir el reset a la lista de sensibilidad, es secuencial
begin

		if rst = '1' then
			state <= st0_wait_for_next_measure;   --si reset on, volvemos al estado 1
		-- elsif clk'event and clk = '1' then o bien escribimos
			elsif (rising_edge(clk)) then
				if (en='1') then
				state <= next_state;
				end if;
		end if;

end process;

next_state_proc : process(cycle_count_in, state) --como es combinacional tienen q aparecer todas las entradas del sistema
begin

	next_state <= state;  -- se le asigna al valor siguiente el valor del estado actual, para poder entrar al case
	
	case state is
		when st0_wait_for_next_measure =>
			if cycle_count_in = transition_1 then
				next_state <= st1_trigger;
			end if;
		when st1_trigger =>
			if cycle_count_in = transition_2 then
				next_state <= st2_holdoff;
			end if;
		when st2_holdoff =>
			if cycle_count_in = transition_3 then
				next_state <= st3_measure;
			end if;
		when st3_measure =>
			if cycle_count_in = transition_4 then
				next_state <= st0_wait_for_next_measure;
			end if;
		when others =>
			next_state <= st0_wait_for_next_measure;
	end case;
	
end process;

	salida: process(state)    --la salida tambien es combinacional no depende de clk sólo (x, state) como es de moore solo state, no depende de las entradas
	begin
	
	case state is
	
		when st0_wait_for_next_measure =>
		
			tristate_control_out <= '1';
			trigger_pulse_out <= '0';
			measure_en_out <= '0';
			measure_load_out <= '1';
			measure_reset_out <= '0';
			
		when st1_trigger =>
		
			tristate_control_out <= '0';
			trigger_pulse_out <= '1';
			measure_en_out <= '0';
			measure_load_out <= '0';
			measure_reset_out <= '1';
			
		when st2_holdoff =>
			
			tristate_control_out <= '1';
			trigger_pulse_out <= '0';
			measure_en_out <= '0';
			measure_load_out <= '0';
			measure_reset_out <= '1';
			
		when st3_measure =>
			
			tristate_control_out <= '1';
			trigger_pulse_out <= '0';
			measure_en_out <= '1';
			measure_load_out <= '0';
			measure_reset_out <= '0';
			
		when others =>

			tristate_control_out <= '0';
			trigger_pulse_out <= '0';
			measure_en_out <= '0';
			measure_load_out <= '0';
			measure_reset_out <= '0';
			
	end case;
	
	end process;
	
end Behavioral;

