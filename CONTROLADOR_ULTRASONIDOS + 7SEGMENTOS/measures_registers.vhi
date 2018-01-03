
-- VHDL Instantiation Created from source file measures_registers.vhd -- 02:29:28 11/27/2014
--
-- Notes: 
-- 1) This instantiation template has been automatically generated using types
-- std_logic and std_logic_vector for the ports of the instantiated module
-- 2) To use this template to instantiate this entity, cut-and-paste and then edit

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

	Inst_measures_registers: measures_registers PORT MAP(
		load => ,
		register_cm_in => ,
		register_dm_in => ,
		register_m_in => ,
		rst => ,
		clk => ,
		register_cm_out => ,
		register_dm_out => ,
		register_m_out => 
	);


