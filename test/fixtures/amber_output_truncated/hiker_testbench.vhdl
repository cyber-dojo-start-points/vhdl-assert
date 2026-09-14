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

       -- The learner put a report inside a loop to see what was happening.
       -- It goes to stdout, where a failing assertion writes too, and prints
       -- far more than the 50K the runner keeps, so the lines naming the
       -- failed assertion are cut off the end.
       for i in 1 to 3000 loop
          report "debug: meaning of life is still "
                 & integer'image(to_integer(unsigned(meaning_of_life_test)))
                 & " on pass " & integer'image(i)
                 severity note;
       end loop;

       assert (meaning_of_life_test = "00101010") -- 42
               report "Meaning of life value incorrect"
               severity failure;

       assert false report "End of test" severity note;
       wait;
   end process;
end test_fixture;
