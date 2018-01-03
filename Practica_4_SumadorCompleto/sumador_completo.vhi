
-- VHDL Instantiation Created from source file sumador_completo.vhd -- 09:31:09 10/28/2014
--
-- Notes: 
-- 1) This instantiation template has been automatically generated using types
-- std_logic and std_logic_vector for the ports of the instantiated module
-- 2) To use this template to instantiate this entity, cut-and-paste and then edit

	COMPONENT sumador_completo
	PORT(
		x : IN std_logic_vector(3 downto 0);
		y : IN std_logic_vector(3 downto 0);
		control1 : IN std_logic;
		control2 : IN std_logic;
		op_select : IN std_logic;          
		overflow : OUT std_logic;
		salida : OUT std_logic_vector(3 downto 0)
		);
	END COMPONENT;

	Inst_sumador_completo: sumador_completo PORT MAP(
		x => ,
		y => ,
		control1 => ,
		control2 => ,
		op_select => ,
		overflow => ,
		salida => 
	);


