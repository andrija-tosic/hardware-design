entity d_flip_flop is
    port(
        D: in bit;
        Rd: in bit;
        CLK: in bit;
        Q: out bit;
    );
end d_flip_flop;

architecture async_reset of d_flip_flop is
    begin
        process(clk, Rd) is
            begin
                if Rd = '1' then
                    Q <= '0';
                elsif clk'event and clk = '1' then
                    Q <= D;
                end if;
        end process;
end async_reset;

architecture sync_reset of d_flip_flop is
    begin
        process(clk) is
            begin
                if clk'event and clk = '1' then
                    if Rd = '1' then
                        Q <= '0';
                    else
                        Q <= D;
                    end if;
                end if;
        end process;
end sync_reset;