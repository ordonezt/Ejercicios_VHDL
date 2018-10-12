--Guia 0, test bench ejercicio 6
--Alumno: Tomás Bautista Ordóñez
--Legajo: 1595659
--GitLab User: toordonez
--Mail: tomasbautista.o@gmail.com


LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
  
ENTITY guiaDeClase00_06_tb IS
END guiaDeClase00_06_tb;
 
ARCHITECTURE ARCH_guiaDeClase00_06_tb OF guiaDeClase00_06_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT guiaDeClase00_06
    PORT(
         entrada : IN  std_logic;
         control : IN  std_logic;
         salida : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal entrada : std_logic := '0';
   signal control : std_logic := '0';

 	--Outputs
   signal salida : std_logic;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: guiaDeClase00_06 PORT MAP (
          entrada => entrada,
          control => control,
          salida => salida
        );

   stim_proc0: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      entrada <= not(entrada);
		
   end process;
	
	stim_proc1: process
   begin		
      -- hold reset state for 100 ns.
      wait for 50 ns;	

      control <= not(control);
		
   end process;
	
END;
