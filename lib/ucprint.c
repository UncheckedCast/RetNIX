#include "ucprint.h"

void ucprint(char out[])
{
     __asm__("msg db %1, 0x00" :: "a" (out));
     printstring();
}
