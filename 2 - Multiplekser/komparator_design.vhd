library ieee;
use ieee.std_logic_arith.all;

entity komparator is
    port(
        A, B: in signed(3 downto 0);
        Y: out signed(3 downto 0);
    );
end komparator;

architecture min of komparator is
    begin
        process(A, B) is
            begin
                if (A <= B) then
                    Y <= A;
                else
                    Y <= B;
            end if;
        end process;
end min;

architecture max of komparator is
    begin
        process(A, B) is
            begin
                if (A >= B) then
                    Y <= A;
                else
                    Y <= B;
            end if;
        end process;
end max;