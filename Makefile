CC=owcc
CFLAGS=-mmodel=f -fno-stack-check -fnostdlib -s -Wl,@linkerscript.lnk -march=i86 -I="./;./lib;./kernel;./etc"
NASM=nasm
ASMFLAGS=-f obj -o $*.obj
WLINK = wlink
WLFLAGS = @linkerscript.lnk

OBJS = kernel/main.o lib/ucprint.o lib/readkey.o etc/retnit.o lib/printchar.obj etc/ucsh.o bootloader2.obj
DEPS = kernel/retkernel.h lib/readkey.h lib/retlibc.h lib/ucprint.h etc/retnit.h etc/ucsh.h

%.o: %.c $(DEPS)
	$(CC) -c -o $@ $< $(CFLAGS)

%.obj: %.asm $(DEPS)
	$(NASM) $*.asm $(ASMFLAGS)

.PHONY retnix:

retnix: $(OBJS)
	$(CC) -o $@ $^ $(CFLAGS)

.PHONY clean:

clean:
	rm -f */*.o
