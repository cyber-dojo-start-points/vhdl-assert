library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-- The learner renamed both files and both entities. ghdl import is given a
-- glob rather than a list of names, and cyber-dojo.sh runs whatever entities
-- the workspace ends up holding, so nothing here depends on the name hiker.

entity fizz_buzz_testbench is
end fizz_buzz_testbench;

architecture test_fixture of fizz_buzz_testbench is
   signal meaning_of_life_test : std_logic_vector (7 downto 0);
begin
   UUT: entity work.fizz_buzz port map (meaning_of_life_test);

   process
   begin
       wait for 1 ns; -- Signal propagation
       assert (meaning_of_life_test = "00101010") -- 42
               report "Meaning of life value incorrect"
               severity failure;

       assert false report "End of test" severity note;
       wait;
   end process;
end test_fixture;
