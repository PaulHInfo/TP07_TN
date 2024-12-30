-- On déclare tout d’abord la bibliothèque IEEE qui contient
-- la définition du type std_logic (entre autres).
library IEEE;

-- On indique que l’on souhaite utiliser tous les objets
-- définis dans le package STD_LOGIC_1164. Cela permet d’utiliser
-- le type std_logic pour les signaux (0,1,'Z', etc.).
use IEEE.STD_LOGIC_1164.ALL;


-- Début de la définition de l’entité (entity)
entity TP07_V1 is
-- La section Port définit les entrées et sorties de cette entité.
    Port (
        -- Entrées (in) de type std_logic
        A    : in  STD_LOGIC;
        B    : in  STD_LOGIC;
        C    : in  STD_LOGIC;
        ¨
        -- Sorties (out) de type std_logi
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