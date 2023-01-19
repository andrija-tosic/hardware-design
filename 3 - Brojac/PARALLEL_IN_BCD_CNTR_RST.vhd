library ieee;
use ieee.numeric_bit_unsigned.all;
entity cntr is
		port(
			parallel_in : in bit_vector(3 downto 0);
			wr : in bit;
			rst : in bit; -- asinhroni
			clk : in bit;
			q : out bit_vector(3 downto 0);
		);
end cntr;

architecture cntr_arch of cntr is
	begin
	process(clk, rst) is
    	variable num : bit_vector(3 downto 0) := "0000";
		begin
			if rst = '1' then
				num := "0000";
			elsif clk'event and clk = '1' and wr = '1' then
				num := parallel_in;
			elsif clk'event and clk = '1' and wr = '0' then
				num := (num + 1) mod 10;
			end if;
            q <= num;
	end process;
end cntr_arch;