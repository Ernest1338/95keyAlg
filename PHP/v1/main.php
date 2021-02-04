<?php
function gen_key() {
    $first_three_digits = rand(0, 999);
    
    while($first_three_digits==333 || $first_three_digits==444 || $first_three_digits==555 || $first_three_digits==666
        || $first_three_digits==777 || $first_three_digits==888 || $first_three_digits==999) {
        $first_three_digits = rand(0, 999);
    }
    
    while(strlen((string)$first_three_digits)<3) {
        $first_three_digits .= 0;
    }
    
    $num_of_len_seven = rand(0, 9999999);
    $num_added_together = 0;
    $num_array = str_split((string)$num_of_len_seven);
    
    foreach($num_array as $number) {
        $num_added_together += $number;
    }
    
    while($num_added_together%7!=0) {
        $num_of_len_seven = rand(0, 9999999);
        $num_added_together = 0;
        $num_array = str_split((string)$num_of_len_seven);
        
        foreach($num_array as $number) {
            $num_added_together += $number;
        }
    }
    
    while(strlen((string)$num_of_len_seven)<7) {
        $num_of_len_seven .= 0;
    }
    
    $key = (string)$first_three_digits."-".(string)$num_of_len_seven;
    
    echo $key."\n";
}

function gen_oem() {
    $first_three_digits = (string)rand(1, 366);
    
    while(strlen((string)$first_three_digits)<3) {
        $first_three_digits = "0".$first_three_digits;
    }
    
    $second_two_digits = rand(95, 102);
    
    if(strlen((string)$second_two_digits)==3) {
        $second_two_digits = substr($second_two_digits, 1);
    }
    
    $num_of_len_seven = rand(0, 999999);
    $num_added_together = 0;
    $num_array = str_split((string)$num_of_len_seven);
    
    foreach($num_array as $number) {
        $num_added_together += $number;
    }
    
    while($num_added_together%7!=0) {
        $num_of_len_seven = rand(0, 999999);
        $num_added_together = 0;
        $num_array = str_split((string)$num_of_len_seven);
        
        foreach($num_array as $number) {
            $num_added_together += $number;
        }
    }
    
    while(strlen((string)$num_of_len_seven)<6) {
        $num_of_len_seven .= 0;
    }
    
    $last_five_digits = rand(0, 99999);
    while(strlen((string)$last_five_digits)<5) {
        $last_five_digits .= 0;
    }
    
    $key = $first_three_digits.$second_two_digits."-OEM-0".$num_of_len_seven."-".$last_five_digits;
    
    echo $key."\n";
}

function main() {
    echo "5 CD Keys:\n";
    for($i=0; $i<5; $i++) {
        gen_key();
    }
    echo "\n5 CD Keys (OEM):\n";
    for($i=0; $i<5; $i++) {
        gen_oem();
    }
}
main();
?>
