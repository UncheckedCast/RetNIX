main.o : kernel/main.c
	wcc -s -0
ucprint.o : lib/ucprint.c
	wcc -s -0
readkey.o : lib/readkey.c
	wcc -s -0
retnit.o : etc/retnit.c
	wcc -s -0
printchar.obj : lib/printchar.asm
	nasm -f obj
