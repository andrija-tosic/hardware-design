entity tb is
	generic (br : integer := 4);
end tb;

architecture tb_arch of tb is
		signal wr, clk : bit;
		
		signal Din : integer range 0 to br-1;
		signal Dout : integer;
		
	begin
	uut: entity work.brojac(arch)
    	
        generic map (n => br)
        
		port map(wr, clk, din, dout);
		
		clock: process is
        begin
			clk <= '0';
			wait for 1 ns;
			clk <= '1';
			wait for 1 ns;
		end process;
		
		process is
        begin
        	wait for 2.5 ns;
			din <= 3;
			wr <= '1';
			wait for 1 ns;
            wr <= '0';
			wait for 12.5 ns;
            din <= 2;
			wr <= '1';
			wait for 1.5 ns;
            wr <= '0';
            wait for 2 ns;
            din <= 7;
            wait;
		end process;
end tb_arch;
