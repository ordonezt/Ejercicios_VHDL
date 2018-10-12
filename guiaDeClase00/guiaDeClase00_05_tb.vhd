--Guia 0, test bench ejercicio 5
--Alumno: Tomás Bautista Ordóñez
--Legajo: 1595659
--GitLab User: toordonez
--Mail: tomasbautista.o@gmail.com


LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY guiaDeClase00_05_tb IS
END guiaDeClase00_05_tb;
 
ARCHITECTURE ARCH_guiaDeClase00_05_tb OF guiaDeClase00_05_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT guiaDeClase00_05
    PORT(
         a : IN  std_logic_vector(1 downto 0);
         c : IN  std_logic;
         s : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal a : std_logic_vector(1 downto 0) := (others => '0');
   signal c : std_logic := '0';

 	--Outputs
   signal s : std_logic;
	
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: guiaDeClase00_05 PORT MAP (
          a => a,
          c => c,
          s => s
        );


   stim_proc0: process
   begin		
      wait for 100 ns;	
		
		a(1) <= not(a(1));
		
   end process;
	
	stim_proc1: process
   begin		
      wait for 75 ns;	
		
		a(0) <= not(a(0));
		
   end process;
	
	stim_proc2: process
   begin		
      wait for 50 ns;	
		
		c <= not(c);
		
   end process;
	
END;
