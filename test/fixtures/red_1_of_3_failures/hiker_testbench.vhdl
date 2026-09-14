library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity hiker_testbench is
end hiker_testbench;

architecture test_fixture of hiker_testbench is
   signal meaning_of_life_test : std_logic_vector (7 downto 0);
begin
   UUT: entity work.hiker port map (meaning_of_life_test);

   process
   begin
       wait for 1 ns; -- Signal propagation

       -- 54 is two digits long, so this one holds and says so.
       assert (to_integer(unsigned(meaning_of_life_test)) > 9)
               report "Meaning of life is not two digits long"
               severity failure;
       assert false report "Size checked" severity note;

       -- 54 is not 42, so this one fails at severity failure, which ends
       -- the simulation. The third check below never runs.
       assert (meaning_of_life_test = "00101010") -- 42
               report "Meaning of life value incorrect"
               severity failure;

       assert (meaning_of_life_test(0) = '0')
               report "Meaning of life is not even"
               severity failure;

       assert false report "End of test" severity note;
       wait;
   end process;
end test_fixture;
