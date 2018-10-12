--Guia 0, teste bench ejercicio 2
--Alumno: Tomás Bautista Ordóñez
--Legajo: 1595659
--GitLab User: toordonez
--Mail: tomasbautista.o@gmail.com


LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY guiaDeClase00_02_tb IS
END guiaDeClase00_02_tb;
 
ARCHITECTURE ARCH_guiaDeClase00_02_tb OF guiaDeClase00_02_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT guiaDeClase00_02
    PORT(
         a : IN  std_logic_vector(3 downto 0);
         c : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal a : std_logic_vector(3 downto 0) := (others => '0');

 	--Outputs
   signal c : std_logic;
	
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: guiaDeClase00_02 PORT MAP (
          a => a,
          c => c
        );

   stim_proc0: process
   begin
      wait for 100 ns;
		
		a(0) <= not(a(0));
		
   end process;
	
	stim_proc1: process
   begin
      wait for 75 ns;
		
		a(1) <= not(a(1));
		
   end process;
	
	stim_proc2: process
   begin
      wait for 50 ns;
		
		a(2) <= not(a(2));
		
   end process;
	
	stim_proc3: process
   begin
      wait for 25 ns;
		
		a(3) <= not(a(3));
		
   end process;

END;
