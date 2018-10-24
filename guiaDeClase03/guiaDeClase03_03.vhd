--Guia 3, ejercicio 3
--Alumno: Tomás Bautista Ordóñez
--Legajo: 1595659
--GitLab User: toordonez
--Mail: tomasbautista.o@gmail.com


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity guiaDeClase03_03 is
	Port ( 	clk : in std_logic;
				rst : in std_logic;
				led : out std_logic);
end guiaDeClase03_03;

architecture ARCH_guiaDeClase03_03 of guiaDeClase03_03 is

	Signal SigSalidaM_2, SigSalidaM, SigT: std_logic;

begin

	--Uso un contador modulo M y M/2 con un FFT
	
	SigT <= SigSalidaM_2 or SigSalidaM;
	
	ContMyM_2: entity work.guiaDeClase03_01(ARCH_guiaDeClase03_01)
	Generic Map( M => 200000000) --200.000.000 (2M)
	Port Map(
				clk => clk,
				rst => rst,
				ena => '1',
				salidaM_2 => SigSalidaM_2,
				salidaM => SigSalidaM
				);
	
	FFT: entity work.guiaDeClase03_02(ARCH_guiaDeClase03_02)
	Port Map(
				clk => clk,
				rst => rst,
				t => SigT,
				q => led
				);
end ARCH_guiaDeClase03_03;

