library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity Ent_reg is
 Port (clk : in STD_LOGIC;
    rst_n : in STD_LOGIC;
    K : in STD_LOGIC;
    W : out STD_LOGIC);
end Ent_reg;
architecture Arch_reg of Ent_reg is
begin
Reg: process (clk, Rst_n)
begin
if Rst_n = '0' then
W <= ‘0’;
elsif rising_edge(clk)
then
W <= K;
end if;
end process;
end Arch_reg;