func gen_key() {
    // generating random number in range from 0 to 999 (max 3 digit number)
    var first_three_digits = String(Int.random(in: 0..<999+1))

    while first_three_digits=="333" || first_three_digits=="444" || first_three_digits=="555" || first_three_digits=="666" 
        || first_three_digits=="777" || first_three_digits=="888" || first_three_digits=="999" {
        // regenerating random number to the point when they are not repeating (excluding 111 and 222)
        first_three_digits = String(Int.random(in: 0..<999))
    }

    while first_three_digits.count<3 {
        // adding trailing zeros if necessary (to match length of 3)
        first_three_digits += "0"
    }

    // generating random number in range from 0 to 9999999 (max 7 digit number)
    var mul_of_seven_init = Int.random(in: 0..<9999999+1)

    // creating copy of variable mul_of_seven_init
    var mul_of_seven_copy = mul_of_seven_init

    // converting variable mul_of_seven_init to String and saving it to variable mul_of_seven
    var mul_of_seven = String(mul_of_seven_init)

    // creating variable which will be use to count sum of all digits in mul_of_seven variable
    var num_added_together = 0;

    // iterating over each digit in variable mul_of_seven
    for _ in mul_of_seven {
        // adding digit to variable num_added_together
        num_added_together += mul_of_seven_copy%10

        // changing the current digit
        mul_of_seven_copy /= 10
    }

    // repeating previous steps until generated number will be divisible by 7
    while num_added_together%7 != 0 {
        // regenerating random number in range from 0 to 9999999 (max 7 digit number)
        mul_of_seven_init = Int.random(in: 0..<9999999+1)

        // recreating copy of variable mul_of_seven_init
        mul_of_seven_copy = mul_of_seven_init

        // assigning String from variable mul_of_seven_init into the mul_of_seven variable
        mul_of_seven = String(mul_of_seven_init)

        // assigning 0 to variable used to sum digits from variable mul_of_seven
        num_added_together = 0;

        // summing digits in variable mul_of_seven to variable num_added_together
        for _ in mul_of_seven {
            num_added_together += mul_of_seven_copy%10
            mul_of_seven_copy /= 10
        }
    }

    while mul_of_seven.count<7 {
        // adding trailing zeros if necessary (to match length of 7)
        mul_of_seven += "0"
    }

    // combining all needed variables with dashes and other constants into variable named key
    let key = first_three_digits+"-"+mul_of_seven

    // displaying generated key to user
    print(key)
}

func gen_oem() {
    // generating random number in range from 1 to 366 (max 3 digit number)
    var first_three_digits = String(Int.random(in: 1..<366+1))

    while first_three_digits.count<3 {
        // adding zeros at the beginning if necessary (to match length of 3)
        first_three_digits = "0"+first_three_digits
    }

    // generating random number in range from 95 to 102
    var second_two_digits = String(Int.random(in: 95..<102+1))

    if second_two_digits.count==3 {
        // if generated number is 3 digits long then remove first digit
        second_two_digits.removeFirst()
    }

    // generating random number in range from 0 to 999999 (max 6 digit number)
    var mul_of_seven_init = Int.random(in: 0..<999999+1)

    // creating copy of variable mul_of_seven_init
    var mul_of_seven_copy = mul_of_seven_init

    // converting variable mul_of_seven_init to String and saving it to variable mul_of_seven
    var mul_of_seven = String(mul_of_seven_init)

    // assigning 0 to variable used to sum digits from variable mul_of_seven
    var num_added_together = 0;

    // iterating over each digit in variable mul_of_seven
    for _ in mul_of_seven {
        // adding digit to variable num_added_together
        num_added_together += mul_of_seven_copy%10

        // changing the current digit
        mul_of_seven_copy /= 10
    }

    // repeating previous steps until generated number will be divisible by 7
    while num_added_together%7 != 0 {
        // regenerating random number in range from 0 to 999999 (max 6 digit number)
        mul_of_seven_init = Int.random(in: 0..<999999+1)

        // recreating copy of variable mul_of_seven_init
        mul_of_seven_copy = mul_of_seven_init

        // assigning String from variable mul_of_seven_init into the mul_of_seven variable
        mul_of_seven = String(mul_of_seven_init)

        // assigning 0 to variable used to sum digits from variable mul_of_seven
        num_added_together = 0;

        // summing digits in variable mul_of_seven to variable num_added_together
        for _ in mul_of_seven {
            num_added_together += mul_of_seven_copy%10
            mul_of_seven_copy /= 10
        }
    }

    while mul_of_seven.count<6 {
        // adding trailing zeros if necessary (to match length of 6)
        mul_of_seven += "0"
    }

    // generating random number in range from 0 to 99999 (max 5 digit number)
    var last_five_digits = String(Int.random(in: 0..<99999+1))

    while last_five_digits.count<5 {
        // adding trailing zeros if necessary (to match length of 5)
        last_five_digits += "0"
    }

    // combining all needed variables with dashes and other constants into variable named key
    let key = first_three_digits+second_two_digits+"-OEM-0"+mul_of_seven+"-"+last_five_digits

    // displaying generated key to user
    print(key)
}

func main() {

    print("5 CD Keys:")

    // generating 5 keys (and displaying them)
    for _ in 0..<5 {
        gen_key()
    }

    print("\n5 CD Keys (OEM):")

    // generating 5 OEM keys (and displaying them)
    for _ in 0..<5 {
        gen_oem()
    }
}

// executing main function
main()
