use rand::Rng;

fn gen_key() {
    let mut first_three_digits = rand::thread_rng().gen_range(0..999+1).to_string();

    while first_three_digits=="333" || first_three_digits=="444" || first_three_digits=="555" || first_three_digits=="666" 
        || first_three_digits=="777" || first_three_digits=="888" || first_three_digits=="999" {
        first_three_digits = rand::thread_rng().gen_range(0..999+1).to_string();
    }

    while first_three_digits.chars().count()<3 {
        first_three_digits.push('0');
    }

    let mut num_of_len_seven = rand::thread_rng().gen_range(0..9999999+1).to_string();
    let mut num_added_together = 0;

    for i in num_of_len_seven.chars() {
        num_added_together = num_added_together + i.to_string().parse::<i32>().unwrap();
    }

    while num_added_together%7!=0 {
        num_of_len_seven = rand::thread_rng().gen_range(0..9999999+1).to_string();
        num_added_together = 0;

        for i in num_of_len_seven.chars() {
            num_added_together = num_added_together + i.to_string().parse::<i32>().unwrap();
        }
    }

    while num_of_len_seven.chars().count()<7 {
        num_of_len_seven.push('0');
    }

    let key = first_three_digits+"-"+&num_of_len_seven;

    println!("{}", key);
}

fn gen_oem() {
    let mut first_three_digits = rand::thread_rng().gen_range(1..366+1).to_string();

    while first_three_digits.chars().count()<3 {
        first_three_digits.insert(0, '0');
    }

    let mut second_two_digits = rand::thread_rng().gen_range(95..102+1).to_string();

    if second_two_digits.chars().count()==3 {
        second_two_digits.remove(0);
    }

    let mut num_of_len_seven = rand::thread_rng().gen_range(0..999999+1).to_string();
    let mut num_added_together = 0;

    for i in num_of_len_seven.chars() {
        num_added_together = num_added_together + i.to_string().parse::<i32>().unwrap();
    }

    while num_added_together%7!=0 {
        num_of_len_seven = rand::thread_rng().gen_range(0..999999+1).to_string();
        num_added_together = 0;

        for i in num_of_len_seven.chars() {
            num_added_together = num_added_together + i.to_string().parse::<i32>().unwrap();
        }
    }

    while num_of_len_seven.chars().count()<6 {
        num_of_len_seven.push('0');
    }

    let mut last_five_digits = rand::thread_rng().gen_range(0..99999+1).to_string();

    while last_five_digits.chars().count()<5 {
        last_five_digits.push('0');
    }

    let key = first_three_digits+&second_two_digits+"-OEM-0"+&num_of_len_seven+"-"+&last_five_digits;

    println!("{}", key);

}

fn main() {
    println!("5 CD Keys: ");
    for _ in 0..5 {
        gen_key();
    }

    println!("\n5 CD Keys (OEM):");
    for _ in 0..5 {
        gen_oem();
    }
}
