#include <iostream>
#include <cstdlib>
#include <ctime>

void gen_key() {
    std::string first_three_digits = std::to_string(rand() % 999+1);

    while(first_three_digits=="333" || first_three_digits=="444" || first_three_digits=="555" || first_three_digits=="666" 
        || first_three_digits=="777" || first_three_digits=="888" || first_three_digits=="999") {
        first_three_digits = std::to_string(rand() % 999+1);
    }

    while(first_three_digits.size()<3) {
        first_three_digits += "0";
    }
    
    std::string num_len_of_seven = std::to_string(rand() % 9999999+1);
    int num_added_together = 0;

    for(char i : num_len_of_seven) {
        std::string string_from_char(1, i);
        num_added_together += std::stoi(string_from_char);
    }

    while(num_added_together%7!=0) {
        num_len_of_seven = std::to_string(rand() % 9999999+1);
        num_added_together = 0;

        for(char i : num_len_of_seven) {
            std::string string_from_char(1, i);
            num_added_together += std::stoi(string_from_char);
        }
    }

    while(num_len_of_seven.size()<7) {
        num_len_of_seven+="0";
    }

    std::string key = first_three_digits+"-"+num_len_of_seven;

    std::cout << key << std::endl;
}

void gen_oem() {
    std::string first_three_digits = std::to_string(rand() % 365 + 1);

    while(first_three_digits.size()<3) {
        first_three_digits = "0"+first_three_digits;
    }

    std::string second_two_digits = std::to_string(rand() % (102+1-95) + 95);

    if(second_two_digits.size()==3) {
        second_two_digits.erase(0, 1);
    }

    std::string num_len_of_seven = std::to_string(rand() % 9999999+1);
    int num_added_together = 0;

    for(char i : num_len_of_seven) {
        std::string string_from_char(1, i);
        num_added_together += std::stoi(string_from_char);
    }

    while(num_added_together%7!=0) {
        num_len_of_seven = std::to_string(rand() % 9999999+1);
        num_added_together = 0;

        for(char i : num_len_of_seven) {
            std::string string_from_char(1, i);
            num_added_together += std::stoi(string_from_char);
        }
    }

    while(num_len_of_seven.size()<7) {
        num_len_of_seven+="0";
    }

    std::string last_five_digits = std::to_string(rand() % 99999+1);

    while(last_five_digits.size()<5) {
        last_five_digits+="0";
    }

    std::string key = first_three_digits+second_two_digits+"-OEM-"+num_len_of_seven+"-"+last_five_digits;

    std::cout << key << std::endl;
}

int main() {
    srand(time(NULL));
    std::cout << "5 CD Keys:" << std::endl;
    for(int _=0; _<5; _++) {
        gen_key();
    }
    std::cout << std::endl << "5 CD Keys (OEM):" << std::endl;
    for(int _=0; _<5; _++) {
        gen_oem();
    }
}
