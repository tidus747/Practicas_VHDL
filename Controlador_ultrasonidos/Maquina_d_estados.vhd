----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:53:55 11/26/2014 
-- Design Name: 
-- Module Name:    Maquina_d_estados - Behavioral 
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

entity Maquina_d_estados is
    Port ( cycle_count_in : in  STD_LOGIC_VECTOR (14 downto 0);
           clk : in  STD_LOGIC;
           en : in  STD_LOGIC;
           rst : in  STD_LOGIC;
           measure_en_out : out  STD_LOGIC;
           measure_load_out : out  STD_LOGIC;
           measure_reset_out : out  STD_LOGIC;
           trigger_pulse_out : out  STD_LOGIC;
           tristate_control_out : out  STD_LOGIC);
end Maquina_d_estados;

architecture Behavioral of Maquina_d_estados is

type state_type is(st0_wait_for_next_measure, st1_trigger,st2_holdOff,st3_measure);

signal state,next_state: state_type;

begin

memoria: process (clk, rst)
begin
	if rst = '1' then
		state <= st0_wait_for_next_measure;
		--elsif clk' event and clk='1' then
	elsif rising_edge(clk) then
	
	if en= '1' then
			state <= next_state;
			end if;
		end if;
	
end process;

next_state_proc : process(cycle_count_in,state) --es un proceso combinacional que no depende del reloj
begin

next_state <= state ;

	case state is
		when st0_wait_for_next_measure => 
			if cycle_count_in= "000000000000000" then
				next_state <= st1_trigger;
				end if;
		when st1_trigger =>
			if cycle_count_in= "000000000000101" then
				next_state <= st2_holdoff;
				end if;
		when st2_holdoff => 
			if cycle_count_in="000001011110011" then
				next_state <= st3_measure;
				end if;
		when st3_measure =>
			if cycle_count_in="100101100110111" then
				next_state <= st0_wait_for_next_measure;
				end if;
		when others => 
			next_state <= st0_wait_for_next_measure;
		end case;
	

end process;

salida: process(state)
begin
	case state is
	
	when st0_wait_for_next_measure =>  --estado de espera antes de realizar la siguiente medida
	
		tristate_control_out <= '1'; -- tristate as a IN
		trigger_pulse_out <= '0';
		measure_en_out <= '0';
		measure_load_out <= '1';
		measure_reset_out <= '0';
	
	when st1_trigger =>  --durante este estado se emite el pulso de 5 µs para realizar una medida.
	
		tristate_control_out <= '0';-- tristate as an OUT
		trigger_pulse_out <= '1';
		measure_en_out <= '0';
		measure_load_out <= '0';
		measure_reset_out <= '1';
	
	when st2_holdoff => --tiempo de espera. Permanece en este estado 750 microsegundos
		
		tristate_control_out <= '1';-- tristate as a IN
      trigger_pulse_out <= '0';
      measure_en_out <= '0';
      measure_load_out <= '0';
      measure_reset_out <= '1';
		
	when st3_measure =>
	
		tristate_control_out <= '1';-- tristate as a IN
		trigger_pulse_out <= '0';
		measure_en_out <= '1';
		measure_load_out <= '0';
		measure_reset_out <= '0';
		
	when others => 
	
		tristate_control_out <= '0';-- tristate as a IN
		trigger_pulse_out <= '0';
		measure_en_out <= '0';
		measure_load_out <= '0';
		measure_reset_out <= '0';
		
	end case;

end process;

end Behavioral;

