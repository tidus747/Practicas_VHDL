
-- VHDL Instantiation Created from source file deco_velocidad.vhd -- 15:57:36 12/10/2014
--
-- Notes: 
-- 1) This instantiation template has been automatically generated using types
-- std_logic and std_logic_vector for the ports of the instantiated module
-- 2) To use this template to instantiate this entity, cut-and-paste and then edit

	COMPONENT deco_velocidad
	PORT(
		estado : IN std_logic_vector(3 downto 0);
		m_in : IN std_logic_vector(3 downto 0);
		cm_in : IN std_logic_vector(3 downto 0);
		dm_in : IN std_logic_vector(3 downto 0);          
		consigna_vel_der : OUT std_logic_vector(7 downto 0);
		consigna_vel_izq : OUT std_logic_vector(7 downto 0)
		);
	END COMPONENT;

	Inst_deco_velocidad: deco_velocidad PORT MAP(
		consigna_vel_der => ,
		estado => ,
		consigna_vel_izq => ,
		m_in => ,
		cm_in => ,
		dm_in => 
	);


