--Guia 1, ejercicio 8
--Alumno: Tomás Bautista Ordóñez
--Legajo: 1595659
--GitLab User: toordonez
--Mail: tomasbautista.o@gmail.com


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity guiaDeClase01_08 is
Generic (N: integer := 8);
Port ( 	entrada: in std_logic_vector (N-1 downto 0);
			salida : out std_logic_vector (N-1 downto 0);
			sel: in std_logic);
end guiaDeClase01_08;

architecture ARCH_guiaDeClase01_08 of guiaDeClase01_08 is

signal Sig_Gray, Sig_Bin : Std_logic_vector(N-1 downto 0);

begin

E1: entity work.guiaDeClase01_07(ARCH_guiaDeClase01_07)
		GENERIC MAP( N => N)
		PORT MAP(
					binario => entrada,
					gray => Sig_gray);

E2: entity work.guiaDeClase01_06(ARCH_guiaDeClase01_06)
	GENERIC MAP( N => N)
	PORT MAP(
				gray => entrada,
				binario => Sig_Bin);
				

salida <= Sig_Gray when sel = '1' else
			Sig_Bin when sel = '0';

end ARCH_guiaDeClase01_08;