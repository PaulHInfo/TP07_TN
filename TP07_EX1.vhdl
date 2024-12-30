----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12/20/2024 01:56:16 PM
-- Design Name: 
-- Module Name: TP07_V1 - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
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
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity TP07_V1 is
    Port ( A : in STD_LOGIC;
           B : in STD_LOGIC;
           C : in STD_LOGIC;
           LedA : out STD_LOGIC;
           LedB : out STD_LOGIC;
           LedC : out STD_LOGIC);
end TP07_V1;

architecture Behavioral of TP07_V1 is
    
begin

LedA <= A and (B nor C); 
LedB <= B and (A nor C);
LedC <= C and (B nor A);

end Behavioral;