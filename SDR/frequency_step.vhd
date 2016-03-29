----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    19:51:57 03/27/2016 
-- Design Name: 
-- Module Name:    frequency_step - Behavioral 
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

entity frequency_step is
    Port ( clk : in  STD_LOGIC;
           rst_n : in  STD_LOGIC;
           k : in  STD_LOGIC_VECTOR (11 downto 0);
           result : out  STD_LOGIC_VECTOR (11 downto 0));
end frequency_step;

architecture Behavioral of frequency_step is

signal sum:STD_LOGIC_VECTOR (11 downto 0);

begin
 process(clk,rst_n,k)
	begin
	if rising_edge(clk) then
		if rst_n= '0'  then
			sum <="000000000000";
			else
			sum <= sum+k;
		end if;
	end if;
 end process;
 result<=sum;
end Behavioral;
