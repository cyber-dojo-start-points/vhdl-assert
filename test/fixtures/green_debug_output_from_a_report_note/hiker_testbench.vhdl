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

       -- The learner is watching what the design drove, and has not taken
       -- this out yet. A report at severity note says its piece and lets
       -- the simulation carry on.
       for i in 2 downto 0 loop
          report "debug: bit " & integer'image(i) & " is set to "
                 & std_logic'image(meaning_of_life_test(i))
                 severity note;
       end loop;

       assert (meaning_of_life_test = "00101010") -- 42
               report "Meaning of life value incorrect"
               severity failure;

       assert false report "End of test" severity note;
       wait;
   end process;
end test_fixture;
