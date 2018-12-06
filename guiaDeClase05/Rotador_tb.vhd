--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   10:06:02 12/06/2018
-- Design Name:   
-- Module Name:   /home/usr0/Escritorio/PasarAPracticasDigitales/guiaDeClase05MODIFICADA/Fuentes/Rotador_tb.vhd
-- Project Name:  guiaDeClase05
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Rotador
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
 
ENTITY Rotador_tb IS
END Rotador_tb;
 
ARCHITECTURE behavior OF Rotador_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Rotador
    PORT(
         Rot : IN  std_logic_vector(7 downto 0);
         DataIn : IN  std_logic_vector(7 downto 0);
         DataOut : OUT  std_logic_vector(7 downto 0);
         cantRot : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal Rot : std_logic_vector(7 downto 0) := (others => '0');
   signal DataIn : std_logic_vector(7 downto 0) := (others => '0');

 	--Outputs
   signal DataOut : std_logic_vector(7 downto 0);
   signal cantRot : std_logic_vector(7 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Rotador PORT MAP (
          Rot => Rot,
          DataIn => DataIn,
          DataOut => DataOut,
          cantRot => cantRot
        );
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      DataIn <= X"01";
		Rot <= X"05";
		
		wait for 100 ns;	

      DataIn <= X"01";
		Rot <= X"06";
		
		wait for 100 ns;	

      DataIn <= X"01";
		Rot <= X"04";

      wait;
   end process;

END;
