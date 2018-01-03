
-- VHDL Instantiation Created from source file control_ultrasonidos.vhd -- 02:50:43 11/27/2014
--
-- Notes: 
-- 1) This instantiation template has been automatically generated using types
-- std_logic and std_logic_vector for the ports of the instantiated module
-- 2) To use this template to instantiate this entity, cut-and-paste and then edit

	COMPONENT control_ultrasonidos
	PORT(
		rst : IN std_logic;
		clk : IN std_logic;
		en : IN std_logic;    
		sig_inout : INOUT std_logic;      
		cm_reg : OUT std_logic_vector(3 downto 0);
		dm_reg : OUT std_logic_vector(3 downto 0);
		m_reg : OUT std_logic_vector(3 downto 0)
		);
	END COMPONENT;

	Inst_control_ultrasonidos: control_ultrasonidos PORT MAP(
		rst => ,
		clk => ,
		en => ,
		sig_inout => ,
		cm_reg => ,
		dm_reg => ,
		m_reg => 
	);


