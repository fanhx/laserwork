--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   12:50:44 01/18/2016
-- Design Name:   
-- Module Name:   E:/Algorithm/cordic16_tb.vhd
-- Project Name:  Algorithm
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: CORDIC16
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
 
ENTITY cordic16_tb IS
END cordic16_tb;
 
ARCHITECTURE behavior OF cordic16_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT CORDIC16
    PORT(
			IQ_EN : IN  std_logic;
         CLOCK : IN  std_logic;
         nRESET : IN  std_logic;
			CORDIC_RDY: OUT  std_logic;
         CORDIC_X : IN  std_logic_vector(15 downto 0);
         CORDIC_Y : IN  std_logic_vector(15 downto 0);
         CORDIC_R : OUT  std_logic_vector(17 downto 0);
         CORDIC_EPS : OUT  std_logic_vector(17 downto 0);
         CORDIC_PHI : OUT  std_logic_vector(17 downto 0)
        );
    END COMPONENT;
    

   --Inputs
	signal IQ_EN : std_logic := '0';
   signal CLOCK : std_logic := '0';
   signal nRESET : std_logic := '0';
   signal CORDIC_X : std_logic_vector(15 downto 0) := (others => '0');
   signal CORDIC_Y : std_logic_vector(15 downto 0) := (others => '0');

 	--Outputs
	SIGNAL CORDIC_RDY:   std_logic;
   signal CORDIC_R : std_logic_vector(17 downto 0);
   signal CORDIC_EPS : std_logic_vector(17 downto 0);
   signal CORDIC_PHI : std_logic_vector(17 downto 0);

   -- Clock period definitions
   constant CLOCK_period : time := 20 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: CORDIC16 PORT MAP (
          IQ_EN => IQ_EN,
			 CLOCK => CLOCK,
          nRESET => nRESET,
			 CORDIC_RDY => CORDIC_RDY,
          CORDIC_X => CORDIC_X,
          CORDIC_Y => CORDIC_Y,
          CORDIC_R => CORDIC_R,
          CORDIC_EPS => CORDIC_EPS,
          CORDIC_PHI => CORDIC_PHI
        );

   -- Clock process definitions
   CLOCK_process :process
   begin
		CLOCK <= '0';
		wait for CLOCK_period/2;
		CLOCK <= '1';
		wait for CLOCK_period/2;
   end process;
 

    -- Stimulus process
   stim_proc: process
   begin	
		nRESET <='0';	
      -- hold reset state for 100 ns.
      wait for 100 ns;	
		nRESET <='1';
      wait for 100 ms;

      -- insert stimulus here 

      wait;
   end process;

	
   data_proc: process
	
	 begin
		IQ_EN <= '0';
		CORDIC_X <="ZZZZZZZZZZZZZZZZ";  
      CORDIC_Y <="ZZZZZZZZZZZZZZZZ";
		 wait for 500 ns;              --1
		 IQ_EN <= '1';		
		CORDIC_X <="0010111100111001";
      CORDIC_Y <="0010111100111001";
      wait for 500 ns;  
		IQ_EN <= '1';		--2
		CORDIC_X <="0010111100110000";
      CORDIC_Y <="0010111100111001";
		wait for 500 ns;              --3
		IQ_EN <= '0';	
		CORDIC_X <="ZZZZZZZZZZZZZZZZ";
      CORDIC_Y <="ZZZZZZZZZZZZZZZZ"; 
      -- hold reset state for 100 ns.
      wait for 500 ns;	             --4
		IQ_EN <= '1';	
		CORDIC_X <="0010111100111000";
      CORDIC_Y <="0010111100111000";	
      wait for 500 ns;               --5
		IQ_EN <= '0';	
		CORDIC_X <="ZZZZZZZZZZZZZZZZ";  
      CORDIC_Y <="ZZZZZZZZZZZZZZZZ";
		wait for 500 ns;        --6
      -- insert stimulus here 

      wait;
   end process;
	
END;


