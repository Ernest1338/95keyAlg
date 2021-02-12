#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <math.h>
#include <string.h>

// helper function returning length of integer (number of digits)
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

// helper function which uses previous function to return proper length of integer (handles negative numbers)
int printLen(int x) {
    return x < 0 ? lenHelper(-x) + 1 : lenHelper(x);
}

void gen_key() {
    // generating random number in range from 0 to 999 (max 3 digit number)
    int first_three_digits = rand() % 999+1;

    while(first_three_digits==333 || first_three_digits==444 || first_three_digits==555 
        || first_three_digits==666 || first_three_digits==777 || first_three_digits==888
        || first_three_digits==999) {
        // regenerating random number to the point when they are not repeating (excluding 111 and 222)
        first_three_digits = rand() % 999+1;
    }

    while(printLen(first_three_digits)<3) {
        // adding trailing zeros if necessary (to match length of 3)
        first_three_digits*=10;
    }

    // generating random number in range from 0 to 999999 (max 6 digit number)
    int mul_of_seven= rand() % 999999+1;

    // creating variable which will be use to count sum of all digits generated in the previous step
    int num_added_together = 0;

    // creating copy of mul_of_seven variable which will be used to leave the original variable unchanged
    int copy_of_mul_of_seven = mul_of_seven;

    // iterating over each digit in variable mul_of_seven
    for(int i=0; i<printLen(mul_of_seven); i++) {
        // adding digit to variable num_added_together
        num_added_together+=(copy_of_mul_of_seven%10);

        // changing the current digit
        copy_of_mul_of_seven/=10;
    }

    while(printLen(mul_of_seven)<6) {
        // adding trailing zeros if necessary (to match length of 6)
        mul_of_seven*=10;
    }

    // searching for remainder value to make mul_of_seven divisible by 7
    for(int i=0; i<7; i++) {
        if((num_added_together+(i+1))%7==0) {
            // adding this value to the end of mul_of_seven variable
            mul_of_seven*=10;
            mul_of_seven+=(i+1);
            break;
        }
    }

    // combining all needed variables with dashes and other constants and displaying it to user
    printf("%i%s%i\n", first_three_digits, "-", mul_of_seven);
}

void gen_oem() {
    // generating random number in range from 1 to 366 (max 3 digit number)
    int first_three_digits = rand() % 365+2;

    // calculating length of variable first_three_digits
    int first_three_digits_length = printLen(first_three_digits);

    // generating random number in range from 95 to 102
    int second_two_digits = rand() % 8+95;

    // generating random number in range from 0 to 99999 (max 5 digit number)
    int mul_of_seven= rand() % 99999+1;

    // creating variable which will be use to count sum of all digits generated in the previous step
    int num_added_together = 0;

    // creating copy of mul_of_seven variable which will be used to leave the original variable unchanged
    int copy_of_mul_of_seven = mul_of_seven;

    // iterating over each digit in variable mul_of_seven
    for(int i=0; i<printLen(mul_of_seven); i++) {
        // adding digit to variable num_added_together
        num_added_together+=(copy_of_mul_of_seven%10);

        // changing the current digit
        copy_of_mul_of_seven/=10;
    }

    while(printLen(mul_of_seven)<5) {
        // adding trailing zeros if necessary (to match length of 5)
        mul_of_seven*=10;
    }

    // searching for remainder value to make mul_of_seven divisible by 7
    for(int i=0; i<7; i++) {
        if((num_added_together+(i+1))%7==0) {
            // adding this value to the end of mul_of_seven variable
            mul_of_seven*=10;
            mul_of_seven+=(i+1);
            break;
        }
    }

    // generating random number in range from 0 to 99999 (max 5 digit number)
    int last_five_digits = rand() % 99999+1;

    while(printLen(last_five_digits)<5) {
        // adding trailing zeros if necessary (to match length of 5)
        last_five_digits*=10;
    }

    // checking for value of second_two_digits and length of first_three_digits, displaying appropriate version of key based on the result of comparisons.
    // this is not a good way to do this! but for now it is good enough.
    if(second_two_digits==100) {
        if(first_three_digits_length==1) {
            printf("00%i00-OEM-0%i-%i\n", first_three_digits, mul_of_seven, last_five_digits);
        } else if(first_three_digits_length==2) {
            printf("0%i00-OEM-0%i-%i\n", first_three_digits, mul_of_seven, last_five_digits);
        } else if(first_three_digits_length==3) {
            printf("%i00-OEM-0%i-%i\n", first_three_digits, mul_of_seven, last_five_digits);
        }
    } else if(second_two_digits==101) {
        if(first_three_digits_length==1) {
            printf("00%i01-OEM-0%i-%i\n", first_three_digits, mul_of_seven, last_five_digits);
        } else if(first_three_digits_length==2) {
            printf("0%i01-OEM-0%i-%i\n", first_three_digits, mul_of_seven, last_five_digits);
        } else if(first_three_digits_length==3) {
            printf("%i01-OEM-0%i-%i\n", first_three_digits, mul_of_seven, last_five_digits);
        }
    } else if(second_two_digits==102) {
        if(first_three_digits_length==1) {
            printf("00%i02-OEM-0%i-%i\n", first_three_digits, mul_of_seven, last_five_digits);
        } else if(first_three_digits_length==2) {
            printf("0%i02-OEM-0%i-%i\n", first_three_digits, mul_of_seven, last_five_digits);
        } else if(first_three_digits_length==3) {
            printf("%i02-OEM-0%i-%i\n", first_three_digits, mul_of_seven, last_five_digits);
        }
    } else {
        if(first_three_digits_length==1) {
            printf("00%i%i-OEM-0%i-%i\n", first_three_digits, second_two_digits, mul_of_seven, last_five_digits);
        } else if(first_three_digits_length==2) {
            printf("0%i%i-OEM-0%i-%i\n", first_three_digits, second_two_digits, mul_of_seven, last_five_digits);
        } else if(first_three_digits_length==3) {
            printf("%i%i-OEM-0%i-%i\n", first_three_digits, second_two_digits, mul_of_seven, last_five_digits);
        }
    }
}

int main() {
    // creating variable of type time_t
    time_t t;
    
    // seeding random number generator based on system time
    srand((unsigned) time(&t));

    printf("5 CD Keys:\n");

    // generating 5 keys (and displaying them)
    for(int _=0; _<5; _++) {
        gen_key();
    }

    printf("\n5 CD Keys (OEM):\n");

    // generating 5 OEM keys (and displaying them)
    for(int _=0; _<5; _++) {
        gen_oem();
    }

    return 0;
}
