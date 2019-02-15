#include "../lib/retlibc.h"
#include "ucsh.h"

//#pragma aux 

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
	       ucprint(in[i]);
	       if (in[i] == '(')
		    part = i;
	  }
	  ucprint("\r\l");
	  for (; z < part; z++)
	       cmd[z] = in[z];
	  if (chkCmd(cmd,part)){
	       char toprint[5];
	       int u = part+2;
	       for(; u < (i-2); u++){
		    toprint[u] = in[u];
	       }
	       ucprint(toprint);
	  }
     }
}

int chkCmd(char* cmd, int end)
{
     char commandList[] = "print";
     int i = 0;
     for(; i < end; i++){
	  if(cmd[i] != commandList[i]){
	       return 0;
	  }
     }
     return 1;
}
