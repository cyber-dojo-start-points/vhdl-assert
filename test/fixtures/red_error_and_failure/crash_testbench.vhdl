library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-- This testbench never reaches an assert. It ends in a run-time error, and
-- hiker_testbench alongside it ends in an assertion failure, so the run
-- carries both an error and a failure.

entity crash_testbench is
end crash_testbench;

architecture test_fixture of crash_testbench is
   signal meaning_of_life_test : std_logic_vector (7 downto 0);
begin
   UUT: entity work.hiker port map (meaning_of_life_test);

   process
      variable share : integer;
   begin
       wait for 1 ns; -- Signal propagation
       share := 42 / (to_integer(unsigned(meaning_of_life_test)) - 54);

       assert (share = 1)
               report "Meaning of life is not a whole share"
               severity failure;
       wait;
   end process;
end test_fixture;
