--Guia 2, test bench ejercicio 8
--Alumno: Tomás Bautista Ordóñez
--Legajo: 1595659
--GitLab User: toordonez
--Mail: tomasbautista.o@gmail.com


LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY guiaDeClase02_08_tb IS
END guiaDeClase02_08_tb;
 
ARCHITECTURE behavior OF guiaDeClase02_08_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT guiaDeClase02_08
    PORT(
         clk : IN  std_logic;
         rst : IN  std_logic;
         ena : IN  std_logic;
         dir : IN  std_logic;
         dr : IN  std_logic;
         dl : IN  std_logic;
         d : IN  std_logic_vector(3 downto 0);
         q : OUT  std_logic_vector(3 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal rst : std_logic := '0';
   signal ena : std_logic := '0';
   signal dir : std_logic := '0';
   signal dr : std_logic := '0';
   signal dl : std_logic := '0';
   signal d : std_logic_vector(3 downto 0) := (others => '0');

 	--Outputs
   signal q : std_logic_vector(3 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: guiaDeClase02_08 PORT MAP (
          clk => clk,
          rst => rst,
          ena => ena,
          dir => dir,
          dr => dr,
          dl => dl,
          d => d,
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
      
		rst <= '0';
		ena <= '1';
		dir <= '0';
		d <= "1111";
      wait for 100 ns;
		
		wait until Falling_Edge(clk);
		--rst <= '1';
		wait until Falling_Edge(clk);
		rst <= '0';
		Dr <= '0';
		wait until Falling_Edge(clk);
		Dr <= '1';
		wait until Falling_Edge(clk);
		Dr <= '0';
		wait until Falling_Edge(clk);
		wait until Falling_Edge(clk);
		Dl <= '1';
		Dir <= '1';
		wait until Falling_Edge(clk);
		Dl <= '0';
		
      wait;
   end process;

END;
