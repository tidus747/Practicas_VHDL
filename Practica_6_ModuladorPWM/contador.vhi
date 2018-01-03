
-- VHDL Instantiation Created from source file contador.vhd -- 22:56:48 11/13/2014
--
-- Notes: 
-- 1) This instantiation template has been automatically generated using types
-- std_logic and std_logic_vector for the ports of the instantiated module
-- 2) To use this template to instantiate this entity, cut-and-paste and then edit

	COMPONENT contador
	PORT(
		rst : IN std_logic;
		clk : IN std_logic;          
		q : OUT std_logic_vector(7 downto 0)
		);
	END COMPONENT;

	Inst_contador: contador PORT MAP(
		rst => ,
		clk => ,
		q => 
	);


