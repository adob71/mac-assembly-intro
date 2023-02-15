// assembler program to print helloworld to stdout
// X0,X1,X2 - parameter for unix system call
// X16 - unix system call #

.global _start  // start address for linker
.align 2        // align

_start: 

// Setup the parameters to print helloworld and then call the Kernel to do it
mov X0, #1      // stdout = 1
adr X1, string  // string to print
mov X2, #11     // length of the string
mov X16, #4     // unix system call #4 is to write the string
svc #0x80       // call kernel to write the string

// Setup the parameters to exit the program and then call the kernel to do it
mov X0, #0      // return code = 0
mov X16, #1     // unix system call #1 is to exit the program
svc #0x80       // call kernel to exit the program

string: 

.ascii "helloworld\n"

