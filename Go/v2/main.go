package main

import (
    "fmt"
    "math/rand"
    "time"
    "strconv"
)

// helper function returning sum of digits in a number
func sumDigits(number int) int {  
    remainder := 0  
    sumResult := 0  
    for number != 0 {  
        remainder = number % 10  
        sumResult += remainder  
        number = number / 10  
    }  
    return sumResult
} 

func gen_key() {
    // seeding random number generator based on system time
    s1 := rand.NewSource(time.Now().UnixNano())

    // creating new random number generator
    r1 := rand.New(s1)

    // generating random number in range from 0 to 999 (max 3 digit number)
    var first_three_digits string = strconv.Itoa(r1.Intn(999))

    for first_three_digits=="333" || first_three_digits=="444" || first_three_digits=="555" || first_three_digits=="666" || first_three_digits=="777" || first_three_digits=="888" || first_three_digits=="999" {
        // regenerating random number to the point when they are not repeating (excluding 111 and 222)
        first_three_digits = strconv.Itoa(r1.Intn(999))
    }

    for len(first_three_digits)<3 {
        // adding trailing zeros if necessary (to match length of 3)
        first_three_digits += "0"
    }

    // generating random number in range from 0 to 999999 (max 6 digit number)
    var mul_of_seven int = r1.Intn(999999)

    // creating variable and assigning to it sum of all digits generated in the previous step
    var num_added_together int = sumDigits(mul_of_seven)

    // converting variable mul_of_seven to type string and assigning it to variable mul_of_seven_string
    var mul_of_seven_string string = strconv.Itoa(mul_of_seven)

    for len(mul_of_seven_string)<6 {
        // adding trailing zeros if necessary (to match length of 6)
        mul_of_seven_string += "0"
	}
	
	// searching for remainder value to make mul_of_seven divisible by 7
	for i := 0; i < 7; i++ {
		if (num_added_together+(i+1))%7==0 {
			// adding this value to the end of mul_of_seven variable
			mul_of_seven_string += strconv.Itoa(i+1)
			break;
		}
	}

    // combining all needed variables with dashes and other constants into variable named key
    var key string = first_three_digits+"-"+mul_of_seven_string

    // displaying generated key to user
    fmt.Println(key)
}

func gen_oem() {
    // seeding random number generator based on system time
    s1 := rand.NewSource(time.Now().UnixNano())

    // creating new random number generator
    r1 := rand.New(s1)

    // generating random number in range from 1 to 366 (max 3 digit number)
    var first_three_digits string = strconv.Itoa(r1.Intn(365)+1)

    for len(first_three_digits)<3 {
        // adding zeros at the beginning if necessary (to match length of 3)
        first_three_digits += "0"
    }

    // generating random number in range from 95 to 102
    var second_two_digits string = strconv.Itoa(r1.Intn(8)+95)

    if len(second_two_digits)==3 {
        // if generated number is 3 digits long then remove first digit
        second_two_digits = second_two_digits[1:]
    }

    // generating random number in range from 0 to 99999 (max 5 digit number)
    var mul_of_seven int = r1.Intn(99999)

    // creating variable and assigning to it sum of all digits generated in the previous step
    var num_added_together int = sumDigits(mul_of_seven)

    // converting variable mul_of_seven to type string and assigning it to variable mul_of_seven_string
    var mul_of_seven_string string = strconv.Itoa(mul_of_seven)

    for len(mul_of_seven_string)<5 {
        // adding trailing zeros if necessary (to match length of 5)
        mul_of_seven_string += "0"
	}
	
	// searching for remainder value to make mul_of_seven divisible by 7
	for i := 0; i < 7; i++ {
		if (num_added_together+(i+1))%7==0 {
			// adding this value to the end of mul_of_seven variable
			mul_of_seven_string += strconv.Itoa(i+1)
			break;
		}
	}

    // generating random number in range from 0 to 99999 (max 5 digit number)
    var last_five_digits string = strconv.Itoa(r1.Intn(99999))

    for len(last_five_digits)<5 {
        // adding trailing zeros if necessary (to match length of 5)
        last_five_digits += "0"
    }

    // combining all needed variables with dashes and other constants into variable named key
    var key string = first_three_digits+second_two_digits+"-OEM-0"+mul_of_seven_string+"-"+last_five_digits

    // displaying generated key to user
    fmt.Println(key)
}

func main() {

    fmt.Println("5 CD Keys:")

    // generating 5 keys (and displaying them)
    for i := 0; i < 5; i++ {
        gen_key()
    }

    fmt.Println("\n5 CD Keys (OEM):")

    // generating 5 OEM keys (and displaying them)
    for i := 0; i < 5; i++ {
        gen_oem()
    }
}
