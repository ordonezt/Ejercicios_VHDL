--Guia 0, teste bench ejercicio 12
--Alumno: Tomás Bautista Ordóñez
--Legajo: 1595659
--GitLab User: toordonez
--Mail: tomasbautista.o@gmail.com


LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY guiaDeClase00_12_tb IS
END guiaDeClase00_12_tb;
 
ARCHITECTURE ARCH_guiaDeClase00_12_tb OF guiaDeClase00_12_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT guiaDeClase00_12
    PORT(
         entrada : IN  std_logic_vector(7 downto 0);
         div : IN  std_logic_vector(1 downto 0);
         salida : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal entrada : std_logic_vector(7 downto 0) := (others => '0');
   signal div : std_logic_vector(1 downto 0) := (others => '0');

 	--Outputs
   signal salida : std_logic_vector(7 downto 0);
   
   constant period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: guiaDeClase00_12 PORT MAP (
          entrada => entrada,
          div => div,
          salida => salida
        ); 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      wait for period*10;
		--10/2=5
		entrada <= "00001010";
		div <= "01";
		wait for period*10;
		--8/4=2
		entrada <= "00001000";
		div <= "10";
		wait for period*10;
		--8/8=1
		entrada <= "00001000";
		div <= "11";

      wait;
   end process;

END;
