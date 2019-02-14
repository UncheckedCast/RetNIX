#include "readkey.h"

extern readKb(void);
#pragma aux readKB modify[ah al] value[al] =	\
     "mov AH,0x00"				\
     "int 0x16";

char readKey(void)
{
     return (char) (readKb() &0xff);
}
