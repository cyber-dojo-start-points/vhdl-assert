library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-- VHDL source is often named .vhd, and this start-point is set to .vhdl, so
-- the *.vhdl glob ghdl import is given misses this file. The half written
-- line below would stop the analyser dead if it ever reached it, so a green
-- says the file really is invisible rather than merely unused.

entity answer_size_testbench is
end answer_size_testbench;

architecture test_fixture of answer_size_testbench is
   signal meaning_of_life_test : std_logic_vector (7 downto 0);
begin
   UUT: entity work.hiker port map (meaning_of_life_test);

   process
   begin
       wait for 1 ns; -- Signal propagation
       assert (to_integer(unsigned(meaning_of_life_test)) > 99
               report "Meaning of life is not three digits long"
               severity failure;
       wait;
   end process;
end test_fixture;
