
-- VHDL Instantiation Created from source file Comparador_8bits.vhd -- 22:55:59 11/13/2014
--
-- Notes: 
-- 1) This instantiation template has been automatically generated using types
-- std_logic and std_logic_vector for the ports of the instantiated module
-- 2) To use this template to instantiate this entity, cut-and-paste and then edit

	COMPONENT Comparador_8bits
	PORT(
		PuertoA : IN std_logic_vector(7 downto 0);
		PuertoB : IN std_logic_vector(7 downto 0);          
		pwm : OUT std_logic
		);
	END COMPONENT;

	Inst_Comparador_8bits: Comparador_8bits PORT MAP(
		PuertoA => ,
		PuertoB => ,
		pwm => 
	);


