library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity Ent_combi is
 Port (A : in STD_LOGIC;
        B : in STD_LOGIC;
        C : in STD_LOGIC;
        D : out STD_LOGIC);
end Ent_combi;

architecture Arch_combi of Ent_combi

is

begin
    D <= (A and B) or C;
end Arch_combi;