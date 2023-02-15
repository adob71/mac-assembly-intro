helloworld: helloworld.o
	ld -o helloworld helloworld.o -lSystem -syslibroot `xcrun -sdk macosx --show-sdk-path` -e _start -arch arm64 

helloworld.o: helloworld.s
	as -arch arm64 -o helloworld.o helloworld.s
