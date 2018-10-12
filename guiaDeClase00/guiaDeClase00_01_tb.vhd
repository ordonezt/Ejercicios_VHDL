--Guia 0, teste bench ejercicio 1
--Alumno: Tomás Bautista Ordóñez
--Legajo: 1595659
--GitLab User: toordonez
--Mail: tomasbautista.o@gmail.com


LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

 
ENTITY guiaDeClase00_01_tb IS
END guiaDeClase00_01_tb;
 
ARCHITECTURE ARCH_guiaDeClase00_01_tb OF guiaDeClase00_01_tb IS
 
    COMPONENT guiaDeClase00_01
    PORT(
         a : IN  std_logic;
         b : IN  std_logic;
         c : OUT  std_logic
        );
    END COMPONENT;
    

   --Entradas
   signal a : std_logic := '0';
   signal b : std_logic := '0';

 	--Salidas
   signal c : std_logic;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: guiaDeClase00_01 PORT MAP (
          a => a,
          b => b,
          c => c
        );
 
   stim_proc1: process
   begin		
      wait for 100 ns;
		a <= not(a);
   end process;
	
	stim_proc2: process
   begin		
      wait for 50 ns;
		b <= not(b);
   end process;

END;
