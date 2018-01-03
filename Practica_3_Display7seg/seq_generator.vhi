
-- VHDL Instantiation Created from source file seq_generator.vhd -- 16:36:19 10/12/2014
--
-- Notes: 
-- 1) This instantiation template has been automatically generated using types
-- std_logic and std_logic_vector for the ports of the instantiated module
-- 2) To use this template to instantiate this entity, cut-and-paste and then edit

	COMPONENT seq_generator
	PORT(
		clk : IN std_logic;
		reset : IN std_logic;          
		seq : OUT std_logic_vector(1 downto 0)
		);
	END COMPONENT;

	Inst_seq_generator: seq_generator PORT MAP(
		clk => ,
		reset => ,
		seq => 
	);


