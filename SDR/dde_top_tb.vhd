--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   20:54:29 03/27/2016
-- Design Name:   
-- Module Name:   E:/DDS/dde_top_tb.vhd
-- Project Name:  DDS
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: dds_top
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
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY dde_top_tb IS
END dde_top_tb;
 
ARCHITECTURE behavior OF dde_top_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT dds_top
    PORT(
         clk : IN  std_logic;
         rst_n : IN  std_logic;
         k : IN  std_logic_vector(11 downto 0);
         phase : IN  std_logic_vector(11 downto 0);
         dds_sin : OUT  std_logic_vector(7 downto 0);
         dds_cos : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal rst_n : std_logic := '0';
   signal k : std_logic_vector(11 downto 0) := (others => '0');
   signal phase : std_logic_vector(11 downto 0) := (others => '0');

 	--Outputs
   signal dds_sin : std_logic_vector(7 downto 0);
   signal dds_cos : std_logic_vector(7 downto 0);

   -- Clock period definitions
   constant clk_period : time := 20 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: dds_top PORT MAP (
          clk => clk,
          rst_n => rst_n,
          k => k,
          phase => phase,
          dds_sin => dds_sin,
          dds_cos => dds_cos
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
		rst_n <='0';
      -- hold reset state for 100 ns.
      wait for 200 ns;	
		rst_n <='1';
      wait for 10000 ms;      -- insert stimulus here 

      wait;
   end process;
	
	
	data_proc: process
   begin		
		k <="000000000100";
		phase <="000000000000";
      -- hold reset state for 100 ns.
      wait for 10000 ms;      -- insert stimulus here 

      wait;
   end process;

END;
