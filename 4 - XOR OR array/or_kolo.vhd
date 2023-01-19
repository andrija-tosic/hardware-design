library ieee;
use ieee.std_logic_1164.all;

entity or_kolo is
	port(
		a, b : in std_logic;
		y : out std_logic;
	);
end entity;

architecture or_arch of or_kolo is
	begin
	y <= a or b;
end architecture;
