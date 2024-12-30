library IEEE;
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

    -- LedA = '1' uniquement lorsque A=1, B=0, C=0
    with A & B & C select
        LedA <= '1' when "100",
                 '0' when others;

    -- LedB = '1' uniquement lorsque A=0, B=1, C=0
    with A & B & C select
        LedB <= '1' when "010",
                 '0' when others;

    -- LedC = '1' uniquement lorsque A=0, B=0, C=1
    with A & B & C select
        LedC <= '1' when "001",
                 '0' when others;

end Behavioral;