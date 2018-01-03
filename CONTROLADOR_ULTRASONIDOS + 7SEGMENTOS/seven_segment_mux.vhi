
-- VHDL Instantiation Created from source file seven_segment_mux.vhd -- 02:54:34 11/27/2014
--
-- Notes: 
-- 1) This instantiation template has been automatically generated using types
-- std_logic and std_logic_vector for the ports of the instantiated module
-- 2) To use this template to instantiate this entity, cut-and-paste and then edit

	COMPONENT seven_segment_mux
	PORT(
		dig_0 : IN std_logic_vector(3 downto 0);
		dig_1 : IN std_logic_vector(3 downto 0);
		dig_2 : IN std_logic_vector(3 downto 0);
		clk : IN std_logic;
		reset : IN std_logic;          
		led : OUT std_logic_vector(6 downto 0);
		an : OUT std_logic_vector(3 downto 0)
		);
	END COMPONENT;

	Inst_seven_segment_mux: seven_segment_mux PORT MAP(
		dig_0 => ,
		dig_1 => ,
		dig_2 => ,
		clk => ,
		reset => ,
		led => ,
		an => 
	);


