entity tb is
end tb;

architecture tb_arch of tb is
		signal ce, wr, clk : bit;
		
		signal Din : integer range 0 to 999;
		signal Dout : integer range 0 to 999;
		
	begin
	uut: entity work.bcd3(arch)
		port map(ce, wr, clk, din, dout);
		
		clock: process is
        begin
			clk <= '0';
			wait for 1 ns;
			clk <= '1';
			wait for 1 ns;
		end process;
		
		process is
        begin
            ce <= '1';
			din <= 4;
			wr <= '1';
			wait for 2 ns;
            wr <= '0';
			wait for 8 ns;
            wr <= '1';
            wait for 2 ns;
            wr <= '0';
            wait;
		end process;
end tb_arch;
