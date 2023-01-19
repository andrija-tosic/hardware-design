library ieee;
use ieee.std_logic_1164.all;


entity n_bitni_komparator is
	generic (n : integer := 8);
	port(
		a, b : in std_logic_vector(n-1 downto 0);
		y : out std_logic_vector(n-1 downto 0);
	);
end entity;

architecture n_arch of n_bitni_komparator is
	begin
	n_gen: for i in 0 to n-1 generate
		e2: entity work.komparator(equ)
			port map(a(i), b(i), y(i));
	end generate;
end architecture;
