## This file is a general .xdc for the Basys3 rev B board
## To use it in a project:
## - uncomment the lines corresponding to used pins
## - rename the used ports (in each line, after get_ports) according to the top level signal names in the project

# Clock signal
set_property PACKAGE_PIN W5 [get_ports clk]							
	set_property IOSTANDARD LVCMOS33 [get_ports clk]
	create_clock -add -name sys_clk_pin -period 10.00 -waveform {0 5} [get_ports clk]
	
	
# Switches
set_property PACKAGE_PIN V17 [get_ports {start}]                    
    set_property IOSTANDARD LVCMOS33 [get_ports {start}]
set_property PACKAGE_PIN V16 [get_ports {reset}]                    
    set_property IOSTANDARD LVCMOS33 [get_ports {reset}]
        
#keyboard pin 
#set_property IOSTANDARD LVCMOS33 [get_ports kb_clk]
#set_property IOSTANDARD LVCMOS33 [get_ports kb_data]
#set_property PACKAGE_PIN C17 [get_ports kb_clk]
#set_property PACKAGE_PIN B17 [get_ports kb_data]

set_property PACKAGE_PIN C17 [get_ports ps2c]
set_property IOSTANDARD LVCMOS33 [get_ports ps2c]
set_property IOSTANDARD LVCMOS33 [get_ports ps2d]
set_property PACKAGE_PIN B17 [get_ports ps2d]





set_property PACKAGE_PIN N3 [get_ports {dir}]

set_property IOSTANDARD LVCMOS33 [get_ports {dir}]

set_property PACKAGE_PIN T3 [get_ports {screen}]

set_property IOSTANDARD LVCMOS33 [get_ports {screen}]
	
#Buttons
#set_property PACKAGE_PIN W19 [get_ports right1_btn_u]						
#	set_property IOSTANDARD LVCMOS33 [get_ports right1_btn_u]
#set_property PACKAGE_PIN T17 [get_ports right1_btn_d]						
#	set_property IOSTANDARD LVCMOS33 [get_ports right1_btn_d]
#set_property PACKAGE_PIN T18 [get_ports left1_btn_u]						
#        set_property IOSTANDARD LVCMOS33 [get_ports left1_btn_u]
#set_property PACKAGE_PIN U17 [get_ports left1_btn_d]  	 	 	 	 	 
#             set_property IOSTANDARD LVCMOS33 [get_ports left1_btn_d] 

#set_property PACKAGE_PIN U18 [get_ports start_ball]  	 	 	 	 	 
#            set_property IOSTANDARD LVCMOS33 [get_ports start_ball] 


#set_property PACKAGE_PIN W13 [get_ports right2_btn_u]						
#	set_property IOSTANDARD LVCMOS33 [get_ports right2_btn_u]
#set_property PACKAGE_PIN W14 [get_ports right2_btn_d]						
#	set_property IOSTANDARD LVCMOS33 [get_ports right2_btn_d]
	
#set_property PACKAGE_PIN T2 [get_ports left2_btn_u]						
#	set_property IOSTANDARD LVCMOS33 [get_ports left2_btn_u]
#set_property PACKAGE_PIN T3 [get_ports left2_btn_d]						
#	set_property IOSTANDARD LVCMOS33 [get_ports left2_btn_d]

set_property PACKAGE_PIN L1 [get_ports {batti1}]				
	set_property IOSTANDARD LVCMOS33 [get_ports {batti1}]
set_property PACKAGE_PIN P1 [get_ports {batti2}]				
	set_property IOSTANDARD LVCMOS33 [get_ports {batti2}]

#VGA Connector
set_property PACKAGE_PIN G19 [get_ports {red[0]}]				
	set_property IOSTANDARD LVCMOS33 [get_ports {red[0]}]
set_property PACKAGE_PIN H19 [get_ports {red[1]}]				
	set_property IOSTANDARD LVCMOS33 [get_ports {red[1]}]
set_property PACKAGE_PIN J19 [get_ports {red[2]}]				
	set_property IOSTANDARD LVCMOS33 [get_ports {red[2]}]
set_property PACKAGE_PIN N19 [get_ports {red[3]}]				
	set_property IOSTANDARD LVCMOS33 [get_ports {red[3]}]
	
set_property PACKAGE_PIN N18 [get_ports {blue[0]}]				
	set_property IOSTANDARD LVCMOS33 [get_ports {blue[0]}]
set_property PACKAGE_PIN L18 [get_ports {blue[1]}]				
	set_property IOSTANDARD LVCMOS33 [get_ports {blue[1]}]
set_property PACKAGE_PIN K18 [get_ports {blue[2]}]				
	set_property IOSTANDARD LVCMOS33 [get_ports {blue[2]}]
set_property PACKAGE_PIN J18 [get_ports {blue[3]}]				
	set_property IOSTANDARD LVCMOS33 [get_ports {blue[3]}]
	
set_property PACKAGE_PIN J17 [get_ports {green[0]}]				
	set_property IOSTANDARD LVCMOS33 [get_ports {green[0]}]
set_property PACKAGE_PIN H17 [get_ports {green[1]}]				
	set_property IOSTANDARD LVCMOS33 [get_ports {green[1]}]
set_property PACKAGE_PIN G17 [get_ports {green[2]}]				
	set_property IOSTANDARD LVCMOS33 [get_ports {green[2]}]
set_property PACKAGE_PIN D17 [get_ports {green[3]}]				
	set_property IOSTANDARD LVCMOS33 [get_ports {green[3]}]
	
set_property PACKAGE_PIN P19 [get_ports {horizontal_sync}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {horizontal_sync}]
set_property PACKAGE_PIN R19 [get_ports {vertical_sync}]						
	set_property IOSTANDARD LVCMOS33 [get_ports {vertical_sync}]

set_property PACKAGE_PIN V14 [get_ports {led}]						
	set_property IOSTANDARD LVCMOS33 [get_ports {led}]

##7 segment display
      set_property PACKAGE_PIN W7 [get_ports {a}]                    
          set_property IOSTANDARD LVCMOS33 [get_ports {a}]
      set_property PACKAGE_PIN W6 [get_ports {b}]                    
          set_property IOSTANDARD LVCMOS33 [get_ports {b}]
      set_property PACKAGE_PIN U8 [get_ports {c}]                    
          set_property IOSTANDARD LVCMOS33 [get_ports {c}]
      set_property PACKAGE_PIN V8 [get_ports {d}]                    
          set_property IOSTANDARD LVCMOS33 [get_ports {d}]
      set_property PACKAGE_PIN U5 [get_ports {e}]                    
          set_property IOSTANDARD LVCMOS33 [get_ports {e}]
      set_property PACKAGE_PIN V5 [get_ports {f}]                    
          set_property IOSTANDARD LVCMOS33 [get_ports {f}]
      set_property PACKAGE_PIN U7 [get_ports {g}]                    
          set_property IOSTANDARD LVCMOS33 [get_ports {g}]
      
      set_property PACKAGE_PIN V7 [get_ports dp]                            
          set_property IOSTANDARD LVCMOS33 [get_ports dp]
      
      set_property PACKAGE_PIN U2 [get_ports {an[0]}]                    
          set_property IOSTANDARD LVCMOS33 [get_ports {an[0]}]
      set_property PACKAGE_PIN U4 [get_ports {an[1]}]                    
          set_property IOSTANDARD LVCMOS33 [get_ports {an[1]}]
      set_property PACKAGE_PIN V4 [get_ports {an[2]}]                    
          set_property IOSTANDARD LVCMOS33 [get_ports {an[2]}]
      set_property PACKAGE_PIN W4 [get_ports {an[3]}]                    
          set_property IOSTANDARD LVCMOS33 [get_ports {an[3]}]           