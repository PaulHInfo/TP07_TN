library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity Hexa_To_ASCII is
    Port ( HEX : in  STD_LOGIC_VECTOR (3 downto 0);
           ASCII : out  STD_LOGIC_VECTOR (6 downto 0));
end Hexa_To_ASCII;
architecture Behavioral of Hexa_To_ASCII is
    begin
        with HEX select
            ASCII <= "0110000" when "0000",  -- '0'
                     "0110001" when "0001",  -- '1'
                     "0110010" when "0010",  -- '2'
                     "0110011" when "0011",  -- '3'
                     "0110100" when "0100",  -- '4'
                     "0110101" when "0101",  -- '5'
                     "0110110" when "0110",  -- '6'
                     "0110111" when "0111",  -- '7'
                     "0111000" when "1000",  -- '8'
                     "0111001" when "1001",  -- '9'
                     "0100001" when "1010",  -- 'A'
                     "0100010" when "1011",  -- 'B'
                     "0100011" when "1100",  -- 'C'
                     "0100100" when "1101",  -- 'D'
                     "0100101" when "1110",  -- 'E'
                     "0100110" when "1111",  -- 'F'
                     "0000000" when others; -- Valeur par défaut
    end process
end Behavioral;

    