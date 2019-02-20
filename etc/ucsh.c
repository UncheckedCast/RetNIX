#include "../lib/retlibc.h"
#include "ucsh.h"

void shell()
{
     while(1){
	  char in[256];
	  int i = 0;
	  int part = 0;
	  char cmd[12]; // TODO: Replace with malloc
	  int z = 0;
	  while (in[i] != '\r'){
	       in[i] = readKey();
	       ucprint(&in[i]);
	       if (in[i] == '(')
		    part = i;
	  }
	  ucprint("\r\l");
	  for (; z < part; z++)
	       cmd[z] = in[z];
	  runCmd(cmd,in,part);
     }
}

int runCmd(char* cmd, char* in, int end)
{
     char toprint[20];
     int u = end+2;
     char commandList[] = "print";
     int i = 0;
     for(; i < end; i++){
	  if(cmd[i] != commandList[i]){
	       return 0;
	  }
     }
     for(; u < (i-2); u++){
	  toprint[u] = in[u];
     }
     ucprint(toprint);
     return 1;
}
