--Guia 1, test bench ejercicio 6
--Alumno: Tomás Bautista Ordóñez
--Legajo: 1595659
--GitLab User: toordonez
--Mail: tomasbautista.o@gmail.com


LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY guiaDeClase01_06_tb IS
END guiaDeClase01_06_tb;
 
ARCHITECTURE behavior OF guiaDeClase01_06_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT guiaDeClase01_06
    PORT(
         gray : IN  std_logic_vector(3 downto 0);
         binario : OUT  std_logic_vector(3 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal gray : std_logic_vector(3 downto 0) := (others => '0');

 	--Outputs
   signal binario : std_logic_vector(3 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: guiaDeClase01_06 PORT MAP (
          gray => gray,
          binario => binario
        );

   -- Stimulus process
   stim_proc: process
   begin		
      wait for 100 ns;	
		gray <= "0010";
		
		wait for 100 ns;	
		gray <= "0100";

      wait;
   end process;

END;
