CC = gcc
CFLAGS = -Wall -Wextra -Werror

all:

recomp_all: recomp_asm recomp_proc recomp_pic

recomp_asm:
	$(CC) Assembler/Assembler.c Assembler/main.c $(CFLAGS) -o Assembler/asm.out

recomp_proc:
	$(CC) Processor/stack.c Processor/Processor.c Processor/main.c -lm $(CFLAGS) -o Processor/proc.out

recomp_pic:
	$(CC) Pic/Pic.c Pic/main.c $(CFLAGS) -o Pic/pict.out

run_quad:
	Assembler/./asm.out Assembler/Quad.txt Assembler/Quad.bin
	Processor/./proc.out Assembler/Quad.bin

run_pic:
	Pic/./pict.out Pic/Pic.txt Assembler/picasm.txt
	Assembler/./asm.out Assembler/picasm.txt Assembler/pic.bin
	Processor/./proc.out Assembler/pic.bin

run_circul:
	Assembler/./asm.out Assembler/Circul.txt Assembler/circ.bin
	Processor/./proc.out Assembler/circ.bin

run_cmdfile:
	Assembler/./asm.out Assembler/cmdfile.txt Assembler/machinecode.bin
	Processor/./proc.out Assembler/machinecode.bin

clean:
	rm -rf *.txt



    