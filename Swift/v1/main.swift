func gen_key() {
    var first_three_digits = String(Int.random(in: 0..<999+1))
    
    while first_three_digits=="333" || first_three_digits=="444" || first_three_digits=="555" || first_three_digits=="666" 
        || first_three_digits=="777" || first_three_digits=="888" || first_three_digits=="999" {
        first_three_digits = String(Int.random(in: 0..<999))
    }
    
    while first_three_digits.count<3 {
        first_three_digits += "0"
    }
    
    var mul_of_seven_init = Int.random(in: 0..<9999999+1)
    var mul_of_seven_copy = mul_of_seven_init
    var mul_of_seven = String(mul_of_seven_init)
    var num_added_together = 0;
    
    for _ in mul_of_seven {
        num_added_together += mul_of_seven_copy%10
        mul_of_seven_copy /= 10
    }
    
    while num_added_together%7 != 0 {
        mul_of_seven_init = Int.random(in: 0..<9999999+1)
        mul_of_seven_copy = mul_of_seven_init
        mul_of_seven = String(mul_of_seven_init)
        num_added_together = 0;
        
        for _ in mul_of_seven {
            num_added_together += mul_of_seven_copy%10
            mul_of_seven_copy /= 10
        }
    }
    
    while mul_of_seven.count<7 {
        mul_of_seven += "0"
    }

    let key = first_three_digits+"-"+mul_of_seven

    print(key)
}

func gen_oem() {
    var first_three_digits = String(Int.random(in: 1..<366+1))
    
    while first_three_digits.count<3 {
        first_three_digits = "0"+first_three_digits
    }
    
    var second_two_digits = String(Int.random(in: 95..<102+1))
    
    if second_two_digits.count==3 {
        second_two_digits.removeFirst()
    }
    
    var mul_of_seven_init = Int.random(in: 0..<999999+1)
    var mul_of_seven_copy = mul_of_seven_init
    var mul_of_seven = String(mul_of_seven_init)
    var num_added_together = 0;
    
    for _ in mul_of_seven {
        num_added_together += mul_of_seven_copy%10
        mul_of_seven_copy /= 10
    }
    
    while num_added_together%7 != 0 {
        mul_of_seven_init = Int.random(in: 0..<999999+1)
        mul_of_seven_copy = mul_of_seven_init
        mul_of_seven = String(mul_of_seven_init)
        num_added_together = 0;
        
        for _ in mul_of_seven {
            num_added_together += mul_of_seven_copy%10
            mul_of_seven_copy /= 10
        }
    }
    
    while mul_of_seven.count<6 {
        mul_of_seven += "0"
    }
    
    var last_five_digits = String(Int.random(in: 0..<99999+1))
    
    while last_five_digits.count<5 {
        last_five_digits += "0"
    }

    let key = first_three_digits+second_two_digits+"-OEM-0"+mul_of_seven+"-"+last_five_digits

    print(key)
}

func main() {
    print("5 CD Keys:")
    for _ in 0..<5 {
        gen_key()
    }
    print("\n5 CD Keys (OEM):")
    for _ in 0..<5 {
        gen_oem()
    }
}

main()
