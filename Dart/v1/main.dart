import 'dart:math';

gen_key() {
    var rng = new Random();
    
    String first_three_digits = rng.nextInt(999).toString();
    
    while(first_three_digits=="333" || first_three_digits=="444" || first_three_digits=="555" || first_three_digits=="666" 
        || first_three_digits=="777" || first_three_digits=="888" || first_three_digits=="999") {
        first_three_digits = rng.nextInt(999).toString();
    }
    
    while(first_three_digits.length<3) {
        first_three_digits += "0";
    }
    
    String num_of_len_seven = rng.nextInt(9999999).toString();
    var num_added_together = 0;
    
    for(var i = 0; i < num_of_len_seven.length; i++) {
        num_added_together += int.parse(num_of_len_seven[i]);
    }
    
    while(num_added_together%7!=0) {
        num_of_len_seven = rng.nextInt(9999999).toString();
        num_added_together = 0;
        
        for(var i = 0; i < num_of_len_seven.length; i++) {
            num_added_together += int.parse(num_of_len_seven[i]);
        }
    }
    
    while(num_of_len_seven.length<7) {
        num_of_len_seven += "0";
    }
    
    String key = first_three_digits+"-"+num_of_len_seven;
    
    print(key);
}

gen_oem() {
    var rng = new Random();
    
    String first_three_digits = (rng.nextInt(365)+1).toString();
    
    while(first_three_digits.length<3) {
        first_three_digits = "0"+first_three_digits;
    }
    
    String second_two_digits = (rng.nextInt(8)+95).toString();
    
    if(second_two_digits.length==3) {
        second_two_digits = second_two_digits.substring(1);
    }
    
    String num_of_len_seven = rng.nextInt(999999).toString();
    var num_added_together = 0;
    
    for(var i = 0; i < num_of_len_seven.length; i++) {
        num_added_together += int.parse(num_of_len_seven[i]);
    }
    
    while(num_added_together%7!=0) {
        num_of_len_seven = rng.nextInt(999999).toString();
        num_added_together = 0;
        
        for(var i = 0; i < num_of_len_seven.length; i++) {
            num_added_together += int.parse(num_of_len_seven[i]);
        }
    }
    
    while(num_of_len_seven.length<6) {
        num_of_len_seven += "0";
    }
    
    String last_five_digits = rng.nextInt(99999).toString();
    
    while(last_five_digits.length<5) {
        last_five_digits += "0";
    }
    
    String key = first_three_digits+second_two_digits+"-OEM-0"+num_of_len_seven+"-"+last_five_digits;
    
    print(key);
}

main() {
    print("5 CD Keys:");
    for(var _ = 0; _ < 5; _++) {
        gen_key();
    }
    print("\n5 CD Keys (OEM):");
    for(var _ = 0; _ < 5; _++) {
        gen_oem();
    }
}
