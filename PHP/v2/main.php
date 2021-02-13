<?php

function gen_key() {
    // generating random number in range from 0 to 999 (max 3 digit number)
    $first_three_digits = rand(0, 999);
    
    while($first_three_digits==333 || $first_three_digits==444 || $first_three_digits==555 || $first_three_digits==666
        || $first_three_digits==777 || $first_three_digits==888 || $first_three_digits==999) {
        // regenerating random number to the point when they are not repeating (excluding 111 and 222)
        $first_three_digits = rand(0, 999);
    }
    
    while(strlen((string)$first_three_digits)<3) {
        // adding trailing zeros if necessary (to match length of 3)
        $first_three_digits .= 0;
    }
    
    // generating random number in range from 0 to 999999 (max 6 digit number)
    $mul_of_seven = rand(0, 999999);

    // creating variable which will be use to count sum of all digits generated in the previous step
    $num_added_together = 0;

    // creating an array of digits from variable mul_of_seven
    $num_array = str_split((string)$mul_of_seven);
    
    // iterating over each digit in array mul_array
    foreach($num_array as $number) {
        // adding digit to variable num_added_together
        $num_added_together += $number;
    }
    
    while(strlen((string)$mul_of_seven)<6) {
        // adding trailing zeros if necessary (to match length of 6)
        $mul_of_seven .= 0;
    }

    // searching for remainder value to make mul_of_seven divisible by 7
    for($i=0; $i<7; $i++) {
        if(($num_added_together+($i+1))%7==0) {
            // adding this value to the end of mul_of_seven variable
            $mul_of_seven .= ($i+1);
            break;
        }
    }
    
    // combining all needed variables with dashes and other constants into variable named key
    $key = (string)$first_three_digits."-".(string)$mul_of_seven;
    
    // displaying generated key to user
    echo $key."\n";
}

function gen_oem() {
    // generating random number in range from 1 to 366 (max 3 digit number)
    $first_three_digits = (string)rand(1, 366);
    
    while(strlen((string)$first_three_digits)<3) {
        // adding zeros at the beginning if necessary (to match length of 3)
        $first_three_digits = "0".$first_three_digits;
    }
    
    // generating random number in range from 95 to 102
    $second_two_digits = rand(95, 102);
    
    if(strlen((string)$second_two_digits)==3) {
        // if generated number is 3 digits long then remove first digit
        $second_two_digits = substr($second_two_digits, 1);
    }
    
    // generating random number in range from 0 to 99999 (max 5 digit number)
    $mul_of_seven = rand(0, 99999);

    // creating variable which will be use to count sum of all digits generated in the previous step
    $num_added_together = 0;

    // creating an array of digits from variable mul_of_seven
    $num_array = str_split((string)$mul_of_seven);
    
    // iterating over each digit in array mul_array
    foreach($num_array as $number) {
        // adding digit to variable num_added_together
        $num_added_together += $number;
    }
    
    while(strlen((string)$mul_of_seven)<5) {
        // adding trailing zeros if necessary (to match length of 5)
        $mul_of_seven .= 0;
    }

    // searching for remainder value to make mul_of_seven divisible by 7
    for($i=0; $i<7; $i++) {
        if(($num_added_together+($i+1))%7==0) {
            // adding this value to the end of mul_of_seven variable
            $mul_of_seven .= ($i+1);
            break;
        }
    }
    
    // generating random number in range from 0 to 99999 (max 5 digit number)
    $last_five_digits = rand(0, 99999);

    while(strlen((string)$last_five_digits)<5) {
         // adding trailing zeros if necessary (to match length of 5)
        $last_five_digits .= 0;
    }
    
    // combining all needed variables with dashes and other constants into variable named key
    $key = $first_three_digits.$second_two_digits."-OEM-0".$mul_of_seven."-".$last_five_digits;
    
    // displaying generated key to user
    echo $key."\n";
}

function main() {

    echo "5 CD Keys:\n";

    // generating 5 keys (and displaying them)
    for($i=0; $i<5; $i++) {
        gen_key();
    }

    echo "\n5 CD Keys (OEM):\n";

    // generating 5 OEM keys (and displaying them)
    for($i=0; $i<5; $i++) {
        gen_oem();
    }
}

// executing main function
main();

?>
