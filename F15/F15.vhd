library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Machine_Soufflage is
    Port (
        D : in STD_LOGIC; -- Détecteur
        CLK : in STD_LOGIC; -- Horloge
        RST : in STD_LOGIC; -- Reset
        A : out STD_LOGIC; -- Aire
        C : out STD_LOGIC_VECTOR (3 downto 0); -- Compteur
        L : out STD_LOGIC; -- Leds
        L_C : out STD_LOGIC_VECTOR (3 downto 0) -- Leds_compteur
    );
end Machine_Soufflage;

architecture Behavioral of Machine_Soufflage is
    signal counter : INTEGER range 0 to 10 := 0;
    signal state : INTEGER range 0 to 3 := 0; -- 0: Attente, 1: Détection, 2: Soufflage, 3: Arrêt
begin
    process (CLK, RST)
    begin
        if RST = '1' then
            counter <= 0;
            state <= 0;
            A <= '0';
            L <= '0';
            C <= "0000";
            L_C <= "0000";
        elsif rising_edge(CLK) then
            case state is
                -- when -> état de ma la machine
                when 0 => -- Attente de détection
                    if D = '1' then
                        state <= 1;
                    end if;
                
                when 1 => -- Début soufflage, allume les LEDs et commence le compteur
                    L <= '1';
                    A <= '1';
                    if counter < 10 then
                        counter <= counter + 1;
                        C <= CONV_STD_LOGIC_VECTOR(counter, 4);
                        L_C <= CONV_STD_LOGIC_VECTOR(counter, 4);
                    else
                        C <= "0000";
                        L_C <= "0000";
                        state <= 2;
                    end if;
                
                when 2 => -- Continue de souffler jusqu'à 10 de plus
                    if counter < 20 then
                        counter <= counter + 1;
                    else
                        state <= 3;
                    end if;
                
                when 3 => -- Arrêt
                    L <= '0';
                    A <= '0';
                    state <= 0;
                    counter <= 0;
            end case;
        end if;
    end process;
end Behavioral;
--Liste des FCT :
-- souffle
-- Affichage LED + Compteur
-- Detection
