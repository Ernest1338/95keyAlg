function gen_key()
    local first_three_digits = tostring(math.random(0,999))
    
    while(first_three_digits=="333" or first_three_digits=="444" or first_three_digits=="555" or first_three_digits=="666" 
        or first_three_digits=="777" or first_three_digits=="888" or first_three_digits=="999") do
        first_three_digits = tostring(math.random(0,999))
    end

    while(string.len(first_three_digits)<3) do
        first_three_digits = first_three_digits.."0"
    end
    
    local mul_of_seven = tostring(math.random(0,9999999))
    local num_added_together = 0;
    
    for i in mul_of_seven:gmatch"." do
        num_added_together = num_added_together + i
    end
    
    while(num_added_together%7~=0) do
        mul_of_seven = tostring(math.random(0,9999999))
        num_added_together = 0;
        
        for i in mul_of_seven:gmatch"." do
            num_added_together = num_added_together + i
        end
    end
    
    while(string.len(mul_of_seven)<7) do
        mul_of_seven = mul_of_seven.."0"
    end
    
    local key = first_three_digits.."-"..mul_of_seven
    
    print(key)
end

function gen_oem()
    local first_three_digits = tostring(math.random(1,366))
    
    while(string.len(first_three_digits)<3) do
        first_three_digits = "0"..first_three_digits
    end
    
    local second_two_digits = tostring(math.random(95,102))
    
    if(string.len(second_two_digits)==3) then
        second_two_digits = string.sub(second_two_digits, 2)
    end
    
    local mul_of_seven = tostring(math.random(0,999999))
    local num_added_together = 0;
    
    for i in mul_of_seven:gmatch"." do
        num_added_together = num_added_together + i
    end
    
    while(num_added_together%7~=0) do
        mul_of_seven = tostring(math.random(0,999999))
        num_added_together = 0;
        
        for i in mul_of_seven:gmatch"." do
            num_added_together = num_added_together + i
        end
    end
    
    while(string.len(mul_of_seven)<6) do
        mul_of_seven = mul_of_seven.."0"
    end
    
    local last_five_digits = tostring(math.random(0,99999))
    
    while(string.len(last_five_digits)<5) do
        last_five_digits = last_five_digits.."0"
    end
    
    local key = first_three_digits..second_two_digits.."-OEM-0"..mul_of_seven.."-"..last_five_digits
    
    print(key)
end

function main()
    math.randomseed(os.time())
    print("5 CD Keys:")
    for i=0,5,1 do
        gen_key()
    end
    print("\n5 CD Keys (OEM):")
    for i=0,5,1 do
        gen_oem()
    end
end

main()
