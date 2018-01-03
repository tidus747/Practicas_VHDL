
-- VHDL Instantiation Created from source file ca1_4bits.vhd -- 19:03:24 10/27/2014
--
-- Notes: 
-- 1) This instantiation template has been automatically generated using types
-- std_logic and std_logic_vector for the ports of the instantiated module
-- 2) To use this template to instantiate this entity, cut-and-paste and then edit

	COMPONENT ca1_4bits
	PORT(
		din : IN std_logic_vector(3 downto 0);
		op_select : IN std_logic;          
		dout : OUT std_logic_vector(3 downto 0)
		);
	END COMPONENT;

	Inst_ca1_4bits: ca1_4bits PORT MAP(
		din => ,
		dout => ,
		op_select => 
	);


