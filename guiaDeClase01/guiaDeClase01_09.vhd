--Guia 1, ejercicio 9
--Alumno: Tomás Bautista Ordóñez
--Legajo: 1595659
--GitLab User: toordonez
--Mail: tomasbautista.o@gmail.com


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity guiaDeClase01_09 is
	Generic (N: integer := 16);
	Port ( 	entrada: in std_logic_vector (N-1 downto 0);
				salida : out std_logic_vector (N-1 downto 0));
end guiaDeClase01_09;

architecture guiaDeClase01_09 of guiaDeClase01_09 is

signal Sig_Bin, Sig_Sum: std_logic_vector(N-1 downto 0);

begin

--Convierto la entrada a binaria
Conversior0: entity work.guiaDeClase01_08(ARCH_guiaDeClase01_08)
					GENERIC	MAP(N => N)
					PORT MAP(
								entrada => entrada,
								salida => Sig_Bin,
								sel => '0');
								
--Instancio el full adder
FullAdder: entity work.guiaDeClase01_05(ARCH_guiaDeClase01_05)
				GENERIC MAP(N => N)
				PORT MAP(
							A => Sig_Bin,
							B => (others => '0'),
							Ci => '1',
							S => Sig_Sum);

--Convierto la salida a gray
Conversior1: entity work.guiaDeClase01_08(ARCH_guiaDeClase01_08)
					GENERIC MAP( N => N)
					PORT MAP(
								entrada => Sig_Sum,
								Salida => salida,
								sel => '1');

end guiaDeClase01_09;

