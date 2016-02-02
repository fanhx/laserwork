----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:36:56 02/02/2016 
-- Design Name: 
-- Module Name:    cordic_module - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity cordic_module is

  PORT (
    x_in : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    y_in : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    nd : IN STD_LOGIC;
    phase_out : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
    rdy : OUT STD_LOGIC;
    clk : IN STD_LOGIC  );
end cordic_module;

architecture Behavioral of cordic_module is
	component cordic_ipcore
		  PORT (
			 x_in : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
			 y_in : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
			 nd : IN STD_LOGIC;
			 phase_out : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
			 rdy : OUT STD_LOGIC;
			 clk : IN STD_LOGIC  );
	end component;
	
begin
u1_ipcore : cordic_ipcore
	port map( x_in => x_in, 
				 y_in => y_in,	
				 nd => nd,
				 phase_out =>  phase_out,  
				 rdy => rdy,
				 clk  => clk);
				
end Behavioral;

