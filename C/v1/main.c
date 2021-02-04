#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <math.h>
#include <string.h>

// NOTE: This code is especially bad. This was my close to first try writing code in pure C.

int lenHelper(unsigned x) {
    if (x >= 1000000000) return 10;
    if (x >= 100000000)  return 9;
    if (x >= 10000000)   return 8;
    if (x >= 1000000)    return 7;
    if (x >= 100000)     return 6;
    if (x >= 10000)      return 5;
    if (x >= 1000)       return 4;
    if (x >= 100)        return 3;
    if (x >= 10)         return 2;
    return 1;
}

int printLen(int x) {
    return x < 0 ? lenHelper(-x) + 1 : lenHelper(x);
}

void gen_key() {
    int first_three_digits = rand() % 999+1;

    while(first_three_digits==333 || first_three_digits==444 || first_three_digits==555 
        || first_three_digits==666 || first_three_digits==777 || first_three_digits==888
        || first_three_digits==999) {
        first_three_digits = rand() % 999+1;
    }

    while(printLen(first_three_digits)<3) {
        first_three_digits*=10;
    }

    int num_of_len_seven= rand() % 9999999+1;
    int num_added_together = 0;
    int copy_of_num_of_len_seven = num_of_len_seven;

    for(int i=0; i<printLen(num_of_len_seven); i++) {
        num_added_together+=(copy_of_num_of_len_seven%10);
        copy_of_num_of_len_seven/=10;
    }

    while(num_added_together%7!=0) {
        num_of_len_seven= rand() % 9999999+1;
        num_added_together = 0;
        copy_of_num_of_len_seven = num_of_len_seven;

        for(int i=0; i<printLen(num_of_len_seven); i++) {
            num_added_together+=(copy_of_num_of_len_seven%10);
            copy_of_num_of_len_seven/=10;
        }
    }

    while(printLen(num_of_len_seven)<7) {
        num_of_len_seven*=10;
    }

    printf("%i%s%i\n", first_three_digits, "-", num_of_len_seven);
}

void gen_oem() {
    int first_three_digits = rand() % 365+2;
    int first_three_digits_length = printLen(first_three_digits);

    int second_two_digits = rand() % 8+95;

    int num_of_len_seven= rand() % 999999+1;
    int num_added_together = 0;
    int copy_of_num_of_len_seven = num_of_len_seven;

    for(int i=0; i<printLen(num_of_len_seven); i++) {
        num_added_together+=(copy_of_num_of_len_seven%10);
        copy_of_num_of_len_seven/=10;
    }

    while(num_added_together%7!=0) {
        num_of_len_seven= rand() % 999999+1;
        num_added_together = 0;
        copy_of_num_of_len_seven = num_of_len_seven;

        for(int i=0; i<printLen(num_of_len_seven); i++) {
            num_added_together+=(copy_of_num_of_len_seven%10);
            copy_of_num_of_len_seven/=10;
        }
    }

    while(printLen(num_of_len_seven)<6) {
        num_of_len_seven*=10;
    }

    int last_five_digits = rand() % 99999+1;

    while(printLen(last_five_digits)<5) {
        last_five_digits*=10;
    }

    if(second_two_digits==100) {
        if(first_three_digits_length==1) {
            printf("00%i00-OEM-0%i-%i\n", first_three_digits, num_of_len_seven, last_five_digits);
        } else if(first_three_digits_length==2) {
            printf("0%i00-OEM-0%i-%i\n", first_three_digits, num_of_len_seven, last_five_digits);
        } else if(first_three_digits_length==3) {
            printf("%i00-OEM-0%i-%i\n", first_three_digits, num_of_len_seven, last_five_digits);
        }
    } else if(second_two_digits==101) {
        if(first_three_digits_length==1) {
            printf("00%i01-OEM-0%i-%i\n", first_three_digits, num_of_len_seven, last_five_digits);
        } else if(first_three_digits_length==2) {
            printf("0%i01-OEM-0%i-%i\n", first_three_digits, num_of_len_seven, last_five_digits);
        } else if(first_three_digits_length==3) {
            printf("%i01-OEM-0%i-%i\n", first_three_digits, num_of_len_seven, last_five_digits);
        }
    } else if(second_two_digits==102) {
        if(first_three_digits_length==1) {
            printf("00%i02-OEM-0%i-%i\n", first_three_digits, num_of_len_seven, last_five_digits);
        } else if(first_three_digits_length==2) {
            printf("0%i02-OEM-0%i-%i\n", first_three_digits, num_of_len_seven, last_five_digits);
        } else if(first_three_digits_length==3) {
            printf("%i02-OEM-0%i-%i\n", first_three_digits, num_of_len_seven, last_five_digits);
        }
    } else {
        if(first_three_digits_length==1) {
            printf("00%i%i-OEM-0%i-%i\n", first_three_digits, second_two_digits, num_of_len_seven, last_five_digits);
        } else if(first_three_digits_length==2) {
            printf("0%i%i-OEM-0%i-%i\n", first_three_digits, second_two_digits, num_of_len_seven, last_five_digits);
        } else if(first_three_digits_length==3) {
            printf("%i%i-OEM-0%i-%i\n", first_three_digits, second_two_digits, num_of_len_seven, last_five_digits);
        }
    }
}

int main() {
    time_t t;
    srand((unsigned) time(&t));
    printf("5 CD Keys:\n");
    for(int _=0; _<5; _++) {
        gen_key();
    }
    printf("\n5 CD Keys (OEM):\n");
    for(int _=0; _<5; _++) {
        gen_oem();
    }
    return 0;
}
