library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity Detecteur_Mains is
    Port (
        D : in  STD_LOGIC;  -- Détecteur de mains
        CLK : in  STD_LOGIC;  -- Horloge
        RST : in  STD_LOGIC;  -- Reset
        A : out STD_LOGIC;   -- Aire
        C : out STD_LOGIC_VECTOR(3 downto 0);  -- Compteur (4 bits)
        L : out STD_LOGIC   -- Leds
    );
end Detecteur_Mains;

architecture Behavioral of Detecteur_Mains is
    signal count : STD_LOGIC_VECTOR(3 downto 0) := "0000";  -- Compteur interne
    signal blowing : STD_LOGIC := '0';  -- État de soufflage
    signal led_on : STD_LOGIC := '0';   -- État des Leds
begin

    process(CLK, RST)
    begin
        if RST = '1' then
            count <= "0000";
            blowing <= '0';
            led_on <= '0';
            A <= '0';
            L <= '0';
            C <= "0000";
        elsif rising_edge(CLK) then
            if D = '1' then  -- Détection de mains
                if count < "1010" then  -- Si le compteur est inférieur à 10
                    count <= count + 1;
                    blowing <= '1';
                    led_on <= '1';
                    A <= '1';
                    L <= '1';
                    C <= count;
                else
                    if count = "1010" then  -- Si le compteur atteint 10
                        C <= "0000";  -- Masquer le compteur
                        blowing <= '1';
                        led_on <= '1';
                        A <= '1';
                        L <= '1';
                    elsif count = "1011" then  -- Si le compteur atteint 11
                        blowing <= '0';
                        led_on <= '0';
                        A <= '0';
                        L <= '0';
                        count <= "0000";  -- Réinitialiser le compteur
                    end if;
                end if;
            else
                blowing <= '0';
                led_on <= '0';
                A <= '0';
                L <= '0';
                C <= "0000";
            end if;
        end if;
    end process;

end Behavioral;