--Guia 1, test bench ejercicio 8
--Alumno: Tomás Bautista Ordóñez
--Legajo: 1595659
--GitLab User: toordonez
--Mail: tomasbautista.o@gmail.com


LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY guiaDeClase01_08_tb IS
END guiaDeClase01_08_tb;
 
ARCHITECTURE behavior OF guiaDeClase01_08_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT guiaDeClase01_08
    PORT(
         entrada : IN  std_logic_vector(7 downto 0);
         salida : OUT  std_logic_vector(7 downto 0);
         sel : IN  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal entrada : std_logic_vector(7 downto 0) := (others => '0');
   signal sel : std_logic := '0';

 	--Outputs
   signal salida : std_logic_vector(7 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: guiaDeClase01_08 PORT MAP (
          entrada => entrada,
          salida => salida,
          sel => sel
        );

   -- Stimulus process
   stim_proc: process
   begin		
      wait for 100 ns;
		sel <= '0';
		entrada <= "00000010";
		
		wait for 100 ns;
		sel <= '0';
		entrada <= "00000100";

		wait for 100 ns;
		sel <= '1';
		entrada <= "00000010";
		
		wait for 100 ns;
		sel <= '1';
		entrada <= "00000100";


      wait;
   end process;

END;
