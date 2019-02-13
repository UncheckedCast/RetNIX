#include "ucprint.h"

extern void printChar(char c);    
#pragma aux printChar parm[ax] modify[ax] = "call printChar";
void ucprint(char* out)
{
     int i = 0;
     while(out[i] != 0){
	  printChar(out[i++]);
     }
}
