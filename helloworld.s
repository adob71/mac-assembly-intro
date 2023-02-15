// assembler program to print helloworld to stdout
// X0,X1,X2 - parameters to unix system calls
// X16 - mach system call function number

.global _start			// provide program starting address to linker
.align 2		    	// make sure everything is aligned properly

_start: 

// Setup the parameters to print helloworld and then call the Kernel to do it
    mov	X0, #1	    	// 1 = stdout
	adr	X1, string  	// string to print
	mov	X2, #11	    	// length of the string
	mov	X16, #4 		// unix system call #4 is to write the string
	svc	#0x80   		// call kernel to write the string

// Setup the parameters to exit the program and then call the kernel to do it
	mov X0, #0	        // return code = 0
	mov X16, #1	       	// unix system call # 1 is to exit the program
	svc #0x80   		// call kernel to exit the program

string: 

.ascii "helloworld\n"

