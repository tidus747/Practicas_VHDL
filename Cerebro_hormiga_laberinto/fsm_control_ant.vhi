
-- VHDL Instantiation Created from source file fsm_control_ant.vhd -- 15:53:17 12/10/2014
--
-- Notes: 
-- 1) This instantiation template has been automatically generated using types
-- std_logic and std_logic_vector for the ports of the instantiated module
-- 2) To use this template to instantiate this entity, cut-and-paste and then edit

	COMPONENT fsm_control_ant
	PORT(
		clk : IN std_logic;
		rst : IN std_logic;
		en : IN std_logic;
		antenas : IN std_logic_vector(1 downto 0);          
		ident : OUT std_logic_vector(3 downto 0);
		salida_der : OUT std_logic;
		salida_izq : OUT std_logic
		);
	END COMPONENT;

	Inst_fsm_control_ant: fsm_control_ant PORT MAP(
		clk => ,
		rst => ,
		en => ,
		antenas => ,
		ident => ,
		salida_der => ,
		salida_izq => 
	);


