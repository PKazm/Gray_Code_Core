--------------------------------------------------------------------------------
-- Company: <Name>
--
-- File: gray_to_binary_freq_test.vhd
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

entity gray_to_binary_freq_test is
generic (
    g_n_bits : natural := 32
);
port (
	CLK : in std_logic;
	RSTn : in std_logic;
	
    gray_in : in std_logic_vector(g_n_bits - 1 downto 0);
    bin_out : out std_logic_vector(g_n_bits - 1 downto 0)
);
end gray_to_binary_freq_test;
architecture architecture_gray_to_binary_freq_test of gray_to_binary_freq_test is

	signal g_buf : std_logic_vector(g_n_bits - 1 downto 0);
	signal b_buf : std_logic_vector(g_n_bits - 1 downto 0);

begin

	process(CLK, RSTn)
	begin
		if(RSTn = '0') then
			g_buf <= (others => '0');
			b_buf <= (others => '0');
		elsif(rising_edge(CLK)) then
			g_buf <= gray_in;
			b_buf <= f_Gray_to_Binary(g_buf);
		end if;
	end process;
	
	bin_out <= b_buf;

   -- architecture body
end architecture_gray_to_binary_freq_test;
