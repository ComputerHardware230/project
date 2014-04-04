LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY reg16NoEnable IS
	PORT(
		data						:IN std_logic_vector(15 downto 0);
		reset, Clock				:IN std_logic;
		output						:OUT std_logic_vector(15 downto 0)
	);
END reg16NoEnable;

ARCHITECTURE behavior OF reg16NoEnable IS
BEGIN
	PROCESS(Clock, reset)
	BEGIN
		IF(reset = '1') THEN	
			output <= (OTHERS =>'0');
		ELSIF(rising_edge(Clock)) THEN
			output <= data;
		END IF;
	END PROCESS;
END behavior;