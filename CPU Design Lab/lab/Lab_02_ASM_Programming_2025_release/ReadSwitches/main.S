/*
 * Reads the switches on the FPGA board and writes 
 * the values to the LEDs and 7-Segments Display. 
 */

# $12 = address of LEDs, $13 = address offset of switches
# $10 = switch values 
.globl main
  
main:
   lui   $12, 0xbf80    # $12 = address of LEDs (0xbf800000)
   addiu $13, $12, 4    # $13 = address of switches
   
   addu  $10 , $0 , $0  # set $10 = 0 

readIO: 	
   lw    $10, 0($13)    # read switches: $10 = switch values
   
   sw    $10, 0($12)    # write switch values to LEDs 
   sw    $10, 16($12)   # write switch values to 7-Segs
   
   beq   $0, $0, readIO # repeat
   nop                  # branch delay slot
