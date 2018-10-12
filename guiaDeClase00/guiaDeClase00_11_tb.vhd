--Guia 0, teste bench ejercicio 11
--Alumno: Tomás Bautista Ordóñez
--Legajo: 1595659
--GitLab User: toordonez
--Mail: tomasbautista.o@gmail.com


LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY guiaDeClase00_11_tb IS
END guiaDeClase00_11_tb;
 
ARCHITECTURE ARCH_guiaDeClase00_11_tb OF guiaDeClase00_11_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT guiaDeClase00_11
    PORT(
         entrada : IN  std_logic_vector(3 downto 0);
         salida : OUT  std_logic_vector(1 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal entrada : std_logic_vector(3 downto 0) := (others => '0');

 	--Outputs
   signal salida : std_logic_vector(1 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
   constant period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: guiaDeClase00_11 PORT MAP (
          entrada => entrada,
          salida => salida
        ); 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      wait for period*10;
		--ingreso un 1
		entrada <= "0010";
		wait for period*10;
		--ingreso un 3
		entrada <= "1000";
      wait;
		
   end process;

END;
