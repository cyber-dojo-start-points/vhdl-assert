library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity parity_testbench is
end parity_testbench;

architecture test_fixture of parity_testbench is
   signal meaning_of_life_test : std_logic_vector (7 downto 0);
begin
   UUT: entity work.hiker port map (meaning_of_life_test);

   process
   begin
       wait for 1 ns; -- Signal propagation
       assert (meaning_of_life_test(0) = '1')
               report "Meaning of life is not odd"
               severity failure;

       assert false report "End of parity test" severity note;
       wait;
   end process;
end test_fixture;
