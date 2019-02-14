#include "../lib/retlibc.h"
#include "ucsh.h"

void shell()
{
     char cmd = char[256];
     while (1){
	  int i = 0;
	  int part = 0;
	  while(cmd[i]!= '\r'){
	       cmd[i] = readKey();
	       if (cmd[i] == '(')
		    part = i;
	  }
	  char temp = char[part];
	  memcpy(temp,&cmd[256], part);
	  if (chkCmd(temp)+1){
	       char toprint = char[i - part - 2];
	       u = 0;
	       for(; u < (i-2), u++)
		    toprint[u] = cmd[u];
	       ucprint(toprint);
	  }
     }
}

int chkCmd(char* cmd,int end)
{
     char commandList = "print"
     int i = 0;
     for(; i < end; i++){
	  if(cmd[i] != commandList[i])
	       return -1;
     }
     return 0
}
