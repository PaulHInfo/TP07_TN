-- Déclaration d'un package contenant des constantes et des types personnalisés
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

package MyPackage is
    constant CLK_FREQ : integer := 50_000_000; -- Fréquence d'horloge en Hz
    type StateType is (IDLE, WORK, DONE);     -- Exemple d'un type énuméré
end MyPackage;

-- Inclusion du package
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use work.MyPackage.ALL;

-- Définition d'une entité
entity TopLevel is
    Port (
        clk     : in  STD_LOGIC;
        reset   : in  STD_LOGIC;
        start   : in  STD_LOGIC;
        result  : out STD_LOGIC_VECTOR(7 downto 0)
    );
end TopLevel;

-- Architecture de l'entité
architecture Behavioral of TopLevel is

    -- Déclaration de signaux internes
    signal current_state, next_state : StateType := IDLE;
    signal counter : unsigned(7 downto 0) := (others => '0');

begin

    -- Exemple de processus séquentiel pour la machine d'état
    process (clk, reset)
    begin
        if reset = '1' then
            current_state <= IDLE;
            counter <= (others => '0');
        elsif rising_edge(clk) then
            current_state <= next_state;
            if current_state = WORK then
                counter <= counter + 1;
            end if;
        end if;
    end process;

    -- Logique combinatoire pour la transition d'état
    process (current_state, start)
    begin
        case current_state is
            when IDLE =>
                if start = '1' then
                    next_state <= WORK;
                else
                    next_state <= IDLE;
                end if;
            when WORK =>
                if counter = 255 then
                    next_state <= DONE;
                else
                    next_state <= WORK;
                end if;
            when DONE =>
                next_state <= IDLE;
            when others =>
                next_state <= IDLE;
        end case;
    end process;

    -- Sortie basée sur l'état
    result <= std_logic_vector(counter) when current_state = WORK else
              (others => '0');

end Behavioral;
