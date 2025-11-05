#define DEBUG_IF_ADDR 0x00008010

int main() {
    char *addr_ptr = (char*)DEBUG_IF_ADDR;
    
    volatile char a = 'a';
    volatile char b = 2;
    volatile char c = 0;

    c = a + b;

    *addr_ptr = c;


    return 0;
}