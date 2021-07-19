#include <stdint.h>
#include <stdio.h>

extern "C" __attribute__((visibility("default"))) __attribute__((used))
int32_t
native_add()
{
    return 30 + 20;
}

int main()
{
    printf("%d\n", native_add());
}