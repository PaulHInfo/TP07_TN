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
-- On déclare tout d’abord la bibliothèque IEEE qui contient
-- la définition du type std_logic (entre autres).
library IEEE;s
use IEEE.STD_LOGIC_1164.ALL;

entity TP07_V1 is
    Port (
        A    : in  STD_LOGIC;
        B    : in  STD_LOGIC;
        C    : in  STD_LOGIC;
        LedA : out STD_LOGIC;
        LedB : out STD_LOGIC;
        LedC : out STD_LOGIC
    );
end TP07_V1;

architecture Behavioral of TP07_V1 is
begin

    -- LedA = 1 si A = 1 et B nor C = 1
    LedA <= '1' when (A = '1' and (B nor C) = '1') else '0';

    -- LedB = 1 si B = 1 et A nor C = 1
    LedB <= '1' when (B = '1' and (A nor C) = '1') else '0';

    -- LedC = 1 si C = 1 et B nor A = 1
    LedC <= '1' when (C = '1' and (B nor A) = '1') else '0';

end Behavioral;
