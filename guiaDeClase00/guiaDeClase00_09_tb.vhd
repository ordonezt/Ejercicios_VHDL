--Guia 0, ejercicio 9
--Alumno: Tomás Bautista Ordóñez
--Legajo: 1595659
--GitLab User: toordonez
--Mail: tomasbautista.o@gmail.com


LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
  
ENTITY guiaDeClase00_09_tb IS
END guiaDeClase00_09_tb;
 
ARCHITECTURE behavior OF guiaDeClase00_09_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT guiaDeClase00_09
    PORT(
         entrada : IN  std_logic_vector(3 downto 0);
         a : OUT  std_logic;
         b : OUT  std_logic;
         c : OUT  std_logic;
         d : OUT  std_logic;
         e : OUT  std_logic;
         f : OUT  std_logic;
         g : OUT  std_logic
        );
    END COMPONENT;
    
	 constant period : time := 10 ns;

   --Inputs
   signal entrada : std_logic_vector(3 downto 0) := (others => '0');

 	--Outputs
   signal a : std_logic;
   signal b : std_logic;
   signal c : std_logic;
   signal d : std_logic;
   signal e : std_logic;
   signal f : std_logic;
   signal g : std_logic;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: guiaDeClase00_09 PORT MAP (
          entrada => entrada,
          a => a,
          b => b,
          c => c,
          d => d,
          e => e,
          f => f,
          g => g
        );


   stim_proc0: process
   begin		
      wait for 100 ns;	
		
		wait for period;
		--Ingreso un 1 en BCD
		entrada <= "0001";
		
		wait for period;
		--Ingreso un 8 en BCD
		entrada <= "1000";
   end process;
	
	
END;
