-- Bibliotecas e pacotes 
	library ieee ;
	use ieee.std_logic_1164.all ;
	use ieee.numeric_std.all ;
	entity systema is 
	end entity;
	
	entity semaforo_tb is 
	end entity;
	
	entity controlador_tb is 
	end entity;
	
	entity timer_tb is 
	end entity;
	
architecture sistem of systema is
	signal Car, Timed, MJGREEN, Stimer, clock, MJG, MJR, MIG, MIR : bit;
	
	component controlador is
	port(
		Car, Timed, clock : in bit;
		MJGREEN, STimer : out bit
	);
	end component;
	
	component timer is
	port(
		Stimer, clock : in bit;
		Timed : out bit
	);
	end component;
	
	component semaforo is
	port(
		MJGREEN, clock : in bit;
		MJG, MJR, MIG, MIR : out bit
	);
	end component;
	
	begin
		F: controlador port map(Car, Timed, clock, MJGREEN, Stimer);
		T: timer port map(Stimer, clock, Timed);
		K: semaforo port map(MJGREEN, clock, MJG, MJR, MIG, MIR);
		
		clock_P: process is
		begin 
			clock <= '1';
			wait for 50 ns;
			clock <= '0';
			wait for 50 ns;
		end process;
		
		estimulo: process is
		begin
			Car <= '0';
			wait for 100 ns;
			Car <= '1';
			wait for 100 ns;
		end process;
	
	end architecture;