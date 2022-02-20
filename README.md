# Pentium

[**1. Asm_Progs**](#asm_progs)

**2. Assembler**

**3. Pic**

**4. Processor**

**5. Makefile**

**6. commands.h**

**7. Compilate and run**

## 1. Asm_Progs
Programms writed for my Assembler. Accurate documentation in folder.

## 2. Assembler 
Programm that convert text code to machine code and write his in binary file. Accurate documentation in folder.

## 3. Pic 
Programm that scan picture, which you "draw" in text file with using spaces and pluses, and generate asm code to draw it by Processor.
Accurate documentation in folder.

## 4. Processor 
Programm that execute machine code from binary file. Accurate documentation in folder.

## 5. Makefile 
File that make connection between compilation of prorgamms and run of out files.
All commands must write in folder "Pentium".
### Objectives:
- "recomp_asm:"  (0)
    Recompilate Assembler and make out file in folder "Assembler". For use write in commnd string:
    ```
    make recomp_asm
    ```
- "recomp_proc:" (1)
    Recompilate Processor and make out file in folder "Processor". For use write in command string:
    ```
    make recomp_proc
    ```
- "recomp_pic:"  (2)
    Recompilate Pic and make out file in folder "Pic". For use write in command string:
    ```
    make recomp_pic
    ```
- "recomp_all:"  (3)
    Recompilate all Programms in "Pentium". Call objectives 0, 1, 2. For use write in command string:
    ```
    make recomp_all
    ```
- "run quad:"
    Run assembler programm "Quad" that solve any square equation. For use write in command string:
    ```
    make run_quad
    ```
- "run_pic:"
    Scan picture from "Pic/Pic.txt", generate assembler programm in "Asm_Progs/picasm.txt", assembling and processing programm.  After this picture drawn in console. For use write in command string:
    ```
    make run_pic
    ```
- "run_circul:"
    Assembling programm from "Asm_Progs/Circul.txt" and processing it. programm take radius of circul and draw it in console. For use write in command string:
    ```
    make run_circul
    ```
- **"run_cmdfile:"** 
    Assembling and processing code from "Asm_Progs/cmdfile.txt". For use write in command string:
    ```
    make run_cmdfile
    ```
- "run_heart:"
    Run asm programm that draw heart in console. For use write in command string:
    ```
    make run_heart
    ```
- **"run_RT_Erbe:"**
    Run asm programm that draw Erbe of first and the best Phystech School DREC (PH R T K on russian) and short name of Ph-t School on russian. For use write in command string:
    ```
    make run_RT_Erbe
    ```
- "clean:"
    Delete logfiles from folder "Pentium". For use write in command string:
    ```
    make clean
    ```

## 6. commands.h
Header file with prototypes of functional macros that include all informatiom about representation commands in code.
Example:
```c
DEF_CMD(name, num, args_num, code)
```
- name - name of command
- num  - number of command in enum
- args_num - sun of arguments
- code - code to case in switch in "Processor/Processor.c" in function Pentium ()
### Description of commands.
1. **PUSH**

5 - is example of const

rax - is example of register
```asm
push 5      ;put 5 in stack

push rax    ;put number from register rax to stack

push [5]    ;put number from five cell of RAM to stack

push [rax]  ;take number from register rax, discard fractional part and recieve natural number N and put number from N cell of RAM to stack

push rax + 5 ;take number from register rax sum it with 5 and put sum in stack

push rax - 5 ;take number from register rax subtract 5 from this number and put in stack

push [rax + 5] ;take number from register rax sum, discard fractional part, sum with 5 and recieve number N and put number from N cell
               ; of RAM to stack

push [rax - 5] ;similary with previous
```
2. **POP**

5 - is example of const

rax - is example of register
```asm
pop       ;take number from stack and throw in the trash box next to your house

pop rax   ;take number from stack and put it in register rax

pop [5]   ;take number from stack and put it in 5 cell of RAM

pop [rax] ;take number from register rax, discard fractional part and recieve number N
          ;after this take number from stack and put it in N cell of RAM

pop [rax + 5] ;take number from register rax, discard fractional part, sum with 5 and recieve number N
              ;after this take number from stack and put it in N cell of RAM
```
3. **JMP**

Description: jump to label (move stream of execution on command after label)

next: - example of label

```asm
jmp next:
    pop
next:
    push 5
;in this code skip "pop" and do only "push 5"
```
```asm
next:
    push 5
jmp next:
;in this code infinite cycle of "push 5"
```


4. **JAE**

Description: take two numbers from stack and compare. If last above or equal second of last - jump to

label, else - don't jump.

next:- example of label

```asm
push 5
push 4

jae next:
    push 1
next1:
    push 2
```

```asm
push 4 
push 5

jae next:
    push 1
next2:
    push 2
```
```asm
push 4 
push 4

jae next:
    push 1
next:
    push 2
```

5. **JBE**

Description:





