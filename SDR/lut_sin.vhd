----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:16:50 03/27/2016 
-- Design Name: 
-- Module Name:    lut_sin - Behavioral 
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

entity lut_sin is
    Port ( a_sin : in  STD_LOGIC_VECTOR (11 downto 0);
           spo_sin : out  STD_LOGIC_VECTOR (7 downto 0));
end lut_sin;

architecture Behavioral of lut_sin is
	COMPONENT rom_sin
	  PORT (
			 a : IN STD_LOGIC_VECTOR(11 DOWNTO 0);
			 spo:  OUT STD_LOGIC_VECTOR(7 DOWNTO 0));
	END COMPONENT;

begin
U1:rom_sin
  PORT MAP (	a =>  a_sin,
					 spo =>  spo_sin);

end Behavioral;

