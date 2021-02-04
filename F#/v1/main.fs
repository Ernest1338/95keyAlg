let int2String x = sprintf "%i" x

let gen_key arg =
    let mutable first_three_digits = int2String ((new System.Random()).Next(0, 999))
    
    while (first_three_digits="333" || first_three_digits="444" || first_three_digits="555" || first_three_digits="666" || first_three_digits="777" || first_three_digits="888" || first_three_digits="999") do
        first_three_digits <- int2String ((new System.Random()).Next(0, 999))
        
    while (String.length first_three_digits<3) do
        first_three_digits <- first_three_digits+"0"
    
    let mutable num_of_len_seven = (new System.Random()).Next(0, 9999999)
    let mutable num_of_len_seven_copy = num_of_len_seven
    let mutable num_of_len_seven_final = int2String (num_of_len_seven)
    let mutable num_added_together = 0
    
    for i=0 to String.length num_of_len_seven_final do
        num_added_together <- num_added_together +  (num_of_len_seven_copy%10)
        num_of_len_seven_copy <- num_of_len_seven_copy / 10
        
    while (not(num_added_together%7=0)) do
        num_of_len_seven <- (new System.Random()).Next(0, 9999999)
        num_of_len_seven_copy <- num_of_len_seven
        num_of_len_seven_final <- int2String (num_of_len_seven)
        num_added_together <- 0
        
        for i=0 to String.length num_of_len_seven_final do
            num_added_together <- num_added_together +  (num_of_len_seven_copy%10)
            num_of_len_seven_copy <- num_of_len_seven_copy / 10
            
    while (String.length num_of_len_seven_final<7) do
        num_of_len_seven_final <- num_of_len_seven_final+"0"

    let key = first_three_digits+"-"+num_of_len_seven_final

    printfn "%s" key
    
let gen_oem arg =
    let mutable first_three_digits = int2String ((new System.Random()).Next(1, 366))
    
    while (String.length first_three_digits<3) do
        first_three_digits <- "0"+first_three_digits

    let mutable second_two_digits = int2String ((new System.Random()).Next(95, 102))
    
    if (String.length second_two_digits=3) then
        second_two_digits <- second_two_digits.[1..]

    let mutable num_of_len_seven = (new System.Random()).Next(0, 999999)
    let mutable num_of_len_seven_copy = num_of_len_seven
    let mutable num_of_len_seven_final = int2String (num_of_len_seven)
    let mutable num_added_together = 0
    
    for i=0 to String.length num_of_len_seven_final do
        num_added_together <- num_added_together +  (num_of_len_seven_copy%10)
        num_of_len_seven_copy <- num_of_len_seven_copy / 10
        
    while (not(num_added_together%7=0)) do
        num_of_len_seven <- (new System.Random()).Next(0, 999999)
        num_of_len_seven_copy <- num_of_len_seven
        num_of_len_seven_final <- int2String (num_of_len_seven)
        num_added_together <- 0
        
        for i=0 to String.length num_of_len_seven_final do
            num_added_together <- num_added_together +  (num_of_len_seven_copy%10)
            num_of_len_seven_copy <- num_of_len_seven_copy / 10
            
    while (String.length num_of_len_seven_final<6) do
        num_of_len_seven_final <- num_of_len_seven_final+"0"

    let mutable last_five_digits = int2String ((new System.Random()).Next(0, 99999))
    
    while (String.length last_five_digits<5) do
        last_five_digits <- last_five_digits+"0"

    let key = first_three_digits+second_two_digits+"-OEM-O"+num_of_len_seven_final+"-"+last_five_digits

    printfn "%s" key

let main arg = 
    printfn "5 CD Keys:"
    for _=1 to 5 do
        gen_key 1
    printfn "\n5 CD Keys (OEM):"
    for _=1 to 5 do
        gen_oem 1

main 1
