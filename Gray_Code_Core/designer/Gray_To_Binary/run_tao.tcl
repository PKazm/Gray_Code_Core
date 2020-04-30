set_family {SmartFusion2}
read_vhdl -mode vhdl_2008 {E:\Github_Repos\Gray_Code_Core\Gray_Code_Core\hdl\Gray_Code_package.vhd}
read_vhdl -mode vhdl_2008 {E:\Github_Repos\Gray_Code_Core\Gray_Code_Core\hdl\Gray_To_Binary.vhd}
set_top_level {Gray_To_Binary}
map_netlist
check_constraints {E:\Github_Repos\Gray_Code_Core\Gray_Code_Core\constraint\synthesis_sdc_errors.log}
write_fdc {E:\Github_Repos\Gray_Code_Core\Gray_Code_Core\designer\Gray_To_Binary\synthesis.fdc}
