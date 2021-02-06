def gen_key()
    first_three_digits = rand(0..999).to_s
   
    while first_three_digits=="333" || first_three_digits=="444" || first_three_digits=="555" || first_three_digits=="666" ||
        first_three_digits=="777" || first_three_digits=="888" || first_three_digits=="999"
        first_three_digits = rand(0..999).to_s
    end
    
    while first_three_digits.length<3
        first_three_digits += "0"
    end
    
    mul_of_seven = rand(0..9999999).to_s
    num_added_together = 0
    
    for i in mul_of_seven.split("").each
        num_added_together += Integer(i)
    end
    
    while num_added_together%7!=0
        mul_of_seven = rand(0..9999999).to_s
        num_added_together = 0
        
        for i in mul_of_seven.split("").each
            num_added_together += Integer(i)
        end
    end
    
    while mul_of_seven.length<7
        mul_of_seven += "0"
    end
    
    key = first_three_digits+"-"+mul_of_seven
   
   puts key
end

def gen_oem()
    first_three_digits = rand(1..366).to_s
    
    while first_three_digits.length<3
        first_three_digits = "0"+first_three_digits
    end
    
    second_two_digits = rand(95..102).to_s
    
    if second_two_digits.length==3
        second_two_digits = second_two_digits[1..3]
    end
    
    mul_of_seven = rand(0..999999).to_s
    num_added_together = 0
    
    for i in mul_of_seven.split("").each
        num_added_together += Integer(i)
    end
    
    while num_added_together%7!=0
        mul_of_seven = rand(0..999999).to_s
        num_added_together = 0
        
        for i in mul_of_seven.split("").each
            num_added_together += Integer(i)
        end
    end
    
    while mul_of_seven.length<6
        mul_of_seven += "0"
    end
    
    last_five_digits = rand(0..99999).to_s
    
    while last_five_digits.length<5
        last_five_digits += "0"
    end
    
    key = first_three_digits+second_two_digits+"-OEM-0"+mul_of_seven+"-"+last_five_digits
    
    puts key
end

def main()
    puts "5 CD Keys:"
    for _ in 1..5
        gen_key()
    end
    puts "\n5 CD Keys (OEM):"
    for _ in 1..5
        gen_oem()
    end
end

main()
