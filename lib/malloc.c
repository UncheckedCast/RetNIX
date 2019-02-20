//RetNIX impletation of malloc
#includes "malloc.h"

void *endpoint = 0x1000; //TODO: Change to actual value

void setep(const *void point)
{
     endpoint = point;
}

void* malloc(const int n)
{
     *void temp = endpoint;
     endpoint = enpoint + n;
     return temp;
}
