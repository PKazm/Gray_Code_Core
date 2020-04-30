# Written by Synplify Pro version mapact, Build 2737R. Synopsys Run ID: sid1588196933 
# Top Level Design Parameters 

# Clocks 
create_clock -period 10.000 -waveform {0.000 5.000} -name {COREFIFO_C0|RCLOCK} [get_ports {RCLOCK}] 
create_clock -period 10.000 -waveform {0.000 5.000} -name {COREFIFO_C0|WCLOCK} [get_ports {WCLOCK}] 

# Virtual Clocks 

# Generated Clocks 

# Paths Between Clocks 

# Multicycle Constraints 

# Point-to-point Delay Constraints 

# False Path Constraints 

# Output Load Constraints 

# Driving Cell Constraints 

# Input Delay Constraints 

# Output Delay Constraints 

# Wire Loads 

# Other Constraints 

# syn_hier Attributes 

# set_case Attributes 

# Clock Delay Constraints 
set Inferred_clkgroup_0 [list COREFIFO_C0|RCLOCK]
set Inferred_clkgroup_1 [list COREFIFO_C0|WCLOCK]
set_clock_groups -asynchronous -group $Inferred_clkgroup_0
set_clock_groups -asynchronous -group $Inferred_clkgroup_1


# syn_mode Attributes 

# Cells 

# Port DRC Rules 

# Input Transition Constraints 

# Unused constraints (intentionally commented out) 


# Non-forward-annotatable constraints (intentionally commented out) 

# Block Path constraints 

