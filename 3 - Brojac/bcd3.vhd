entity bcd3 is
	port(
		CE, WR, CLK : in bit;
		Din : in integer range 0 to 999;
		Dout : out integer range 0 to 999;
	);
end bcd3;

architecture arch of bcd3 is
	begin	
	process(clk) is
		variable q : integer range 0 to 999;
        begin
			if clk'event and clk = '1' then
				if WR = '1' then
					q := Din;
				elsif CE = '1' then
					if q > 0 then
						q := q - 1;
					end if; -- ako je q = 0, staje sa brojanjem do sledeceg upisa    
                end if;
            	dout <= q;
			end if;
	end process;
end arch;
