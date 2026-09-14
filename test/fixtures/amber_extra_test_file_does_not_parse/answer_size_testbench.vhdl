library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-- A second testbench the learner started and has not finished. ghdl import
-- reads every *.vhdl file in the workspace, so this one is seen even though
-- no other file mentions it.

entity answer_size_testbench is
end answer_size_testbench;

architecture test_fixture of answer_size_testbench is
   signal meaning_of_life_test : std_logic_vector (7 downto 0);
begin
   UUT: entity work.hiker port map (meaning_of_life_test);

   process
   begin
       wait for 1 ns; -- Signal propagation
       assert (to_integer(unsigned(meaning_of_life_test)) > 9
               report "Meaning of life is not two digits long"
               severity failure;
       wait;
   end process;
end test_fixture;
