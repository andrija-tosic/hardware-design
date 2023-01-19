entity brojac is
	generic (n : integer := 8);
	port(
		WR, CLK : in bit;
		Din : in integer range 0 to n-1;
		Dout : out integer;
	);
end brojac;

architecture arch of brojac is
	begin	
	process(clk) is
		variable q : integer := n-1;
        begin
			if clk'event and clk = '1' then
				if WR = '1' then
					q := Din;
				else
					q := (q - 1) mod n;
                end if;
			end if;
            dout <= q;
	end process;
end arch;
