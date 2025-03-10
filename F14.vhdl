library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

------------------------------------------------------------------------
-- ENTITE
------------------------------------------------------------------------
entity 8BitCounter is
    port (
        Clk      : in  std_logic;                               -- Horloge
        Clr_n    : in  std_logic;                               -- Reset asynchrone actif bas
        Stop_n   : in  std_logic;                               -- Stop actif bas
        AVR      : in  std_logic;                               -- Direction : 0 = avant, 1 = arrière
        ValeurB  : in  std_logic_vector(7 downto 0);            -- Valeur de chargement externe
        ValeurS  : out std_logic_vector(7 downto 0);            -- Valeur du compteur
        Zero     : out std_logic                                -- Indique si ValeurS = 0
    );
end 8BitCounter;
------------------------------------------------------------------------
-- ARCHITECTURE
------------------------------------------------------------------------
architecture Behavioral of 8BitCounter is

    -- On peut utiliser un signal interne de type unsigned pour faciliter l'arithmétique
    signal count_reg : unsigned(7 downto 0) := (others => '0');

begin

    --------------------------------------------------------------------
    -- Process synchrone + reset asynchrone
    --------------------------------------------------------------------
    process(Clk, Clr_n)
    begin
        -- RAZ asynchrone : si Clr_n = '0', on force la valeur du compteur à 0
        if (Clr_n = '0') then
            count_reg <= (others => '0');
        
        -- Sinon, à chaque front montant d'horloge, on met à jour
        elsif rising_edge(Clk) then
            -- Si Stop_n = 0 => chargement de la valeur ValeurB
            if (Stop_n = '0') then
                count_reg <= unsigned(ValeurB);

            else
                -- Sinon, on compte en avant ou en arrière selon AVR
                if (AVR = '0') then
                    count_reg <= count_reg + 1;  -- incrémentation
                else
                    count_reg <= count_reg - 1;  -- décrémentation
                end if;
            end if;
        end if;
    end process;

    -- Sortie compteur
    ValeurS <= std_logic_vector(count_reg);

    -- Sortie Zero = 1 si le compteur vaut 0
    Zero <= '1' when (count_reg = 0) else '0';

end Behavioral;
