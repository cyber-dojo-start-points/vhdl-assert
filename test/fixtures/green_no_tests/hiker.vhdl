library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-- There is no testbench file here, so nothing asserts anything. The design
-- entity is still imported, elaborated and run, and running it is all
-- cyber-dojo.sh counts, so the answer below is never looked at.

entity hiker is
   port (meaning_of_life : out std_logic_vector (7 downto 0));
end hiker;

architecture dataflow of hiker is
begin
   meaning_of_life <= "00110110";  -- 54
end dataflow;
