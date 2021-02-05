package main

import (
    "fmt"
    "math/rand"
    "time"
    "strconv"
)

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
    s1 := rand.NewSource(time.Now().UnixNano())
    r1 := rand.New(s1)
    
    var first_three_digits string = strconv.Itoa(r1.Intn(999))
    
    for first_three_digits=="333" || first_three_digits=="444" || first_three_digits=="555" || first_three_digits=="666" || first_three_digits=="777" || first_three_digits=="888" || first_three_digits=="999" {
        first_three_digits = strconv.Itoa(r1.Intn(999))
    }
    
    for len(first_three_digits)<3 {
        first_three_digits += "0"
    }
    
    var mul_of_seven int = r1.Intn(9999999)
    var num_added_together int = sumDigits(mul_of_seven)
    
    for num_added_together%7!=0 {
        mul_of_seven = r1.Intn(9999999)
        num_added_together = sumDigits(mul_of_seven)
    }
    
    var mul_of_seven_string string = strconv.Itoa(mul_of_seven)
    
    for len(mul_of_seven_string)<7 {
        mul_of_seven_string += "0"
    }
    
    var key string = first_three_digits+"-"+mul_of_seven_string
    
    fmt.Println(key)
}

func gen_oem() {
    s1 := rand.NewSource(time.Now().UnixNano())
    r1 := rand.New(s1)
    
    var first_three_digits string = strconv.Itoa(r1.Intn(365)+1)
    
    for len(first_three_digits)<3 {
        first_three_digits += "0"
    }
    
    var second_two_digits string = strconv.Itoa(r1.Intn(8)+95)
    
    if len(second_two_digits)==3 {
        second_two_digits = second_two_digits[1:]
    }
    
    var mul_of_seven int = r1.Intn(999999)
    var num_added_together int = sumDigits(mul_of_seven)
    
    for num_added_together%7!=0 {
        mul_of_seven = r1.Intn(999999)
        num_added_together = sumDigits(mul_of_seven)
    }
    
    var mul_of_seven_string string = strconv.Itoa(mul_of_seven)
    
    for len(mul_of_seven_string)<6 {
        mul_of_seven_string += "0"
    }
    
    var last_five_digits string = strconv.Itoa(r1.Intn(99999))
    
    for len(last_five_digits)<5 {
        last_five_digits += "0"
    }
    
    var key string = first_three_digits+second_two_digits+"-OEM-0"+mul_of_seven_string+"-"+last_five_digits
    
    fmt.Println(key)
}

func main() {
    fmt.Println("5 CD Keys:")
    for i := 0; i < 5; i++ {
        gen_key()
    }
    fmt.Println("\n5 CD Keys (OEM):")
    for i := 0; i < 5; i++ {
        gen_oem()
    }
}
