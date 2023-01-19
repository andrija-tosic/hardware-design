library ieee;
use ieee.std_logic_1164.all;

entity xor_or is
	port(
	a, b, c : in std_logic;
	y : out std_logic;
	);
end entity;

architecture arch of xor_or is
	begin
		y <= (a xor b) or c;
end architecture;

entity kolo is
	generic (n : integer := 8);
	port(
		a : in std_logic;
        b, c : in std_logic_vector(0 to n-1);
		y : out std_logic_vector(0 to n-1);
		);
end entity;

architecture kolo_arch of kolo is
	begin
		g1: for i in 0 to n-1 generate
			g2: if i=0 generate
				begin
                aa: entity work.xor_or(arch)
					port map(a, b(i), c(i), y(i));
			end generate;
			g3: if i > 0 and i < n generate
				begin
                bb: entity work.xor_or(arch)
					port map(y(i-1), b(i), c(i), y(i));
			end generate;
		end generate;
end architecture;