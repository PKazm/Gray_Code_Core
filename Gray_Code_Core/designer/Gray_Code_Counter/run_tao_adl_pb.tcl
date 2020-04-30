set_family {SmartFusion2}
read_adl {E:\Github_Repos\Gray_Code_Core\Gray_Code_Core\designer\Gray_Code_Counter\Gray_Code_Counter.adl}
map_netlist
check_constraints {E:\Github_Repos\Gray_Code_Core\Gray_Code_Core\constraint\timing_sdc_errors.log}
write_sdc -component Gray_Code_Counter {E:\Github_Repos\Gray_Code_Core\Gray_Code_Core\designer\Gray_Code_Counter\Gray_Code_Counter_timing_analysis_pb.sdc}
