library ieee;
use ieee.std_logic_1164.all;

entity komparator is
	generic (bool : integer range 0 to 1 := 1);
	port(
		a, b : in std_logic;
		eq : out std_logic;
	);
end entity;

architecture equ of komparator is
	begin
	e1: entity work.and_or(arch)
		generic map(n => bool)
		port map(a, b, eq);
end architecture;
