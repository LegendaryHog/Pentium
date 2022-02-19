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
	Assembler/./asm.out Asm_Progs/Quad.txt Asm_Progs/Quad.bin
	Processor/./proc.out Asm_Progs/Quad.bin

run_pic:
	Pic/./pict.out Pic/Pic.txt Asm_Progs/picasm.txt
	Assembler/./asm.out Asm_Progs/picasm.txt Asm_Progs/pic.bin
	Processor/./proc.out Asm_Progs/pic.bin

run_circul:
	Assembler/./asm.out Asm_Progs/Circul.txt Asm_Progs/circ.bin
	Processor/./proc.out Asm_Progs/circ.bin

run_cmdfile:
	Assembler/./asm.out Asm_Progs/cmdfile.txt Asm_Progs/machinecode.bin
	Processor/./proc.out Asm_Progs/machinecode.bin

run_heart:
	Assembler/./asm.out Asm_Progs/heart.txt Asm_Progs/heart.bin
	Processor/./proc.out Asm_Progs/heart.bin

clean:
	rm -rf *.txt
	


    