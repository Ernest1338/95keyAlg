def gen_key()
    # generating random number in range from 0 to 999 (max 3 digit number)
    first_three_digits = rand(0..999).to_s

    while first_three_digits=="333" || first_three_digits=="444" || first_three_digits=="555" || first_three_digits=="666" ||
        first_three_digits=="777" || first_three_digits=="888" || first_three_digits=="999"
        # regenerating random number to the point when they are not repeating (excluding 111 and 222)
        first_three_digits = rand(0..999).to_s
    end

    while first_three_digits.length<3
        # adding trailing zeros if necessary (to match length of 3)
        first_three_digits += "0"
    end

    # generating random number in range from 0 to 999999 (max 6 digit number)
    mul_of_seven = rand(0..999999).to_s

    # creating variable which will be use to count sum of all digits generated in the previous step
    num_added_together = 0

    # iterating over each digit in variable mul_of_seven
    for i in mul_of_seven.split("").each
        # adding digit to variable num_added_together
        num_added_together += Integer(i)
    end

    while mul_of_seven.length<6
        # adding trailing zeros if necessary (to match length of 6)
        mul_of_seven += "0"
    end

    # searching for remainder value to make mul_of_seven divisible by 7
    for i in 0..6
        if (num_added_together+(i+1))%7==0
            # adding this value to the end of mul_of_seven variable
            mul_of_seven += (i+1).to_s
            break
        end
    end

    # combining all needed variables with dashes and other constants into variable named key
    key = first_three_digits+"-"+mul_of_seven

    # displaying generated key to user
   puts key
end

def gen_oem()
    # generating random number in range from 1 to 366
    first_three_digits = rand(1..366).to_s

    while first_three_digits.length<3
        # adding zeros at the beginning if necessary (to match length of 3)
        first_three_digits = "0"+first_three_digits
    end

    # generating random number in range from 95 to 102
    second_two_digits = rand(95..102).to_s

    if second_two_digits.length==3
        # if generated number is 3 digits long then remove first digit
        second_two_digits = second_two_digits[1..3]
    end

    # generating random number in range from 0 to 99999 (max 5 digit number)
    mul_of_seven = rand(0..99999).to_s

    # creating variable which will be use to count sum of all digits generated in the previous step
    num_added_together = 0

    # iterating over each digit in variable mul_of_seven
    for i in mul_of_seven.split("").each
        # adding digit to variable num_added_together
        num_added_together += Integer(i)
    end

    while mul_of_seven.length<5
        # adding trailing zeros if necessary (to match length of 5)
        mul_of_seven += "0"
    end

    # searching for remainder value to make mul_of_seven divisible by 7
    for i in 0..6
        if (num_added_together+(i+1))%7==0
            # adding this value to the end of mul_of_seven variable
            mul_of_seven += (i+1).to_s
            break
        end
    end

    # generating random number in range from 0 to 99999 (max 5 digit number)
    last_five_digits = rand(0..99999).to_s

    while last_five_digits.length<5
        # adding trailing zeros if necessary (to match length of 5)
        last_five_digits += "0"
    end

    # combining all needed variables with dashes and other constants into variable named key
    key = first_three_digits+second_two_digits+"-OEM-0"+mul_of_seven+"-"+last_five_digits

    # displaying generated key to user
    puts key
end

def main()

    puts "5 CD Keys:"

    # generating 5 keys (and displaying them)
    for _ in 1..5
        gen_key()
    end

    # generating 5 OEM keys (and displaying them)
    puts "\n5 CD Keys (OEM):"

    for _ in 1..5
        gen_oem()
    end
end

# executing main function
main()
