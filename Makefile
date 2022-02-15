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
	Assembler/./asm.out Asm_progs/Quad.txt Asm_progs/Quad.bin
	Processor/./proc.out Asm_progs/Quad.bin

run_pic:
	Pic/./pict.out Pic/Pic.txt Asm_progs/picasm.txt
	Assembler/./asm.out Asm_progs/picasm.txt Asm_progs/pic.bin
	Processor/./proc.out Asm_progs/pic.bin

run_circul:
	Assembler/./asm.out Asm_progs/Circul.txt Asm_progs/circ.bin
	Processor/./proc.out Asm_progs/circ.bin

run_cmdfile:
	Assembler/./asm.out Asm_progs/cmdfile.txt Asm_progs/machinecode.bin
	Processor/./proc.out Asm_progs/machinecode.bin

run_heart:
	Assembler/./asm.out Asm_progs/heart.txt Asm_progs/heart.bin
	Processor/./proc.out Asm_progs/heart.bin

clean:
	rm -rf *.txt
	


    