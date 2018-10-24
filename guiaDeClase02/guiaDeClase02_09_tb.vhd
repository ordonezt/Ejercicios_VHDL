--Guia 2, test bench ejercicio 9
--Alumno: Tomás Bautista Ordóñez
--Legajo: 1595659
--GitLab User: toordonez
--Mail: tomasbautista.o@gmail.com


LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
 
ENTITY guiaDeClase02_09_tb IS
END guiaDeClase02_09_tb;
 
ARCHITECTURE behavior OF guiaDeClase02_09_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT guiaDeClase02_09
    PORT(
         clk : IN  std_logic;
         rst : IN  std_logic;
         ena : IN  std_logic;
         q : OUT  std_logic_vector(3 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal rst : std_logic := '0';
   signal ena : std_logic := '0';

 	--Outputs
   signal q : std_logic_vector(3 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: guiaDeClase02_09 PORT MAP (
          clk => clk,
          rst => rst,
          ena => ena,
          q => q
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
		rst <= '0';
		ena <= '1';
		
      wait for clk_period*10;
		rst <= '0';
		ena <= '0';
		
		wait until Falling_Edge(clk);
		rst <= '1';
		
		wait until Falling_Edge(clk);
		rst <= '0';
		ena <= '1';
      -- insert stimulus here 

      wait;
   end process;

END;
