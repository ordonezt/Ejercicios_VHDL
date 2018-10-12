--Guia 0, test bench ejercicio 7
--Alumno: Tomás Bautista Ordóñez
--Legajo: 1595659
--GitLab User: toordonez
--Mail: tomasbautista.o@gmail.com


LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
  
ENTITY guiaDeClase00_07_tb IS
END guiaDeClase00_07_tb;
 
ARCHITECTURE ARCH_guiaDeClase00_07_tb OF guiaDeClase00_07_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT guiaDeClase00_07
    PORT(
         entrada : IN  std_logic_vector(7 downto 0);
         control : IN  std_logic;
         salida : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal entrada : std_logic_vector(7 downto 0) := (others => '0');
   signal control : std_logic := '0';

 	--Outputs
   signal salida : std_logic_vector(7 downto 0);
   
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: guiaDeClase00_07 PORT MAP (
          entrada => entrada,
          control => control,
          salida => salida
        );
		  
   stim_proc0: process
   begin		
      wait for 100 ns;	
		
		entrada(0) <= not(entrada(0));
		entrada(2) <= not(entrada(2));
		entrada(4) <= not(entrada(4));
		entrada(6) <= not(entrada(6));
		
   end process;
	
	stim_proc1: process
   begin		
      wait for 75 ns;	
		
		entrada(1) <= not(entrada(1));
		entrada(3) <= not(entrada(3));
		entrada(5) <= not(entrada(5));
		entrada(7) <= not(entrada(7));
		
   end process;
	
	stim_proc2: process
   begin		
      wait for 50 ns;	
		
		control <= not(control);
		
   end process;
END;
