LIBRARY ieee;
USE ieee.std_logic_1164.all;

entity controlUnit IS 
	port(
		opCode: in std_logic_vector(3 downto 0);
		cond: in std_logic_vector(3 downto 0);
		opx: in std_logic_vector(2 downto 0);
		n: in std_logic;
		b: in std_logic;
		c: in std_logic;
		z: in std_logic;
		mfc: in std_logic;
		clock: in std_logic;
		reset: in std_logic;
		alu_op: out std_logic_vector(1 downto 0);
		c_select: out std_logic_vector(1 downto 0); 
		y_select: out std_logic_vector(1 downto 0); 
		rf_write: out std_logic;
		b_select: out std_logic;
		a_inv: out std_logic;
		b_inv: out std_logic;
		extend: out std_logic_vector(1 downto 0);
		ir_enable: out std_logic;
		ma_select: out std_logic;
		mem_read: out std_logic;
		mem_write: out std_logic;
		pc_select: out std_logic;
		pc_enable: out std_logic;
		inc_select: out std_logic
	);
END controlUnit;

Architecture behavior OF controlUnit IS 
signal wmfc: std_logic;
	shared variable stage: integer:= 0;	
	Begin 
	process(clock,reset)
		Begin
			if(rising_edge(clock)) then
				if(reset = '1') then 
					stage:=0;
				end if;
				if(mfc='1' or wmfc='1') then
					stage:= (stage mod 5) + 1;
				end if;
				
					if(stage = 1) then
						wmfc <= '1';
						alu_op <= "00";
						c_select <= "01";
						y_select <= "00";
						rf_write <= '0';
						b_select <= '0';
						a_inv <= '0';
						b_inv <= '0';
						extend <= "00";
						ir_enable <= '1';
						ma_select <= '1';
						mem_read <= '1';
						mem_write <= '0';
						pc_select <= '0'; 
						pc_enable <= mfc;
						inc_select <= '0';
					elsif(stage = 2) then
						wmfc <= '0';
						pc_enable <= '0';
						ir_enable <= '0';
						mem_read <= '0';
					elsif(stage = 3) then 
						if(opCode(3 downto 2) = "00") then
							if(opCode(1 downto 0) = "00") then 
								if(opx = "000") then 
									alu_op <= "00"; --And instruction
								elsif(opx = "001") then
									alu_op <= "01"; --Or instruction  
								elsif(opx = "010") then
									alu_op <= "10"; --XOR instruction
								elsif(opx = "011") then
									alu_op <= "11"; --And instruction
								elsif(opx = "100") then
									alu_op <= "11"; --Sub instruction
									b_inv <= '1';
								end if;
							end if;
						end if;
						elsif(stage = 4) then
							if(opCode(3 downto 2) = "00") then
								if(opCode(1 downto 0) = "01") then

								end if;
							end if;
						elsif(stage = 5) then 
							if(opCode(3 downto 2) = "00") then
								if(opCode(1 downto 0) = "01") then
								elsif(opCode(1 downto 0) = "00") then
									rf_write <= '1';
								end if;
							end if;
						end if;
			END if;
	END process;
END behavior;