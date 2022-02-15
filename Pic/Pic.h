#ifndef PIC
#define PIc
#include <stdio.h>
#include <assert.h>
#include <stdlib.h>

enum ERR {
    ERR,
    NO_ERR,
};

#define BREAK_IF if (ptrbuf[ip] == '\0'){return ERR;}

char* Read          (const char* filename);

int   Buffer_To_Asm (const char* ptrbuf, const char* filename);

char  Char_Num_Scan (const char* ptrnum);

char  char_pow_10   (int power);
#endif

