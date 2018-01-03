
-- VHDL Instantiation Created from source file abs_counter.vhd -- 23:09:00 11/26/2014
--
-- Notes: 
-- 1) This instantiation template has been automatically generated using types
-- std_logic and std_logic_vector for the ports of the instantiated module
-- 2) To use this template to instantiate this entity, cut-and-paste and then edit

	COMPONENT abs_counter
	PORT(
		clk : IN std_logic;
		rst : IN std_logic;
		en : IN std_logic;          
		t : OUT std_logic;
		count : OUT std_logic_vector(14 downto 0)
		);
	END COMPONENT;

	Inst_abs_counter: abs_counter PORT MAP(
		clk => ,
		rst => ,
		en => ,
		t => ,
		count => 
	);


