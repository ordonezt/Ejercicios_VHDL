--Guia 1, test bench ejercicio 7
--Alumno: Tomás Bautista Ordóñez
--Legajo: 1595659
--GitLab User: toordonez
--Mail: tomasbautista.o@gmail.com


LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY guiaDeClase01_07_tb IS
END guiaDeClase01_07_tb;
 
ARCHITECTURE behavior OF guiaDeClase01_07_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT guiaDeClase01_07
    PORT(
         binario : IN  std_logic_vector(3 downto 0);
         gray : OUT  std_logic_vector(3 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal binario : std_logic_vector(3 downto 0) := (others => '0');

 	--Outputs
   signal gray : std_logic_vector(3 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
  
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: guiaDeClase01_07 PORT MAP (
          binario => binario,
          gray => gray
        ); 

   -- Stimulus process
   stim_proc: process
   begin		
      wait for 100 ns;	
		binario <= "0010";
		
		wait for 100 ns;	
		binario <= "0100";


      wait;
   end process;

END;
