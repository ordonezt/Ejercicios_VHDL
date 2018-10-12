--Guia 0, teste bench ejercicio 3
--Alumno: Tomás Bautista Ordóñez
--Legajo: 1595659
--GitLab User: toordonez
--Mail: tomasbautista.o@gmail.com


LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY guiaDeClase00_03_tb IS
END guiaDeClase00_03_tb;
 
ARCHITECTURE ARCH_guiaDeClase00_03_tb OF guiaDeClase00_03_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT guiaDeClase00_03
    PORT(
         A : IN  std_logic;
         B : IN  std_logic;
         Cin : IN  std_logic;
         S : OUT  std_logic;
         Cout : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal A : std_logic := '0';
   signal B : std_logic := '0';
   signal Cin : std_logic := '0';

 	--Outputs
   signal S : std_logic;
   signal Cout : std_logic;
   
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: guiaDeClase00_03 PORT MAP (
          A => A,
          B => B,
          Cin => Cin,
          S => S,
          Cout => Cout
        );

   stim_proc0: process
   begin		
      wait for 100 ns;
		
		a <= not(a);
		
   end process;
	
	stim_proc1: process
   begin		
      wait for 75 ns;
		
		b <= not(b);
		
   end process;
	
	stim_proc2: process
   begin		
      wait for 50 ns;
		
		Cin <= not(Cin);
		
   end process;

END;
