CC=wcc
CFLAGS=-s -0 -i="./;./lib;./kernel;./etc"
NASM=nasm
ASMFLAGS=-f obj

OBJ = kernel/main.c
DEPS = lib/ucprint.o lib/readkey.o etc/retnit.o lib/printchar.obj

o: $(DEPS)
	$(CC) -fo=$@ $(CFLAGS) $<

.asm.obj: $(DEPS)
	$(NASM) $@ $(ASMFLAGS)

all: .symbolic $(OBJ)
	$(CC) -fo=$@ $(CFLAGS) $<
