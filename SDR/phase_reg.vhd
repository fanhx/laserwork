----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    19:53:44 03/27/2016 
-- Design Name: 
-- Module Name:    phase_reg - Behavioral 
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
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity phase_sum is
    Port ( clk : in  STD_LOGIC;
           rst_n : in  STD_LOGIC;
           phase : in  STD_LOGIC_VECTOR (11 downto 0);
           result : in  STD_LOGIC_VECTOR (11 downto 0);
           address : out  STD_LOGIC_VECTOR (11 downto 0));
end phase_sum;

architecture Behavioral of phase_sum is

signal phase_reg:STD_LOGIC_VECTOR (11 downto 0);

begin
	process(clk,rst_n,phase,result)
		begin
		if rising_edge(clk) then
			if rst_n= '0'  then
				phase_reg <="000000000000";
				else
				phase_reg <= phase;
			end if;
		end if;
 end process;
 address <= result+phase_reg;
end Behavioral;


