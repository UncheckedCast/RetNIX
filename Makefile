CC=wcc
CFLAGS=-s -0 -i="./;./lib;./kernel;./etc"
NASM=nasm
ASMFLAGS=-f obj

OBJ = kernel/main.c
DEPS = lib/ucprint.c lib/readkey.c etc/retnit.c
ASMDEPS = lib/printchar.asm

%.c: $(DEPS)
	$(CC) -fo=$@.o $(CFLAGS) $@

%.asm: $(ASMDEPS)
	$(NASM) $@.asm $(ASMFLAGS)

all: .symbolic $(OBJ)
	$(CC) -fo=$@ $(CFLAGS) $<
