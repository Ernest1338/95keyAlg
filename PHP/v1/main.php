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
    
    // generating random number in range from 0 to 9999999 (max 7 digit number)
    $mul_of_seven = rand(0, 9999999);

    // creating variable which will be use to count sum of all digits generated in the previous step
    $num_added_together = 0;

    // creating an array of digits from variable mul_of_seven
    $num_array = str_split((string)$mul_of_seven);
    
    // iterating over each digit in array mul_array
    foreach($num_array as $number) {
        // adding digit to variable num_added_together
        $num_added_together += $number;
    }
    
    // repeating previous steps until generated number will be divisible by 7
    while($num_added_together%7!=0) {
        // regenerating random number in range from 0 to 9999999 (max 7 digit number)
        $mul_of_seven = rand(0, 9999999);

        // assigning 0 to variable used to sum digits from variable mul_of_seven
        $num_added_together = 0;

        // recreating array of digits
        $num_array = str_split((string)$mul_of_seven);
        
        // summing digits in variable mul_of_seven to variable num_added_together
        foreach($num_array as $number) {
            $num_added_together += $number;
        }
    }
    
    while(strlen((string)$mul_of_seven)<7) {
        // adding trailing zeros if necessary (to match length of 7)
        $mul_of_seven .= 0;
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
    
    // repeating previous steps until generated number will be divisible by 7
    while($num_added_together%7!=0) {
         // regenerating random number in range from 0 to 999999 (max 6 digit number)
        $mul_of_seven = rand(0, 999999);

         // assigning 0 to variable used to sum digits from variable mul_of_seven
        $num_added_together = 0;

        // recreating array of digits
        $num_array = str_split((string)$mul_of_seven);
        
        // summing digits in variable mul_of_seven to variable num_added_together
        foreach($num_array as $number) {
            $num_added_together += $number;
        }
    }
    
    while(strlen((string)$mul_of_seven)<6) {
        // adding trailing zeros if necessary (to match length of 6)
        $mul_of_seven .= 0;
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
