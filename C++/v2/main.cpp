#include <iostream>
#include <cstdlib>
#include <ctime>

void gen_key() {
    // generating random number in range from 0 to 999 (max 3 digit number)
    std::string first_three_digits = std::to_string(rand() % 999+1);

    while(first_three_digits=="333" || first_three_digits=="444" || first_three_digits=="555" || first_three_digits=="666" 
        || first_three_digits=="777" || first_three_digits=="888" || first_three_digits=="999") {
        // regenerating random number to the point when they are not repeating (excluding 111 and 222)
        first_three_digits = std::to_string(rand() % 999+1);
    }

    while(first_three_digits.size()<3) {
        // adding trailing zeros if necessary (to match length of 3)
        first_three_digits += "0";
    }
    
    // generating random number in range from 0 to 999999 (max 6 digit number)
    std::string mul_of_seven = std::to_string(rand() % 999999+1);

    // creating variable which will be use to count sum of all digits generated in the previous step
    int num_added_together = 0;

    // iterating over each digit in variable mul_of_seven
    for(char i : mul_of_seven) {
        // converting (digit) character to (digit) string
        std::string string_from_char(1, i);

        // converting (digit) string to (digit) integer and adding it to variable num_added_together
        num_added_together += std::stoi(string_from_char);
    }

    while(mul_of_seven.size()<6) {
        // adding trailing zeros if necessary (to match length of 6)
        mul_of_seven+="0";
    }

    // searching for remainder value to make mul_of_seven divisible by 7
    for(int i=0; i<7; i++) {
        if((num_added_together+(i+1))%7==0) {
            // adding this value to the end of mul_of_seven variable
            mul_of_seven+=std::to_string(i+1);
            break;
        }
    }

    // combining all needed variables with dashes and other constants into variable named key
    std::string key = first_three_digits+"-"+mul_of_seven;

    // displaying generated key to user
    std::cout << key << std::endl;
}

void gen_oem() {
    // generating random number in range from 1 to 366 (max 3 digit number)
    std::string first_three_digits = std::to_string(rand() % 365 + 1);

    while(first_three_digits.size()<3) {
        // adding zeros at the beginning if necessary (to match length of 3)
        first_three_digits = "0"+first_three_digits;
    }

    // generating random number in range from 95 to 102
    std::string second_two_digits = std::to_string(rand() % (102+1-95) + 95);

    if(second_two_digits.size()==3) {
        // if generated number is 3 digits long then remove first digit
        second_two_digits.erase(0, 1);
    }

    // generating random number in range from 0 to 99999 (max 5 digit number)
    std::string mul_of_seven = std::to_string(rand() % 99999+1);

    // creating variable which will be use to count sum of all digits generated in the previous step
    int num_added_together = 0;

    // iterating over each digit in variable mul_of_seven
    for(char i : mul_of_seven) {
        // converting (digit) character to (digit) string
        std::string string_from_char(1, i);

        // converting (digit) string to (digit) integer and adding it to variable num_added_together
        num_added_together += std::stoi(string_from_char);
    }

    while(mul_of_seven.size()<5) {
        // adding trailing zeros if necessary (to match length of 5)
        mul_of_seven+="0";
    }

    // generating random number in range from 0 to 99999 (max 5 digit number)
    std::string last_five_digits = std::to_string(rand() % 99999+1);

    while(last_five_digits.size()<5) {
        // adding trailing zeros if necessary (to match length of 5)
        last_five_digits+="0";
    }
    
    // searching for remainder value to make mul_of_seven divisible by 7
    for(int i=0; i<7; i++) {
        if((num_added_together+(i+1))%7==0) {
            // adding this value to the end of mul_of_seven variable
            mul_of_seven+=std::to_string(i+1);
            break;
        }
    }

    // combining all needed variables with dashes and other constants into variable named key
    std::string key = first_three_digits+second_two_digits+"-OEM-0"+mul_of_seven+"-"+last_five_digits;

    // displaying generated key to user
    std::cout << key << std::endl;
}

int main() {
    // seeding random number generator based on system time
    srand(time(NULL));

    std::cout << "5 CD Keys:" << std::endl;

    // generating 5 keys (and displaying them)
    for(int _=0; _<5; _++) {
        gen_key();
    }

    std::cout << std::endl << "5 CD Keys (OEM):" << std::endl;

    // generating 5 OEM keys (and displaying them)
    for(int _=0; _<5; _++) {
        gen_oem();
    }
}
