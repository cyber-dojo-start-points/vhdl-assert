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
       -- The learner meant to settle the signal and check it. Waiting inside
       -- a loop with nothing to leave it keeps scheduling the next event, so
       -- simulation time runs on and the assert below is never reached.
       loop
          wait for 1 ns;
       end loop;

       assert (meaning_of_life_test = "00101010") -- 42
               report "Meaning of life value incorrect"
               severity failure;
       wait;
   end process;
end test_fixture;
