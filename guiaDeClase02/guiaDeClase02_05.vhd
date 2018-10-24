--Guia 2, ejercicio 5
--Alumno: Tomás Bautista Ordóñez
--Legajo: 1595659
--GitLab User: toordonez
--Mail: tomasbautista.o@gmail.com

--Maquina de estados tipo Mealy
--Estados: A,B y R
--Transiciones:
--A:
--		Si d=0/ascendente=0; descendente=0; Me quedo en A
--		Si d=1/ascendente=1; descendente=0; Me voy a B
--B:
--		Si d=1/ascendente=0; descendente=0; Me quedo en B
--		Si d=0/ascendente=0; descendente=1; Me voy a A
--R:
--		Si d=0/ascendente=0; descendente=0; Me voy a A
--		Si d=1/ascendente=0; descendente=0; Me voy a B


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity guiaDeClase02_05 is
	Port ( 	clk: in std_logic;
				rst: in std_logic;
				d: in std_logic;
				ascendente : out std_logic;
				descendente : out std_logic);
end guiaDeClase02_05;

architecture ARCH_guiaDeClase02_05 of guiaDeClase02_05 is

type TSTATE is (A,B,R);

signal	Q_nxt, Q_curr: TSTATE;

begin

	--PROCESO SECUENCIAL SINCRONICO
	P1: process(clk)
	begin
	
		if Rising_Edge(clk) then
			if rst='1' then
				Q_curr <= R;
			else
				Q_curr <= Q_nxt;
			end if;
		end if;	
	end process P1;
	
	--LOGICA COMBINACIONAL ESTADO FUTURO
	P2: process( Q_curr, d)
	begin
		
		case Q_curr is
			
			when A =>
				if d='0' then
					Q_nxt <= A;
				elsif d='1' then
					Q_nxt <= B;
				end if;
			
			when B =>
				if d='0' then
					Q_nxt <= A;
				elsif d='1' then
					Q_nxt <= B;
				end if;
			
			when R =>
				if d='0' then
					Q_nxt <= A;
				elsif d='1' then
					Q_nxt <= B;
				end if;
		end case;
	end process P2;
	
	--LOGICA COMBINACIONAL DE SALIDA
	P3: process(Q_curr,d)
	begin
		case Q_curr is
			when A =>
				if d='0' then
					ascendente <= '0';
					descendente <= '0';
				elsif d='1' then
					ascendente <= '1';
					descendente <= '0';
				end if;
			
			when B =>
				if d='0' then
					ascendente <= '0';
					descendente <= '1';
				elsif d='1' then
					ascendente <= '0';
					descendente <= '0';
				end if;
			
			when R =>
				if d='0' then
					ascendente <= '0';
					descendente <= '0';
				elsif d='1' then
					ascendente <= '0';
					descendente <= '0';
				end if;
		end case;
	end process P3;
end ARCH_guiaDeClase02_05;

