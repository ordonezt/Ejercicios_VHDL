--Guia 1, test bench ejercicio 9
--Alumno: Tomás Bautista Ordóñez
--Legajo: 1595659
--GitLab User: toordonez
--Mail: tomasbautista.o@gmail.com


LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY guiaDeClase01_09_tb IS
END guiaDeClase01_09_tb;
 
ARCHITECTURE behavior OF guiaDeClase01_09_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT guiaDeClase01_09
    PORT(
         entrada : IN  std_logic_vector(15 downto 0);
         salida : OUT  std_logic_vector(15 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal entrada : std_logic_vector(15 downto 0) := (others => '0');

 	--Outputs
   signal salida : std_logic_vector(15 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 

BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: guiaDeClase01_09 PORT MAP (
          entrada => entrada,
          salida => salida
        );

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;
		entrada <= "0000000000000010";

      wait;
   end process;

END;
