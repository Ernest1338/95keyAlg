function gen_key() {
    // generating random number in range from 0 to 999 (max 3 digit number)
    var first_three_digits = Math.floor(Math.random() * 999).toString()

    while(first_three_digits=="333" || first_three_digits=="444" || first_three_digits=="555" || first_three_digits=="666" 
        || first_three_digits=="777" || first_three_digits=="888" || first_three_digits=="999") {
        // regenerating random number to the point when they are not repeating (excluding 111 and 222)
        first_three_digits = Math.floor(Math.random() * 999).toString()
    }

    while(first_three_digits.length<3) {
        // adding trailing zeros if necessary (to match length of 3)
        first_three_digits += "0"
    }

    // generating random number in range from 0 to 999999 (max 6 digit number)
    var mul_of_seven = Math.floor(Math.random() * 999999).toString()

    // creating variable which will be use to count sum of all digits generated in the previous step
    var num_added_together = 0;

    // iterating over each digit in variable mul_of_seven
    for(var i=0; i<mul_of_seven.length; i++) {
        // converting (digit) string to (digit) integer and adding it to variable num_added_together
        num_added_together += parseInt(mul_of_seven[i])
    }

    while(mul_of_seven.length<6) {
        // adding trailing zeros if necessary (to match length of 6)
        mul_of_seven += "0"
    }

    // searching for remainder value to make mul_of_seven divisible by 7
    for(var i=0; i<7; i++) {
        if((num_added_together+(i+1))%7==0) {
            // adding this value to the end of mul_of_seven variable
            mul_of_seven += (i+1).toString()
            break
        }
    }

    // combining all needed variables with dashes and other constants into variable named key
    let key = first_three_digits+"-"+mul_of_seven

    // displaying generated key to user
    document.write(key+"<br>")
}

function gen_oem() {
    // generating random number in range from 1 to 366 (max 3 digit number)
    var first_three_digits = Math.floor(Math.random() * (366 - 1) + 1).toString()

    while(first_three_digits.length<3) {
        // adding zeros at the beginning if necessary (to match length of 3)
        first_three_digits = "0"+first_three_digits
    }

    // generating random number in range from 95 to 102
    var second_two_digits = Math.floor(Math.random() * (102 - 95) + 95).toString()

    if(second_two_digits.length==3) {
        // if generated number is 3 digits long then remove first digit
        second_two_digits = second_two_digits.substring(1)
    }

    // generating random number in range from 0 to 99999 (max 5 digit number)
    var mul_of_seven = Math.floor(Math.random() * 99999).toString()

    // creating variable which will be use to count sum of all digits generated in the previous step
    var num_added_together = 0;

    // iterating over each digit in variable mul_of_seven
    for(var i=0; i<mul_of_seven.length; i++) {
        // converting (digit) string to (digit) integer and adding it to variable num_added_together
        num_added_together += parseInt(mul_of_seven[i])
    }

    while(mul_of_seven.length<5) {
        // adding trailing zeros if necessary (to match length of 5)
        mul_of_seven += "0"
    }

    // searching for remainder value to make mul_of_seven divisible by 7
    for(var i=0; i<7; i++) {
        if((num_added_together+(i+1))%7==0) {
            // adding this value to the end of mul_of_seven variable
            mul_of_seven += (i+1).toString()
            break
        }
    }

    // generating random number in range from 0 to 99999 (max 5 digit number)
    var last_five_digits = Math.floor(Math.random() * 99999).toString()

    while(last_five_digits.length<5) {
        // adding trailing zeros if necessary (to match length of 5)
        last_five_digits += "0"
    }

    // combining all needed variables with dashes and other constants into variable named key
    let key = first_three_digits+second_two_digits+"-OEM-0"+mul_of_seven+"-"+last_five_digits

    // displaying generated key to user
    document.write(key+"<br>")
}

function main() {

    document.write("5 CD Keys:<br>")

    // generating 5 keys (and displaying them)
    for(var _=0; _<5; _++) {
        gen_key()
    }

    // generating 5 OEM keys (and displaying them)
    document.write("<br>5 CD Keys (OEM):<br>")

    for(var _=0; _<5; _++) {
        gen_oem()
    }
}

// executing main function
main()
