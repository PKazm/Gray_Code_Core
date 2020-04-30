--------------------------------------------------------------------------------
-- Company: <Name>
--
-- File: Binary_to_Gray.vhd
-- File history:
--      <Revision number>: <Date>: <Comments>
--      <Revision number>: <Date>: <Comments>
--      <Revision number>: <Date>: <Comments>
--
-- Description: 
--
-- <Description here>
--
-- Targeted device: <Family::SmartFusion2> <Die::M2S010> <Package::144 TQ>
-- Author: <Name>
--
--------------------------------------------------------------------------------

library IEEE;

use IEEE.std_logic_1164.all;
use work.Gray_Code_package.all;

entity Binary_to_Gray is
generic (
    g_n_bits : natural := 8
);
port (
    bin_in : in std_logic_vector(g_n_bits - 1 downto 0);
    gray_out : out std_logic_vector(g_n_bits - 1 downto 0)
);
end Binary_to_Gray;
architecture architecture_Binary_to_Gray of Binary_to_Gray is

begin

    gray_out <= f_Binary_to_Gray(bin_in);

   -- architecture body
end architecture_Binary_to_Gray;
