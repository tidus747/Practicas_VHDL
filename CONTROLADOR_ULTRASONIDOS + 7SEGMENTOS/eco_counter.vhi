
-- VHDL Instantiation Created from source file eco_counter.vhd -- 02:26:20 11/27/2014
--
-- Notes: 
-- 1) This instantiation template has been automatically generated using types
-- std_logic and std_logic_vector for the ports of the instantiated module
-- 2) To use this template to instantiate this entity, cut-and-paste and then edit

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

	Inst_eco_counter: eco_counter PORT MAP(
		clk => ,
		en => ,
		rst => ,
		cm_count => ,
		dm_count => ,
		m_count => 
	);


