library ieee;
use ieee.std_logic_1164.all;

entity xor_or is
	generic (n : integer := 4);
	port(
		a : in std_logic;
		b, c : in std_logic_vector (n-1 downto 0);
		y : out std_logic_vector (n-1 downto 0);
		);
end xor_or;

architecture arch of xor_or is
	signal y_xor : std_logic_vector(n-1 downto 0);
	signal y_a : std_logic_vector(n downto 0);
	begin
	y_a(0) <= a;
	g1: for i in 0 to n-1 generate
		e1: entity work.xor_kolo(xor_arch)
			port map(y_a(i), b(i), y_xor(i));
			
		e2: entity work.or_kolo(or_arch)
			port map(y_a(i), b(i), y(i));
    end generate;
end arch;
