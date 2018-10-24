--Guia 2, test bench ejercicio 5
--Alumno: Tomás Bautista Ordóñez
--Legajo: 1595659
--GitLab User: toordonez
--Mail: tomasbautista.o@gmail.com


LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY guiaDeClase02_05_tb IS
END guiaDeClase02_05_tb;
 
ARCHITECTURE behavior OF guiaDeClase02_05_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT guiaDeClase02_05
    PORT(
         clk : IN  std_logic;
         rst : IN  std_logic;
         d : IN  std_logic;
         ascendente : OUT  std_logic;
         descendente : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal rst : std_logic := '0';
   signal d : std_logic := '0';

 	--Outputs
   signal ascendente : std_logic;
   signal descendente : std_logic;

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: guiaDeClase02_05 PORT MAP (
          clk => clk,
          rst => rst,
          d => d,
          ascendente => ascendente,
          descendente => descendente
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      
      wait for 100 ns;	
		d<='1';
		
      wait for clk_period*3;
		
		d<='0';
      wait for clk_period*3;
		
      wait for clk_period*3;
		rst<='1';
		
		wait for clk_period;
		d<='1';
		wait for clk_period;
		d<='0';
      wait;
   end process;

END;
