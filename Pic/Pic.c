#include "Pic.h"

char* Read (const char* filename)
{
    FILE* buffer = fopen (filename, "r");
    assert (buffer != NULL);

    fseek(buffer, 0, SEEK_SET);
    long start_of_File = ftell (buffer);

    fseek(buffer, 0, SEEK_END);
    long end_of_File = ftell (buffer);

    fseek(buffer, 0, SEEK_SET);
    long size_File = end_of_File - start_of_File;

    char* ptrbuf = (char*) calloc (size_File + 1, sizeof (char));
    assert (ptrbuf != NULL);

    long real_size_File = fread (ptrbuf, sizeof (char), size_File, buffer);

    fclose (buffer);

    *(ptrbuf + real_size_File + 1) = '\0';

    ptrbuf = (char*) realloc (ptrbuf, real_size_File + 1);
    assert (ptrbuf != NULL);

    return (char*)ptrbuf;
}

int Buffer_To_Asm (const char* ptrbuf, const char* filename)
{
    FILE* picasm = fopen (filename, "w");

    size_t ip = 0;

    while (ptrbuf[ip] == ' ' || ptrbuf[ip] == '\t' || ptrbuf[ip] == '\n' || ptrbuf[ip] == '\r')
    {
        ip++;
    }

    BREAK_IF

    unsigned char width = Char_Num_Scan (ptrbuf + ip);

    while (ptrbuf[ip] >= '0' && ptrbuf[ip] <= '9')
    {
        ip++;
    }

    if (ptrbuf[ip] != 'x' && ptrbuf[ip] != 'X' && ptrbuf[ip] != '*')
    {
        printf ("Illegal symbol between width and high\n");
        return ERR;
    }
    BREAK_IF

    ip++;
    
    unsigned char high = Char_Num_Scan (ptrbuf + ip);

    while (ptrbuf[ip] >= '0' && ptrbuf[ip] <= '9')
    {
        ip++;
    }

    fprintf (picasm, "PUSH %d\nPUSH %d\nSET\n", width, high);

    unsigned char x = 0;
    unsigned char high_minus_y = 0;
    
    while (ptrbuf[ip] != '\0')
    {
        if (ptrbuf[ip] == '\r')
        {
            high_minus_y++;
            x = 0;
            ip++;
        }
        else if (ptrbuf[ip] == '\n')
        {
            high_minus_y++;
            x = 0;
        }
        else if (ptrbuf[ip] == ' ')
        {
            x++;
        }
        else if (ptrbuf[ip] == '+')
        {
            fprintf (picasm, "PUSH %d\nPUSH %d\nDRAW\n", x, high - high_minus_y);
            x++;
        }
        else
        {
            printf ("Incorrect letter in line %d\n", high_minus_y);
            printf ("ptrbuf[ip] = %c (%d)\n", ptrbuf[ip], ptrbuf[ip]);
        }
        ip++;
    }

    fprintf (picasm, "PIC\nHLT\n");
    fclose (picasm);

    return NO_ERR;
}

char Char_Num_Scan  (const char* ptrnum)
{
    int len = 0;
    int i = 0;
    unsigned char num = 0;

    while (ptrnum[len] >= '0' && ptrnum[len] <= '9')
    {
        len++;
    }

    while (len != 0)
    {
        num += (ptrnum[i] - '0') * char_pow_10 (len - 1);
        len--;
        i++;
    }

    return num;

}

char char_pow_10 (int power)
{
    char res = 1;

    for (int i = 0; i < power; i++)
    {
        res *= 10;
    }

    return res;
}