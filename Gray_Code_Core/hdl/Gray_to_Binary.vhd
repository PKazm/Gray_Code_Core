--------------------------------------------------------------------------------
-- Company: <Name>
--
-- File: Gray_to_Binary.vhd
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

entity Gray_to_Binary is
generic (
    g_n_bits : natural := 8
);
port (
    gray_in : in std_logic_vector(g_n_bits - 1 downto 0);
    bin_out : out std_logic_vector(g_n_bits - 1 downto 0)
);
end Gray_to_Binary;
architecture architecture_Gray_to_Binary of Gray_to_Binary is

begin

    bin_out <= f_Gray_to_Binary(gray_in);
	
   -- architecture body
end architecture_Gray_to_Binary;
