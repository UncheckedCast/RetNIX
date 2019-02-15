CC=owcc
CFLAGS=-s -march=i86 -I="./;./lib;./kernel;./etc"
NASM=nasm
ASMFLAGS=-f obj
WLINK = wlink
WLFLAGS = @linkerscript.lnk

OBJS = kernel/main.o lib/ucprint.o lib/readkey.o etc/retnit.o lib/printchar.obj etc/ucsh.o
DEPS = kernel/retkernel.h lib/readkey.h lib/retlibc.h lib/ucprint.h etc/retnit.h etc/ucsh.h

%.o: %.c $(DEPS)
	$(CC) -c -o $@ $< $(CFLAGS)

%.obj: %.asm $(DEPS)
	$(NASM) $*.asm $(ASMFLAGS)

.PHONY kernel:

kernel: $(OBJS)
	$(CC) -o $@ $^ $(CFLAGS)

.PHONY clean:

clean:
	rm -f */*.o
