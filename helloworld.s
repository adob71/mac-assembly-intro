// assembler program to print string to stdout
// X0,X1,X2 - parametears for unix system calls
// X16 - unix system call #

.global _start  // start address for linker
.align 2        // align

_start: 

// setup parameters to print string and call kernel to do it
mov X0, #1      // stdout = 1
adr X1, string  // string to print
mov X2, #11     // length of the string
mov X16, #4     // unix system call #4 is to write the string
svc #0x80       // call kernel to write the string

// setup parameters to exit the program and call kernel to do it
mov X0, #0      // return code = 0
mov X16, #1     // unix system call #1 is to exit the program
svc #0x80       // call kernel to exit the program

string: 

.ascii "helloworld\n"

