use rand::Rng;

fn gen_key() {
    // generating random number in range from 0 to 999 (max 3 digit number)
    let mut first_three_digits = rand::thread_rng().gen_range(0..999+1).to_string();

    while first_three_digits=="333" || first_three_digits=="444" || first_three_digits=="555" || first_three_digits=="666" 
        || first_three_digits=="777" || first_three_digits=="888" || first_three_digits=="999" {
        // regenerating random number to the point when they are not repeating (excluding 111 and 222)
        first_three_digits = rand::thread_rng().gen_range(0..999+1).to_string();
    }

    while first_three_digits.chars().count()<3 {
        // adding trailing zeros if necessary (to match length of 3)
        first_three_digits.push('0');
    }

    // generating random number in range from 0 to 999999 (max 6 digit number)
    let mut mul_of_seven = rand::thread_rng().gen_range(0..999999+1).to_string();

    // creating variable which will be use to count sum of all digits generated in the previous step
    let mut num_added_together = 0;

    // iterating over each digit in variable mul_of_seven
    for i in mul_of_seven.chars() {
        // converting (digit) char to (digit) string and then to (digit) integer and adding it to variable num_added_together
        num_added_together = num_added_together + i.to_string().parse::<i32>().unwrap();
    }

    while mul_of_seven.chars().count()<6 {
        // adding trailing zeros if necessary (to match length of 6)
        mul_of_seven.push('0');
    }

    // searching for remainder value to make mul_of_seven divisible by 7
    for i in 0..7 {
        if (num_added_together+(i+1))%7==0 {
            // adding this value to the end of mul_of_seven variable
            mul_of_seven.push_str(&(i+1).to_string());
            break;
        }
    }

    // combining all needed variables with dashes and other constants into variable named key
    let key = first_three_digits+"-"+&mul_of_seven;

    // displaying generated key to user
    println!("{}", key);
}

fn gen_oem() {
    // generating random number in range from 1 to 366 (max 3 digit number)
    let mut first_three_digits = rand::thread_rng().gen_range(1..366+1).to_string();

    while first_three_digits.chars().count()<3 {
        // adding zeros at the beginning if necessary (to match length of 3)
        first_three_digits.insert(0, '0');
    }

    // generating random number in range from 95 to 102
    let mut second_two_digits = rand::thread_rng().gen_range(95..102+1).to_string();

    if second_two_digits.chars().count()==3 {
        // if generated number is 3 digits long then remove first digit
        second_two_digits.remove(0);
    }

    // generating random number in range from 0 to 99999 (max 5 digit number)
    let mut mul_of_seven = rand::thread_rng().gen_range(0..99999+1).to_string();

    // creating variable which will be use to count sum of all digits generated in the previous step
    let mut num_added_together = 0;

    // iterating over each digit in variable mul_of_seven
    for i in mul_of_seven.chars() {
        // converting (digit) char to (digit) string and then to (digit) integer and adding it to variable num_added_together
        num_added_together = num_added_together + i.to_string().parse::<i32>().unwrap();
    }

    while mul_of_seven.chars().count()<5 {
        // adding trailing zeros if necessary (to match length of 5)
        mul_of_seven.push('0');
    }

    // searching for remainder value to make mul_of_seven divisible by 7
    for i in 0..7 {
        if (num_added_together+(i+1))%7==0 {
            // adding this value to the end of mul_of_seven variable
            mul_of_seven.push_str(&(i+1).to_string());
            break;
        }
    }

    // generating random number in range from 0 to 99999 (max 5 digit number)
    let mut last_five_digits = rand::thread_rng().gen_range(0..99999+1).to_string();

    while last_five_digits.chars().count()<5 {
        // adding trailing zeros if necessary (to match length of 5)
        last_five_digits.push('0');
    }

    // combining all needed variables with dashes and other constants into variable named key
    let key = first_three_digits+&second_two_digits+"-OEM-0"+&mul_of_seven+"-"+&last_five_digits;

    // displaying generated key to user
    println!("{}", key);

}

fn main() {

    println!("5 CD Keys: ");

    // generating 5 keys (and displaying them)
    for _ in 0..5 {
        gen_key();
    }

    println!("\n5 CD Keys (OEM):");

    // generating 5 OEM keys (and displaying them)
    for _ in 0..5 {
        gen_oem();
    }
}
