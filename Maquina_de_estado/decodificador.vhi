
-- VHDL Instantiation Created from source file decodificador.vhd -- 21:38:18 11/22/2014
--
-- Notes: 
-- 1) This instantiation template has been automatically generated using types
-- std_logic and std_logic_vector for the ports of the instantiated module
-- 2) To use this template to instantiate this entity, cut-and-paste and then edit

	COMPONENT decodificador
	PORT(
		bcd : IN std_logic_vector(3 downto 0);          
		led : OUT std_logic_vector(6 downto 0);
		diodo : OUT std_logic
		);
	END COMPONENT;

	Inst_decodificador: decodificador PORT MAP(
		bcd => ,
		led => ,
		diodo => 
	);

