library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-- Two checks live here. The first holds and says so, which is what tells a
-- reader that the second one really ran rather than the file being skipped.

entity answer_size_testbench is
end answer_size_testbench;

architecture test_fixture of answer_size_testbench is
   signal meaning_of_life_test : std_logic_vector (7 downto 0);
begin
   UUT: entity work.hiker port map (meaning_of_life_test);

   process
   begin
       wait for 1 ns; -- Signal propagation

       assert (to_integer(unsigned(meaning_of_life_test)) > 9)
               report "Meaning of life is not two digits long"
               severity failure;
       assert false report "Size is at least two digits" severity note;

       assert (to_integer(unsigned(meaning_of_life_test)) > 99)
               report "Meaning of life is not three digits long"
               severity failure;

       assert false report "End of answer size test" severity note;
       wait;
   end process;
end test_fixture;
