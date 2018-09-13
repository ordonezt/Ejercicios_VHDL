--Guia 0, ejercicio 3
--Alumno: Tomás Bautista Ordóñez
--Legajo: 1595659
--GitLab User: toordonez
--Mail: tomasbautista.o@gmail.com


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity guiaDeClase00_03 is
    Port ( A,B,Cin : in  STD_LOGIC;
           S,Cout : out  STD_LOGIC);
end guiaDeClase00_03;

architecture ARCH_guiaDeClase00_03 of guiaDeClase00_03 is

signal CoutSignals: STD_LOGIC_VECTOR(2 downto 0);

begin

S <= A xor B xor Cin;
Cout <= CoutSignals(2) or CoutSignals(1) or CoutSignals(0);

CoutSignals(2) <= Cin and A;
CoutSignals(1) <= Cin and B;
CoutSignals(0) <= B and A;

end ARCH_guiaDeClase00_03;

