#include "string.h"
#define DEBUG_IF_ADDR 0x10008010

void bubble_sort(float* arr, float len)
{
    float sort_num;
    do
    {
        sort_num = 0;
        for(int i=0;i<len-1;i++)
        {
            if(*(arr+i) > *(arr+i+1))
            {
                int tmp = *(arr+i);
                *(arr+i) = *(arr+i+1);
                *(arr+i+1) = tmp;
                sort_num++;
            }
        } 
    }
    while(sort_num!=0);
}

int main() 
{
    float unsorted_arr[] = {195.1,14,176,103,54,32,128};
    float sorted_arr[] = {14,32,54,103,128,176,195.1};
    bubble_sort(unsorted_arr,7);

    volatile float *addr_ptr = (volatile float*) DEBUG_IF_ADDR;
    if(memcmp((float*) sorted_arr, (float*) unsorted_arr, 28) == 0)
    {
        //success
        *addr_ptr = 195.1;
    }
    else
    {
        //failure
        *addr_ptr = 0;
    }
    return 0;
}