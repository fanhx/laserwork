----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:32:40 03/27/2016 
-- Design Name: 
-- Module Name:    dds_top - Behavioral 
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

entity dds_top is
    Port ( clk : in  STD_LOGIC;
           rst_n : in  STD_LOGIC;
           k : in  STD_LOGIC_VECTOR (11 downto 0);
			  phase : in  STD_LOGIC_VECTOR (11 downto 0);
           dds_sin : out  STD_LOGIC_VECTOR (7 downto 0);
			  dds_cos : out  STD_LOGIC_VECTOR (7 downto 0));
end dds_top;

architecture Behavioral of dds_top is

   --频率控制字
	COMPONENT frequency_step
		PORT (
					 clk   : IN STD_LOGIC;
					 rst_n : IN STD_LOGIC;
					 k     : IN STD_LOGIC_VECTOR(11 DOWNTO 0);
					 result: OUT STD_LOGIC_VECTOR(11 DOWNTO 0));
		END COMPONENT;
   --相位字
	COMPONENT phase_sum     
	  PORT (
			 clk   : IN STD_LOGIC;
			 rst_n : IN STD_LOGIC;
			 phase     : IN STD_LOGIC_VECTOR(11 DOWNTO 0);
			 result: IN STD_LOGIC_VECTOR(11 DOWNTO 0);
			 address: OUT STD_LOGIC_VECTOR(11 DOWNTO 0));
	END COMPONENT;
	--正弦查找表
	COMPONENT lut_sin
	  PORT (
			 a_sin: IN STD_LOGIC_VECTOR(11 DOWNTO 0);
			 spo_sin: OUT STD_LOGIC_VECTOR(7 DOWNTO 0));
	END COMPONENT;
	 --余弦查找表
	COMPONENT lut_cos
	  PORT (
			 a_cos: IN STD_LOGIC_VECTOR(11 DOWNTO 0);
			 spo_cos: OUT STD_LOGIC_VECTOR(7 DOWNTO 0));
	END COMPONENT;
	
signal result_wire  :STD_LOGIC_VECTOR(11 DOWNTO 0);
signal address_wire :STD_LOGIC_VECTOR(11 DOWNTO 0);
	
begin

U1:frequency_step
  PORT MAP (
					 clk    =>  clk,
					 rst_n  =>  rst_n,
					 k      =>  k,
					 result =>  result_wire
				  );
U2 : phase_sum
  PORT MAP (
		    clk    =>  clk,
			 rst_n  =>  rst_n,
			 phase  =>  phase,
			 result => result_wire,
			 address=> address_wire);
			 
u3:  lut_sin
  PORT MAP  (
			 a_sin      => address_wire,
			 spo_sin    => dds_sin );

u4:  lut_cos
  PORT MAP  (
			 a_cos      => address_wire,
			 spo_cos    => dds_cos );

end Behavioral;


