
#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include "randomNumber.h"

int fetch_number()
{
    int c, n;
    srand(time(0));
    n = rand() % 100 + 1;
    return n;
}

int main()
{
    int number = fetch_number();

    printf("Random number : %d\n", fetch_number());
    return 0;
}
