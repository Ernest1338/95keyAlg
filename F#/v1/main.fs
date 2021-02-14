// helper function returning string from passed int
let int2String x = sprintf "%i" x

let gen_key arg =
    // generating random number in range from 0 to 999 (max 3 digit number)
    let mutable first_three_digits = int2String ((new System.Random()).Next(0, 999))

    while (first_three_digits="333" || first_three_digits="444" || first_three_digits="555" || first_three_digits="666" || first_three_digits="777" || first_three_digits="888" || first_three_digits="999") do
        // regenerating random number to the point when they are not repeating (excluding 111 and 222)
        first_three_digits <- int2String ((new System.Random()).Next(0, 999))

    while (String.length first_three_digits<3) do
        // adding trailing zeros if necessary (to match length of 3)
        first_three_digits <- first_three_digits+"0"

    // generating random number in range from 0 to 9999999 (max 7 digit number)
    let mutable mul_of_seven = (new System.Random()).Next(0, 9999999)

    // creating copy of variable mul_of_seven
    let mutable mul_of_seven_copy = mul_of_seven

    // creating variable and assigning to it string from (int contained in) mul_of_seven
    let mutable mul_of_seven_final = int2String (mul_of_seven)

    // creating variable which will be use to count sum of all digits in mul_of_seven variable
    let mutable num_added_together = 0

    // iterating over each digit in variable mul_of_seven
    for i=0 to String.length mul_of_seven_final do
        // adding digit to variable num_added_together
        num_added_together <- num_added_together +  (mul_of_seven_copy%10)

        // changing the current digit
        mul_of_seven_copy <- mul_of_seven_copy / 10

    // repeating previous steps until generated number will be divisible by 7
    while (not(num_added_together%7=0)) do
        // regenerating random number in range from 0 to 9999999 (max 7 digit number)
        mul_of_seven <- (new System.Random()).Next(0, 9999999)

        // recreating copy of variable mul_of_seven
        mul_of_seven_copy <- mul_of_seven

        // assigning string from (int contained in) mul_of_seven to mul_of_seven_final
        mul_of_seven_final <- int2String (mul_of_seven)

        // assigning 0 to variable used to sum digits from variable mul_of_seven
        num_added_together <- 0

        // summing digits in variable mul_of_seven to variable num_added_together
        for i=0 to String.length mul_of_seven_final do
            num_added_together <- num_added_together +  (mul_of_seven_copy%10)
            mul_of_seven_copy <- mul_of_seven_copy / 10

    while (String.length mul_of_seven_final<7) do
        // adding trailing zeros if necessary (to match length of 7)
        mul_of_seven_final <- mul_of_seven_final+"0"

    // combining all needed variables with dashes and other constants into variable named key
    let key = first_three_digits+"-"+mul_of_seven_final

    // displaying generated key to user
    printfn "%s" key

let gen_oem arg =
    // generating random number in range from 1 to 366 (max 3 digit number)
    let mutable first_three_digits = int2String ((new System.Random()).Next(1, 366))

    while (String.length first_three_digits<3) do
        // adding zeros at the beginning if necessary (to match length of 3)
        first_three_digits <- "0"+first_three_digits

    // generating random number in range from 95 to 102
    let mutable second_two_digits = int2String ((new System.Random()).Next(95, 102))

    if (String.length second_two_digits=3) then
        // if generated number is 3 digits long then remove first digit
        second_two_digits <- second_two_digits.[1..]

    // generating random number in range from 0 to 999999 (max 6 digit number)
    let mutable mul_of_seven = (new System.Random()).Next(0, 999999)

    // creating copy of variable mul_of_seven
    let mutable mul_of_seven_copy = mul_of_seven

    // assigning string from (int contained in) mul_of_seven to mul_of_seven_final
    let mutable mul_of_seven_final = int2String (mul_of_seven)

    // assigning 0 to variable used to sum digits from variable mul_of_seven
    let mutable num_added_together = 0

    // iterating over each digit in variable mul_of_seven
    for i=0 to String.length mul_of_seven_final do
        // adding digit to variable num_added_together
        num_added_together <- num_added_together +  (mul_of_seven_copy%10)

        // changing the current digit
        mul_of_seven_copy <- mul_of_seven_copy / 10

    // repeating previous steps until generated number will be divisible by 7
    while (not(num_added_together%7=0)) do
        // regenerating random number in range from 0 to 999999 (max 6 digit number)
        mul_of_seven <- (new System.Random()).Next(0, 999999)

        // recreating copy of variable mul_of_seven
        mul_of_seven_copy <- mul_of_seven

        // assigning string from (int contained in) mul_of_seven to mul_of_seven_final
        mul_of_seven_final <- int2String (mul_of_seven)

        // assigning 0 to variable used to sum digits from variable mul_of_seven
        num_added_together <- 0

        // summing digits in variable mul_of_seven to variable num_added_together
        for i=0 to String.length mul_of_seven_final do
            num_added_together <- num_added_together +  (mul_of_seven_copy%10)
            mul_of_seven_copy <- mul_of_seven_copy / 10

    while (String.length mul_of_seven_final<6) do
        // adding trailing zeros if necessary (to match length of 6)
        mul_of_seven_final <- mul_of_seven_final+"0"

    // generating random number in range from 0 to 99999 (max 5 digit number)
    let mutable last_five_digits = int2String ((new System.Random()).Next(0, 99999))

    while (String.length last_five_digits<5) do
        // adding trailing zeros if necessary (to match length of 5)
        last_five_digits <- last_five_digits+"0"

    // combining all needed variables with dashes and other constants into variable named key
    let key = first_three_digits+second_two_digits+"-OEM-O"+mul_of_seven_final+"-"+last_five_digits

    // displaying generated key to user
    printfn "%s" key

let main arg = 

    printfn "5 CD Keys:"

    // generating 5 keys (and displaying them)
    for i=1 to 5 do
        gen_key 1

    printfn "\n5 CD Keys (OEM):"

    // generating 5 OEM keys (and displaying them)
    for i=1 to 5 do
        gen_oem 1

// executing main function
main 1
