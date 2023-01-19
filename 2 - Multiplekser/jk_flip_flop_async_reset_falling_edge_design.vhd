entity jk_flip_flop is
    port(
        J, K, CLK, Rd: in bit;
        Q: out bit;
    );
end jk_flip_flop;

architecture async_reset of jk_flip_flop is
    begin
        process(CLK, Rd) is
            begin
                if Rd = '1' then
                Q <= '0'
                elsif CLK'event and CLK = '1' then
                    if bit_vector(J, K) = "00" then
                    Q <= Q;
                    elsif bit_vector(J, K) = "01" then
                    Q <= '0';
                    elsif bit_vector(J, K) = "10" then
                    Q <= '1';
                    else
                    Q <= not Q;
                end if;
        end process;
end async_reset;