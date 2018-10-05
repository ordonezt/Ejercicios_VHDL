--Guia 1, ejercicio 1
--Alumno: Tomás Bautista Ordóñez
--Legajo: 1595659
--GitLab User: toordonez
--Mail: tomasbautista.o@gmail.com


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity guiaDeClase01_01 is
port (	a : in	std_logic_vector (3 downto 0);
			c : in	std_logic_vector (1 downto 0);
			s : out 	std_logic);
end guiaDeClase01_01;

architecture ARCH_guiaDeClase01_01 of guiaDeClase01_01 is

signal S0,S1 : std_logic;

begin

Mux2a1_0: entity work.guiaDeClase00_05(ARCH_guiaDeClase00_05)
port map(	A(1) 	=> A(3),
				A(0) 	=> A(2),
				C 		=> C(0),
				S 		=> S1
		  );
Mux2a1_1: entity work.guiaDeClase00_05(ARCH_guiaDeClase00_05)
port map(	A(1) 	=> A(1),
				A(0) 	=> A(0),
				C 		=> C(0),
				S 		=> S0
		  );
Mux2a1_2: entity work.guiaDeClase00_05(ARCH_guiaDeClase00_05)
port map(	A(1) 	=> S1,
				A(0) 	=> S0,
				C 		=> C(1),
				S 		=> S
		  );

end ARCH_guiaDeClase01_01;

