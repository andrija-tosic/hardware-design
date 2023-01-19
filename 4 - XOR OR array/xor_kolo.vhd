library ieee;
use ieee.std_logic_1164.all;

entity xor_kolo is
	port(
		a, b : in std_logic;
		y : out std_logic;
	);
end entity;

architecture xor_arch of xor_kolo is
	begin
	y <= a xor b;
end architecture;
