library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity hiker_testbench is
end hiker_testbench;

architecture test_fixture of hiker_testbench is
   signal meaning_of_life_test : std_logic_vector (7 downto 0);
   signal parity_test          : std_logic;
begin
   UUT: entity work.hiker port map (meaning_of_life_test);
   SUM: entity work.checksum port map (meaning_of_life_test, parity_test);

   process
   begin
       wait for 1 ns; -- Signal propagation
       assert (meaning_of_life_test = "00101010") -- 42
               report "Meaning of life value incorrect"
               severity failure;

       -- 42 has three bits set, so its parity is odd.
       assert (parity_test = '1')
               report "Meaning of life parity incorrect"
               severity failure;

       assert false report "End of test" severity note;
       wait;
   end process;
end test_fixture;
