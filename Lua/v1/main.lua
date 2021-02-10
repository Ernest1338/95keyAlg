function gen_key()
    -- generating random number in range from 0 to 999 (max 3 digit number)
    local first_three_digits = tostring(math.random(0,999))

    while(first_three_digits=="333" or first_three_digits=="444" or first_three_digits=="555" or first_three_digits=="666" 
        or first_three_digits=="777" or first_three_digits=="888" or first_three_digits=="999") do
        -- regenerating random number to the point when they are not repeating (excluding 111 and 222)
        first_three_digits = tostring(math.random(0,999))
    end

    while(string.len(first_three_digits)<3) do
        -- adding trailing zeros if necessary (to match length of 3)
        first_three_digits = first_three_digits.."0"
    end

    -- generating random number in range from 0 to 9999999 (max 7 digit number)
    local mul_of_seven = tostring(math.random(0,9999999))

    -- creating variable which will be use to count sum of all digits generated in the previous step
    local num_added_together = 0

    -- iterating over each digit in variable mul_of_seven
    for i in mul_of_seven:gmatch"." do
        -- adding digit to variable num_added_together
        num_added_together = num_added_together + i
    end

    -- repeating previous steps until generated number will be divisible by 7
    while(num_added_together%7~=0) do
        -- regenerating random number in range from 0 to 9999999 (max 7 digit number)
        mul_of_seven = tostring(math.random(0,9999999))

        -- assigning 0 to variable used to sum digits from variable mul_of_seven
        num_added_together = 0

        -- summing digits in variable mul_of_seven to variable num_added_together
        for i in mul_of_seven:gmatch"." do
            num_added_together = num_added_together + i
        end
    end

    while(string.len(mul_of_seven)<7) do
        -- adding trailing zeros if necessary (to match length of 7)
        mul_of_seven = mul_of_seven.."0"
    end

    -- combining all needed variables with dashes and other constants into variable named key
    local key = first_three_digits.."-"..mul_of_seven

    -- displaying generated key to user
    print(key)
end

function gen_oem()
    -- generating random number in range from 1 to 366 (max 3 digit number)
    local first_three_digits = tostring(math.random(1,366))

    while(string.len(first_three_digits)<3) do
        -- adding zeros at the beginning if necessary (to match length of 3)
        first_three_digits = "0"..first_three_digits
    end

    -- generating random number in range from 95 to 102
    local second_two_digits = tostring(math.random(95,102))

    if(string.len(second_two_digits)==3) then
        -- if generated number is 3 digits long then remove first digit
        second_two_digits = string.sub(second_two_digits, 2)
    end

    -- generating random number in range from 0 to 999999 (max 6 digit number)
    local mul_of_seven = tostring(math.random(0,999999))

    -- creating variable which will be use to count sum of all digits generated in the previous step
    local num_added_together = 0

    -- iterating over each digit in variable mul_of_seven
    for i in mul_of_seven:gmatch"." do
        -- adding digit to variable num_added_together
        num_added_together = num_added_together + i
    end

    -- repeating previous steps until generated number will be divisible by 7
    while(num_added_together%7~=0) do
        -- regenerating random number in range from 0 to 999999 (max 6 digit number)
        mul_of_seven = tostring(math.random(0,999999))

        -- assigning 0 to variable used to sum digits from variable mul_of_seven
        num_added_together = 0

        -- summing digits in variable mul_of_seven to variable num_added_together
        for i in mul_of_seven:gmatch"." do
            num_added_together = num_added_together + i
        end
    end

    while(string.len(mul_of_seven)<6) do
        -- adding trailing zeros if necessary (to match length of 6)
        mul_of_seven = mul_of_seven.."0"
    end

    -- generating random number in range from 0 to 99999 (max 5 digit number)
    local last_five_digits = tostring(math.random(0,99999))

    while(string.len(last_five_digits)<5) do
        -- adding trailing zeros if necessary (to match length of 5)
        last_five_digits = last_five_digits.."0"
    end

    -- combining all needed variables with dashes and other constants into variable named key
    local key = first_three_digits..second_two_digits.."-OEM-0"..mul_of_seven.."-"..last_five_digits

    -- displaying generated key to user
    print(key)
end

function main()
    -- seeding random number generator based on system time
    math.randomseed(os.time())

    print("5 CD Keys:")

    -- generating 5 keys (and displaying them)
    for i=0,5,1 do
        gen_key()
    end

    -- generating 5 OEM keys (and displaying them)
    print("\n5 CD Keys (OEM):")

    for i=0,5,1 do
        gen_oem()
    end
end

-- executing main function
main()
