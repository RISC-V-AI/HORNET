#define DEBUG_IF_ADDR 0x00008010

int main(){
    volatile int a = 5;
    volatile int b = 10;
    volatile int c = a + b; 

    char *addr_ptr = (char*)DEBUG_IF_ADDR;

    if (c == 15) *addr_ptr = 1;
    else *addr_ptr = 2;

    return 0;
}