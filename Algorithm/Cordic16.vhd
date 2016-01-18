----------------------------------------------------------------------------------
-- Company: CAS
-- Engineer: 
-- 
-- Create Date:    22:38:26 01/10/2016 
-- Design Name: 
-- Module Name:    cordic16 - Behavioral 
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
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;
USE ieee.std_logic_arith.all;


ENTITY CORDIC16 IS

	PORT
	(	
		CLOCK,nRESET				: IN STD_LOGIC;
		CORDIC_X,CORDIC_Y			: IN STD_LOGIC_VECTOR(15 DOWNTO 0);
		CORDIC_RDY					: OUT STD_LOGIC;
		CORDIC_R,CORDIC_EPS		: OUT STD_LOGIC_VECTOR(17 DOWNTO 0);
		CORDIC_PHI					: OUT STD_LOGIC_VECTOR(17 DOWNTO 0)
	);
	
END CORDIC16;

ARCHITECTURE a OF CORDIC16 IS

	SIGNAL X0,Y0,Z0						: STD_LOGIC_VECTOR(17 DOWNTO 0);
	SIGNAL X1,Y1,Z1						: STD_LOGIC_VECTOR(17 DOWNTO 0);
	SIGNAL X2,Y2,Z2						: STD_LOGIC_VECTOR(17 DOWNTO 0);
	SIGNAL X3,Y3,Z3    				   : STD_LOGIC_VECTOR(17 DOWNTO 0);
	SIGNAL X4,Y4,Z4						: STD_LOGIC_VECTOR(17 DOWNTO 0);
	SIGNAL X5,Y5,Z5                     : STD_LOGIC_VECTOR(17 DOWNTO 0);
	SIGNAL X6,Y6,Z6                     : STD_LOGIC_VECTOR(17 DOWNTO 0);
	SIGNAL X7,Y7,Z7                     : STD_LOGIC_VECTOR(17 DOWNTO 0);
	SIGNAL X8,Y8,Z8						: STD_LOGIC_VECTOR(17 DOWNTO 0);
	SIGNAL X9,Y9,Z9                     : STD_LOGIC_VECTOR(17 DOWNTO 0);
	SIGNAL X10,Y10,Z10                  : STD_LOGIC_VECTOR(17 DOWNTO 0);
	SIGNAL X11,Y11,Z11                  : STD_LOGIC_VECTOR(17 DOWNTO 0);
	SIGNAL X12,Y12,Z12					: STD_LOGIC_VECTOR(17 DOWNTO 0); 
	SIGNAL X13,Y13,Z13                  : STD_LOGIC_VECTOR(17 DOWNTO 0);
	SIGNAL X14,Y14,Z14                  : STD_LOGIC_VECTOR(17 DOWNTO 0);
	SIGNAL X15,Y15,Z15					: STD_LOGIC_VECTOR(17 DOWNTO 0);
	
BEGIN

MAIN_PROC : PROCESS(CLOCK,nRESET)

BEGIN

	IF nRESET = '0' THEN
		
		CORDIC_RDY<='0';
		CORDIC_R <= "000000000000000000";
		CORDIC_EPS <= "000000000000000000";
		CORDIC_PHI <= "000000000000000000";
		X0 <= (OTHERS => '0');
		X1 <= (OTHERS => '0');
		X2 <= (OTHERS => '0');
		X3 <= (OTHERS => '0');
		X4 <= (OTHERS => '0');
		X5 <= (OTHERS => '0');
		X6 <= (OTHERS => '0');
		X7 <= (OTHERS => '0');
		X8 <= (OTHERS => '0');
		X9 <= (OTHERS => '0');
		X10 <= (OTHERS => '0');
		X11 <= (OTHERS => '0');
		X12 <= (OTHERS => '0');
		X13 <= (OTHERS => '0');
		X14 <= (OTHERS => '0');
		X15 <= (OTHERS => '0');
		Y0 <= (OTHERS => '0');
		Y1 <= (OTHERS => '0');
		Y2 <= (OTHERS => '0');
		Y3 <= (OTHERS => '0');
		Y4 <= (OTHERS => '0');
		Y5 <= (OTHERS => '0');
		Y6 <= (OTHERS => '0');
		Y7 <= (OTHERS => '0');
		Y8 <= (OTHERS => '0');
		Y9 <= (OTHERS => '0');
		Y10 <= (OTHERS => '0');
		Y11 <= (OTHERS => '0');
		Y12 <= (OTHERS => '0');
		Y13 <= (OTHERS => '0');
		Y14 <= (OTHERS => '0');
		Y15 <= (OTHERS => '0');
		Z0 <= (OTHERS => '0');
		Z1 <= (OTHERS => '0');
		Z2 <= (OTHERS => '0');
		Z3 <= (OTHERS => '0');
		Z4 <= (OTHERS => '0');
		Z5 <= (OTHERS => '0');
		Z6 <= (OTHERS => '0');
		Z7 <= (OTHERS => '0');
		Z8 <= (OTHERS => '0');
		Z9 <= (OTHERS => '0');
		Z10 <= (OTHERS => '0');
		Z11 <= (OTHERS => '0');
		Z12 <= (OTHERS => '0');
		Z13 <= (OTHERS => '0');
		Z14 <= (OTHERS => '0');
		Z15 <= (OTHERS => '0');
	ELSIF CLOCK'EVENT AND CLOCK = '1' THEN
		
		--FOR THE ROTATE INITIAL
--		IF CORDIC_X = "0000000000000000" AND CORDIC_Y = "0000000000000000" THEN
		
--			X0 <= "000000000000000000";
--			Y0 <= "000000000000000000";
--			Z0 <= "101110001111101110";

		--FOR THE ROTATE INITIAL
		IF CORDIC_X(15) = '0' THEN
		
			X0 <= CORDIC_X(15) & CORDIC_X(15) & CORDIC_X;
			Y0 <= CORDIC_Y(15) & CORDIC_Y(15) & CORDIC_Y;
			Z0 <= "000000000000000000";
			
		ELSIF CORDIC_Y(15) = '0' THEN
		
			X0 <= CORDIC_Y(15) & CORDIC_Y(15) & CORDIC_Y;
			Y0 <= "000000000000000000" - (CORDIC_X(15) & CORDIC_X(15) & CORDIC_X);
			Z0 <= "001111111111111111";
			
		ELSE
		
			X0 <= "000000000000000000" - (CORDIC_Y(15) & CORDIC_Y(15) & CORDIC_Y);
			Y0 <= CORDIC_X(15) & CORDIC_X(15) & CORDIC_X;
			Z0 <= "110000000000000000";
			
		END IF;
			
		--FOR THE 1TH ROTATE
		IF Y0(17) = '0' THEN
		
			X1 <= X0 + Y0;
			Y1 <= Y0 - X0;
			Z1 <= Z0 + "000111111111111111";
			
		ELSE
		
			X1 <= X0 - Y0;
			Y1 <= Y0 + X0;
			Z1 <= Z0 - "000111111111111111";
			
		END IF;
		
		--FOR THE 2TH ROTATE
		IF Y1(17) = '0' THEN
		
			X2 <= X1 + (Y1(17) & Y1(17 DOWNTO 1));
			Y2 <= Y1 - (X1(17) & X1(17 DOWNTO 1));
			Z2 <= Z1 + "000100101110001111";
			
		ELSE
		
			X2 <= X1 - (Y1(17) & Y1(17 DOWNTO 1));
			Y2 <= Y1 + (X1(17) & X1(17 DOWNTO 1));
			Z2 <= Z1 - "000100101110001111";
			
		END IF;
		
		--FOR THE 3TH ROTATE
		IF Y2(17) = '0' THEN
		
			X3 <= X2 + (Y2(17) & Y2(17) & Y2(17 DOWNTO 2));
			Y3 <= Y2 - (X2(17) & X2(17) & X2(17 DOWNTO 2));
			Z3 <= Z2 + "000010011111101100";
			
		ELSE
		
			X3 <= X2 - (Y2(17) & Y2(17) & Y2(17 DOWNTO 2));
			Y3 <= Y2 + (X2(17) & X2(17) & X2(17 DOWNTO 2));
			Z3 <= Z2 - "000010011111101100";
			
		END IF;
		
		--FOR THE 4TH ROTATE
		IF Y3(17) = '0' THEN
		
			X4 <= X3 + (Y3(17) & Y3(17) & Y3(17) & Y3(17 DOWNTO 3));
			Y4 <= Y3 - (X3(17) & X3(17) & X3(17) & X3(17 DOWNTO 3));
			Z4 <= Z3 + "000001010001000100";
			
		ELSE
		
			X4 <= X3 - (Y3(17) & Y3(17) & Y3(17) & Y3(17 DOWNTO 3));
			Y4 <= Y3 + (X3(17) & X3(17) & X3(17) & X3(17 DOWNTO 3));
			Z4 <= Z3 - "000001010001000100";
			
		END IF;
		
		--FOR THE 5TH ROTATE
		IF Y4(17) = '0' THEN
		
			X5 <= X4 + (Y4(17) & Y4(17) & Y4(17) & Y4(17) & Y4(17 DOWNTO 4));
			Y5 <= Y4 - (X4(17) & X4(17) & X4(17) & X4(17) & X4(17 DOWNTO 4));
			Z5 <= Z4 + "000000101000101100";
			
		ELSE
		
			X5 <= X4 - (Y4(17) & Y4(17) & Y4(17) & Y4(17) & Y4(17 DOWNTO 4));
			Y5 <= Y4 + (X4(17) & X4(17) & X4(17) & X4(17) & X4(17 DOWNTO 4));
			Z5 <= Z4 - "000000101000101100";
			
		END IF;
		
		--FOR THE 6TH ROTATE
		IF Y5(17) = '0' THEN
		
			X6 <= X5 + (Y5(17) & Y5(17) & Y5(17) & Y5(17) & Y5(17) & Y5(17 DOWNTO 5));
			Y6 <= Y5 - (X5(17) & X5(17) & X5(17) & X5(17) & X5(17) & X5(17 DOWNTO 5));
			Z6 <= Z5 + "000000010100010111";
			
		ELSE
		
			X6 <= X5 - (Y5(17) & Y5(17) & Y5(17) & Y5(17) & Y5(17) & Y5(17 DOWNTO 5));
			Y6 <= Y5 + (X5(17) & X5(17) & X5(17) & X5(17) & X5(17) & X5(17 DOWNTO 5));
			Z6 <= Z5 - "000000010100010111";
			
		END IF;
		
		--FOR THE 7TH ROTATE
		IF Y6(17) = '0' THEN
		
			X7 <= X6 + (Y6(17) & Y6(17) & Y6(17) & Y6(17) & Y6(17) & Y6(17) & Y6(17 DOWNTO 6));
			Y7 <= Y6 - (X6(17) & X6(17) & X6(17) & X6(17) & X6(17) & X6(17) & X6(17 DOWNTO 6));
			Z7 <= Z6 + "000000001010001011";
			
		ELSE
		
			X7 <= X6 - (Y6(17) & Y6(17) & Y6(17) & Y6(17) & Y6(17) & Y6(17) & Y6(17 DOWNTO 6));
			Y7 <= Y6 + (X6(17) & X6(17) & X6(17) & X6(17) & X6(17) & X6(17) & X6(17 DOWNTO 6));
			Z7 <= Z6 - "000000001010001011";
			
		END IF;

		--FOR THE 8TH ROTATE
		IF Y7(17) = '0' THEN
		
			X8 <= X7 + (Y7(17) & Y7(17) & Y7(17) & Y7(17) & Y7(17) & Y7(17) & Y7(17) & Y7(17 DOWNTO 7));
			Y8 <= Y7 - (X7(17) & X7(17) & X7(17) & X7(17) & X7(17) & X7(17) & X7(17) & X7(17 DOWNTO 7));
			Z8 <= Z7 + "000000000101000101";
			
		ELSE
		
			X8 <= X7 - (Y7(17) & Y7(17) & Y7(17) & Y7(17) & Y7(17) & Y7(17) & Y7(17) & Y7(17 DOWNTO 7));
			Y8 <= Y7 + (X7(17) & X7(17) & X7(17) & X7(17) & X7(17) & X7(17) & X7(17) & X7(17 DOWNTO 7));
			Z8 <= Z7 - "000000000101000101";
			
		END IF;
		
		--FOR THE 9TH ROTATE
		IF Y8(17) = '0' THEN
		
			X9 <= X8 + (Y8(17) & Y8(17) & Y8(17) & Y8(17) & Y8(17) & Y8(17) & Y8(17) & Y8(17) & 
						Y8(17 DOWNTO 8));
			Y9 <= Y8 - (X8(17) & X8(17) & X8(17) & X8(17) & X8(17) & X8(17) & X8(17) & X8(17) & 
						X8(17 DOWNTO 8));
			Z9 <= Z8 + "000000000010100010";
			
		ELSE
		
			X9 <= X8 - (Y8(17) & Y8(17) & Y8(17) & Y8(17) & Y8(17) & Y8(17) & Y8(17) & Y8(17) & 
						Y8(17 DOWNTO 8));
			Y9 <= Y8 + (X8(17) & X8(17) & X8(17) & X8(17) & X8(17) & X8(17) & X8(17) & X8(17) & 
						X8(17 DOWNTO 8));
			Z9 <= Z8 - "000000000010100010";
			
		END IF;
		
		--FOR THE 10TH ROTATE
		IF Y9(17) = '0' THEN
		
			X10 <= X9 + (Y9(17) & Y9(17) & Y9(17) & Y9(17) & Y9(17) & Y9(17) & Y9(17) & Y9(17) & 
						 Y9(17) & Y9(17 DOWNTO 9));
			Y10 <= Y9 - (X9(17) & X9(17) & X9(17) & X9(17) & X9(17) & X9(17) & X9(17) & X9(17) & 
						 X9(17) & X9(17 DOWNTO 9));
			Z10 <= Z9 + "000000000001010001";
			
		ELSE
		
			X10 <= X9 - (Y9(17) & Y9(17) & Y9(17) & Y9(17) & Y9(17) & Y9(17) & Y9(17) & Y9(17) & 
						 Y9(17) & Y9(17 DOWNTO 9));
			Y10 <= Y9 + (X9(17) & X9(17) & X9(17) & X9(17) & X9(17) & X9(17) & X9(17) & X9(17) & 
						 X9(17) & X9(17 DOWNTO 9));
			Z10 <= Z9 - "000000000001010001";
			
		END IF;
		
		--FOR THE 11TH ROTATE
		IF Y10(17) = '0' THEN
		
			X11 <= X10 + (Y10(17) & Y10(17) & Y10(17) & Y10(17) & Y10(17) & Y10(17) & Y10(17) & Y10(17) & 
						  Y10(17) & Y10(17) & Y10(17 DOWNTO 10));
			Y11 <= Y10 - (X10(17) & X10(17) & X10(17) & X10(17) & X10(17) & X10(17) & X10(17) & X10(17) & 
						  X10(17) & X10(17) & X10(17 DOWNTO 10));
			Z11 <= Z10 + "000000000000101000";
			
		ELSE
		
			X11 <= X10 - (Y10(17) & Y10(17) & Y10(17) & Y10(17) & Y10(17) & Y10(17) & Y10(17) & Y10(17) & 
						  Y10(17) & Y10(17) & Y10(17 DOWNTO 10));
			Y11 <= Y10 + (X10(17) & X10(17) & X10(17) & X10(17) & X10(17) & X10(17) & X10(17) & X10(17) & 
						  X10(17) & X10(17) & X10(17 DOWNTO 10));
			Z11 <= Z10 - "000000000000101000";
			
		END IF;
		
		--FOR THE 12TH ROTATE
		IF Y11(17) = '0' THEN
		
			X12 <= X11 + (Y11(17) & Y11(17) & Y11(17) & Y11(17) & Y11(17) & Y11(17) & Y11(17) & Y11(17) & 
						  Y11(17) & Y11(17) & Y11(17) & Y11(17 DOWNTO 11));
			Y12 <= Y11 - (X11(17) & X11(17) & X11(17) & X11(17) & X11(17) & X11(17) & X11(17) & X11(17) & 
						  X11(17) & X11(17) & X11(17) & X11(17 DOWNTO 11));
			Z12 <= Z11 + "000000000000010100";
			
		ELSE
		
			X12 <= X11 - (Y11(17) & Y11(17) & Y11(17) & Y11(17) & Y11(17) & Y11(17) & Y11(17) & Y11(17) & 
						  Y11(17) & Y11(17) & Y11(17) & Y11(17 DOWNTO 11));
			Y12 <= Y11 + (X11(17) & X11(17) & X11(17) & X11(17) & X11(17) & X11(17) & X11(17) & X11(17) & 
						  X11(17) & X11(17) & X11(17) & X11(17 DOWNTO 11));
			Z12 <= Z11 - "000000000000010100";
			
		END IF;
		
		--FOR THE 13TH ROTATE
		IF Y12(17) = '0' THEN
		
			X13 <= X12 + (Y12(17) & Y12(17) & Y12(17) & Y12(17) & Y12(17) & Y12(17) & Y12(17) & Y12(17) & 
						  Y12(17) & Y12(17) & Y12(17) & Y12(17) & Y12(17 DOWNTO 12));
			Y13 <= Y12 - (X12(17) & X12(17) & X12(17) & X12(17) & X12(17) & X12(17) & X12(17) & X12(17) & 
						  X12(17) & X12(17) & X12(17) & X12(17) & X12(17 DOWNTO 12));
			Z13 <= Z12 + "000000000000001010";
			
		ELSE
		
			X13 <= X12 - (Y12(17) & Y12(17) & Y12(17) & Y12(17) & Y12(17) & Y12(17) & Y12(17) & Y12(17) & 
						  Y12(17) & Y12(17) & Y12(17) & Y12(17) & Y12(17 DOWNTO 12));
			Y13 <= Y12 + (X12(17) & X12(17) & X12(17) & X12(17) & X12(17) & X12(17) & X12(17) & X12(17) & 
						  X12(17) & X12(17) & X12(17) & X12(17) & X12(17 DOWNTO 12));
			Z13 <= Z12 - "000000000000001010";
			
		END IF;
		
		--FOR THE 14TH ROTATE
		IF Y13(17) = '0' THEN
		
			X14 <= X13 + (Y13(17) & Y13(17) & Y13(17) & Y13(17) & Y13(17) & Y13(17) & Y13(17) & Y13(17) & 
						  Y13(17) & Y13(17) & Y13(17) & Y13(17) & Y13(17) & Y13(17 DOWNTO 13));
			Y14 <= Y13 - (X13(17) & X13(17) & X13(17) & X13(17) & X13(17) & X13(17) & X13(17) & X13(17) & 
						  X13(17) & X13(17) & X13(17) & X13(17) & X13(17) & X13(17 DOWNTO 13));
			Z14 <= Z13 + "000000000000000101";
			
		ELSE
		
			X14 <= X13 - (Y13(17) & Y13(17) & Y13(17) & Y13(17) & Y13(17) & Y13(17) & Y13(17) & Y13(17) & 
						  Y13(17) & Y13(17) & Y13(17) & Y13(17) & Y13(17) & Y13(17 DOWNTO 13));
			Y14 <= Y13 + (X13(17) & X13(17) & X13(17) & X13(17) & X13(17) & X13(17) & X13(17) & X13(17) & 
						  X13(17) & X13(17) & X13(17) & X13(17) & X13(17) & X13(17 DOWNTO 13));
			Z14 <= Z13 - "000000000000000101";
			
		END IF;
		
		--FOR THE 15TH ROTATE
		IF Y14(17) = '0' THEN
		
			X15 <= X14 + (Y14(17) & Y14(17) & Y14(17) & Y14(17) & Y14(17) & Y14(17) & Y14(17) & Y14(17) & 
						  Y14(17) & Y14(17) & Y14(17) & Y14(17) & Y14(17) & Y14(17) & Y14(17 DOWNTO 14));
			Y15 <= Y14 - (X14(17) & X14(17) & X14(17) & X14(17) & X14(17) & X14(17) & X14(17) & X14(17) & 
						  X14(17) & X14(17) & X14(17) & X14(17) & X14(17) & X14(17) & X14(17 DOWNTO 14));
			Z15 <= Z14 + "000000000000000010";
			
		ELSE
		
			X15 <= X14 - (Y14(17) & Y14(17) & Y14(17) & Y14(17) & Y14(17) & Y14(17) & Y14(17) & Y14(17) & 
						  Y14(17) & Y14(17) & Y14(17) & Y14(17) & Y14(17) & Y14(17) & Y14(17 DOWNTO 14));
			Y15 <= Y14 + (X14(17) & X14(17) & X14(17) & X14(17) & X14(17) & X14(17) & X14(17) & X14(17) & 
						  X14(17) & X14(17) & X14(17) & X14(17) & X14(17) & X14(17) & X14(17 DOWNTO 14));
			Z15 <= Z14 - "000000000000000010";
			
		END IF;
		
		--FOR THE 16TH ROTATE
		IF Y15(17) = '0' THEN
		
			CORDIC_R <= X15 + (Y15(17) & Y15(17) & Y15(17) & Y15(17) & Y15(17) & Y15(17) & Y15(17) & Y15(17) & 
						  	   Y15(17) & Y15(17) & Y15(17) & Y15(17) & Y15(17) & Y15(17) & Y15(17) &
							   Y15(17 DOWNTO 15));
			CORDIC_EPS <= Y15 - (X15(17) & X15(17) & X15(17) & X15(17) & X15(17) & X15(17) & X15(17) & X15(17) & 
						         X15(17) & X15(17) & X15(17) & X15(17) & X15(17) & X15(17) & X15(17) &
								 X15(17 DOWNTO 15));
			CORDIC_PHI <= Z15 + "000000000000000001";
			
		ELSE
		
			CORDIC_R <= X15 - (Y15(17) & Y15(17) & Y15(17) & Y15(17) & Y15(17) & Y15(17) & Y15(17) & Y15(17) & 
						  	   Y15(17) & Y15(17) & Y15(17) & Y15(17) & Y15(17) & Y15(17) & Y15(17) &
							   Y15(17 DOWNTO 15));
			CORDIC_EPS <= Y15 + (X15(17) & X15(17) & X15(17) & X15(17) & X15(17) & X15(17) & X15(17) & X15(17) & 
						         X15(17) & X15(17) & X15(17) & X15(17) & X15(17) & X15(17) & X15(17) &
								 X15(17 DOWNTO 15));
			CORDIC_PHI <= Z15 - "000000000000000001";
			
		END IF;
		CORDIC_RDY<= '1';
	END IF;
	
END PROCESS MAIN_PROC;


END a;



