----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:18:39 03/27/2016 
-- Design Name: 
-- Module Name:    lut_cos - Behavioral 
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

entity lut_cos is
    Port ( a_cos : in  STD_LOGIC_VECTOR (11 downto 0);
           spo_cos : out  STD_LOGIC_VECTOR (7 downto 0));
end lut_cos;

architecture Behavioral of lut_cos is
COMPONENT rom_cos
    Port ( a  : in  STD_LOGIC_VECTOR (11 downto 0);
           spo: out  STD_LOGIC_VECTOR (7 downto 0));
END COMPONENT;

begin
U1:rom_cos
  PORT MAP (
					a =>  a_cos,
					 spo =>  spo_cos
				  );

end Behavioral;

