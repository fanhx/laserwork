--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   17:16:16 02/02/2016
-- Design Name:   
-- Module Name:   F:/laserwork/WorkinVirtex7/cordic_tb.vhd
-- Project Name:  WorkinVirtex7
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: cordic_module
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
 
ENTITY cordic_tb IS
END cordic_tb;
 
ARCHITECTURE behavior OF cordic_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT cordic_module
    PORT(
         x_in : IN  std_logic_vector(15 downto 0);
         y_in : IN  std_logic_vector(15 downto 0);
         nd : IN  std_logic;
         phase_out : OUT  std_logic_vector(15 downto 0);
         rdy : OUT  std_logic;
         clk : IN  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal x_in : std_logic_vector(15 downto 0) := (others => '0');
   signal y_in : std_logic_vector(15 downto 0) := (others => '0');
   signal nd : std_logic := '0';
   signal clk : std_logic := '0';

 	--Outputs
   signal phase_out : std_logic_vector(15 downto 0);
   signal rdy : std_logic;

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: cordic_module PORT MAP (
          x_in => x_in,
          y_in => y_in,
          nd => nd,
          phase_out => phase_out,
          rdy => rdy,
          clk => clk
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 


 nd_proc: process
	
	
   begin
		nd <='0';
		wait for 200 ns;    --ZZ
		nd <='1';
		wait for 20 ns;      
		nd <='0';
		wait for 180 ns;    --0
		nd <='1';
		wait for 20 ns;      
		nd <='0';
		wait for 180 ns;    --45
		nd <='1';
		wait for 20 ns;      
		nd <='0';
		wait for 180 ns;    --90
		nd <='1';
		wait for 20 ns;      
		nd <='0';
		wait for 180 ns;    --135
		nd <='1';
		wait for 20 ns;      
		nd <='0';
		wait for 180 ns;    --180
		nd <='1';
		wait for 20 ns;      
		nd <='0';
		wait for 180 ns;    ---45
		nd <='1';
		wait for 20 ns;      
		nd <='0';
		wait for 180 ns;    ---90
		nd <='1';
		wait for 20 ns;      
		nd <='0';
		wait for 180 ns;    ---135

      wait;                  
   end process;	
	
   data_proc: process
	
	 begin
		x_in <="ZZZZZZZZZZZZZZZZ";  
      y_in <="ZZZZZZZZZZZZZZZZ";
		wait for 200 ns;      
		x_in <="0010111100110000";     --0業
      y_in <="0000000000000000";
		wait for 200 ns;             
		x_in <="0010111100111001";     --45業
      y_in <="0010111100111001";
      wait for 200 ns;               
		x_in <="0000000000000000";     --90業
      y_in <="0010111100110000";
      wait for 200 ns;	            
		x_in <="0010111100111000";     --135業  
      y_in <="1101000011001000";	
      wait for 200 ns;                
		x_in <="1101000011001000";     --180業  
      y_in <="0000000000000000";	
      wait for 200 ns;                
		x_in <="0010111100111001";     ---45業
      y_in <="1101000011000111";
      wait for 200 ns;   
		x_in <="0000000000000000";     ---90業
      y_in <="1010111100110000";	
      wait for 200 ns;	            
		x_in <="1101000011001000";     ---135業  
      y_in <="1101000011001000";	
      wait for 200 ns;       		
      -- insert stimulus here 

      wait;
   end process;


END;
