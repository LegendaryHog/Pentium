#include "Pic.h"

int main (int argc, char* argv[])
{
    char* ptrpic   = Read (argv[argc - 2]);

    if (Buffer_To_Asm (ptrpic, argv[argc - 1]) == ERR)
    {
        return -1;
    }
    return 0;
}