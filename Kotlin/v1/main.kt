fun gen_key() {
    var first_three_digits = (0..999).random().toString()
    
    while(first_three_digits=="333" || first_three_digits=="444" || first_three_digits=="555" || first_three_digits=="666" 
        || first_three_digits=="777" || first_three_digits=="888" || first_three_digits=="999") {
        first_three_digits = (0..999).random().toString()
    }
    
    while(first_three_digits.length<3) {
        first_three_digits += "0"
    }
    
    var mul_of_seven = (0..9999999).random().toString()
    var num_added_together = 0;
    
    for(i in 0..mul_of_seven.length-1) {
        num_added_together += mul_of_seven[i].toString().toInt()
    }
    
    while(num_added_together%7!=0) {
        mul_of_seven = (0..9999999).random().toString()
        num_added_together = 0;

        for(i in 0..mul_of_seven.length-1) {
            num_added_together += mul_of_seven[i].toString().toInt()
        }
    }
    
    while(mul_of_seven.length<7) {
        mul_of_seven += "0"
    }
    
    val key = first_three_digits+"-"+mul_of_seven
    
    println(key)
}

fun gen_oem() {
    var first_three_digits = (1..366).random().toString()
    
    while(first_three_digits.length<3) {
        first_three_digits = "0"+first_three_digits
    }
    
    var second_two_digits = (95..102).random().toString()
    
    if(second_two_digits.length==3) {
        second_two_digits = second_two_digits.substring(1)
    }
    
    var mul_of_seven = (0..999999).random().toString()
    var num_added_together = 0;
    
    for(i in 0..mul_of_seven.length-1) {
        num_added_together += mul_of_seven[i].toString().toInt()
    }
    
    while(num_added_together%7!=0) {
        mul_of_seven = (0..999999).random().toString()
        num_added_together = 0;

        for(i in 0..mul_of_seven.length-1) {
            num_added_together += mul_of_seven[i].toString().toInt()
        }
    }
    
    while(mul_of_seven.length<6) {
        mul_of_seven += "0"
    }
    
    var last_five_digits = (0..99999).random().toString()
    
    while(last_five_digits.length<5) {
        last_five_digits += "0"
    }
    
    val key = first_three_digits+second_two_digits+"-OEM-0"+mul_of_seven+"-"+last_five_digits
    
    println(key)
}

fun main() {
    println("5 CD Keys:")
    for(i in 1..5) {
        gen_key()
    }
    println("\n5 CD Keys (OEM):")
    for(i in 1..5) {
        gen_oem()
    }
}