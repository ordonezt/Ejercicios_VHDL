--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   22:46:43 11/07/2018
-- Design Name:   
-- Module Name:   /home/usr0/Escritorio/PasarAPracticasDigitales/guiaDeClase04/Fuentes/guiaDeClase04_01_tb.vhd
-- Project Name:  guiaDeClase04
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: myUartTx
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY guiaDeClase04_01_tb IS
END guiaDeClase04_01_tb;
 
ARCHITECTURE behavior OF guiaDeClase04_01_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT myUartTx
    PORT(
         clk : IN  std_logic;
         rst : IN  std_logic;
         dataWr : IN  std_logic;
         dataTx : IN  std_logic_vector(7 downto 0);
         ready : OUT  std_logic;
         tx : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal rst : std_logic := '0';
   signal dataWr : std_logic := '0';
   signal dataTx : std_logic_vector(7 downto 0) := (others => '0');

 	--Outputs
   signal ready : std_logic;
   signal tx : std_logic;

   -- Clock period definitions
   constant clk_period : time := 20 ns; --50 MHz
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: myUartTx PORT MAP (
          clk => clk,
          rst => rst,
          dataWr => dataWr,
          dataTx => dataTx,
          ready => ready,
          tx => tx
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
      
		wait until Falling_Edge(clk);
		dataTx <= "11011100";
		
		wait until Falling_Edge(clk);
		wait until Falling_Edge(clk);
		dataWr <= '1';
		
		wait until Falling_Edge(clk);
		dataWr <= '0';
		
		wait for 100000*clk_period;
		dataTx <= "10001011";
		wait until Falling_Edge(clk);
		dataWr <= '1';
		wait until Falling_Edge(clk);
		dataWr <= '0';
		
      wait;
   end process;

END;
