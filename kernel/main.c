#include "retkernel.h"
#include "../lib/retlibc.h"
#include "../etc/retnit.h"
//#include "../etc/ucsh.h"
void kmain()
{     
     // kmain may never return
  
     retinit();
     
     while (1){
	  ucprint("This OS was made by the UncheckedCast gang");
	  //shell();
     };
}
