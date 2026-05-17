.data
NewLine : .asciiz "\n"

.text
.globl main

 
main:
   la    $16, NewLine     # $16 = address of NewLine

init:                   # initialize variables
   addi  $9,  $0,  1    # old = 1
   addi  $10, $0,  0    # cur = 0
   addi  $12, $0,  1    # n = 1

fib:
   slti  $13, $12, 12   # n < 12?
   beq   $13, $0,  exit # if not, exit 	
   addi  $12, $12, 1    # n = n + 1
   add   $11, $9,  $10  # temp = old + cur
   add   $9,  $10, $0   # old = cur
   add   $10, $11, $0   # cur = temp      
   
   move  $a0, $10 
   li    $v0, 1                # print it
   syscall  

   move  $a0, $16 
   li    $v0, 4               
   syscall
   
   beq   $0, $0, fib           # repeat
   nop
   
exit:

   li    $v0, 10               # Exit
   syscall  
   

##############################################################    
# Service Code in      $v0    Arguments                              Results
# Print an Integer      1      $a0  = Integer Value to be Printed
# Print Float           2      $f12 = 32-bit floating-point value 
#                                     to be printed
# Print Double          3      $f12 = 64-bit floating-point value 
#                                     to be printed
# Print String          4      $a0  = Address of NULL terminated 
#                                     string in Memory
# Read an Integer in    5                                            $v0 = 32-bit integer 
# (from the keyboard)                                                      entered by user
# Read Float            6                                            $f0 = 32-bit floating point
#                                                                          value entered by user
# Read Double           7                                            $f0 = 64-bit floating point
#                                                                          value entered by user
# Read a String in      8      $a0 = Address of Input Buffer in Memory
# (from the keyboard)          $a1 = Length of Buffer (n)
# Allocate Memory       9      $a0 = number of bytes to allocate     $v0 = starting address of
#                                                                          allocated memory
# Exit                  10

# Print Character       11     $a0 = character to be printed
# Read Character        12                                           $v0 = character entered
#                                                                           by user
# File Open             13     $a0 = file name string,               $v0 = file descriptor
#                                    NULL terminated
#                              $a1 = access flags
#                              $a2 = file mode, (UNIX style)
# File Read             14     $a0 = file descriptor                 $v0 = number of bytes
#                              $a1 = buffer starting address               actually read from file (-1 
#                              $a2 = number of bytes to                    = error, 0 = end of file)
#                                    read
# File Write            15     $a0 = file descriptor                 $v0 = number of bytes
#                              $a1 = buffer starting address               actually written to file (-1
#                              $a2 = number of bytes to                    = error, 0 = end of file)
#                                    write
# File Close            16     $a0 = file descriptor   
   



