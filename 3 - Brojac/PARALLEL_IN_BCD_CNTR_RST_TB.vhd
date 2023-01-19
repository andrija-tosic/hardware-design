entity tb is
end tb;

architecture test of tb is
	signal par_in : bit_vector(3 downto 0);
	signal wr, rst, clk : bit;
	signal q : bit_vector(3 downto 0);
	
	
	begin
		uut: entity work.cntr(cntr_arch)
		port map(par_in, wr, rst, clk, q);
	
	
	clock: process is
            begin
                clk <= '0';
                wait for 1 ns;
                clk <= '1';
                wait for 1 ns;
           end process;

	process is
		begin
			wr <= '1';
			par_in <= "0100";
            
			wait for 2 ns;
			
			wr <= '0';
            
            wait for 5.5 ns;
            
            rst <= '1';
            wait for 1 ns;
            rst <= '0';
            
            wait;
	end process;
end test;