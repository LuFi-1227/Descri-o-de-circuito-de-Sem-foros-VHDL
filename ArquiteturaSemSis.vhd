-- Bibliotecas e pacotes 
	library ieee ;
	use ieee.std_logic_1164.all ;
	use ieee.numeric_std.all ;
	
-- Entidades
entity semaforo is
	port(
		MJGREEN, clock : in bit;
		MJG, MJR, MIG, MIR : out bit
	);
end entity semaforo;

entity controlador is
	port(
		Car, Timed, clock : in bit;
		MJGREEN, STimer : out bit
	);
end entity controlador;

entity timer is
	port(
		Stimer, clock : in bit;
		Timed : out bit
	);
end entity timer;

-- Arquitetura
architecture control of controlador is
begin 
	process(Timed, Car, clock)
	variable V : bit;
	begin
		if(clock 'event and clock='1') then
			V := ((not Car) and V) or (Timed and (not V));
		end if;
		MJGREEN <= V;
		STimer <= not V;
	end process;
end architecture control;

architecture countT of timer is
begin
	process(STimer, clock)
	variable counter, var1, var2: bit;
	begin
		if(STimer 'event and STimer='1')then
			Timed <= '0';
		end if;
		if(clock 'event and clock='1' and counter='0') then
			var1 := Stimer and not var1 and not var2;
			counter :='1';
		end if;
		if(clock 'event and clock='1' and counter='1') then
			var2 := var1;
		end if;
		Timed <= var2 or ((not Stimer) and (not var1));
	end process;
end architecture countT;

architecture sem of semaforo is
begin
	process(MJGREEN, clock)
	variable M, N, O : bit;
	begin
		if(clock 'event and clock='1') then
			M := MJGREEN;
		end if;
		if(M=MJGREEN) then
			N := M;
			O := not M;
		end if;
		if(N='1') then
			MJG <= N after 5 ns;
			MIR <= N;
			MJR <= not N after 5 ns;
			MIG <= not N;
		end if;
		if(O='1') then
			MJR <= O; 
			MIG <= O after 5 ns;
			MJG <= not O;
			MIR <= not O after 5 ns;
		end if;
	end process;
end architecture sem;