
-- VHDL Instantiation Created from source file visualizacion.vhd -- 22:33:09 11/11/2014
--
-- Notes: 
-- 1) This instantiation template has been automatically generated using types
-- std_logic and std_logic_vector for the ports of the instantiated module
-- 2) To use this template to instantiate this entity, cut-and-paste and then edit

	COMPONENT visualizacion
	PORT(
		reset : IN std_logic;
		ce : IN std_logic;
		clk : IN std_logic;          
		led : OUT std_logic_vector(6 downto 0)
		);
	END COMPONENT;

	Inst_visualizacion: visualizacion PORT MAP(
		reset => ,
		ce => ,
		clk => ,
		led => 
	);


