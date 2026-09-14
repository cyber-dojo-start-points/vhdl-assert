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
      variable margin : integer;
   begin
       wait for 1 ns; -- Signal propagation

       -- The learner wanted the distance from 42 as a ratio and divided by
       -- it. The divisor is whatever the design drove, so when the design is
       -- right it is zero, and dividing by it stops the simulation before
       -- the assert below is ever reached.
       margin := 42 / (to_integer(unsigned(meaning_of_life_test)) - 42);

       assert (margin = 0)
               report "Meaning of life value incorrect"
               severity failure;

       assert false report "End of test" severity note;
       wait;
   end process;
end test_fixture;
