
-- VHDL Instantiation Created from source file fsm_control.vhd -- 02:03:49 11/27/2014
--
-- Notes: 
-- 1) This instantiation template has been automatically generated using types
-- std_logic and std_logic_vector for the ports of the instantiated module
-- 2) To use this template to instantiate this entity, cut-and-paste and then edit

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

	Inst_fsm_control: fsm_control PORT MAP(
		clk => ,
		rst => ,
		en => ,
		cycle_count_in => ,
		measure_en_out => ,
		measure_load_out => ,
		measure_reset_out => ,
		trigger_pulse_out => ,
		tristate_control_out => 
	);


