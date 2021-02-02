function gen_key() {
    var first_three_digits = (Math.floor((Math.random() * 999) + 0)).toString();

    while(first_three_digits=="333" || first_three_digits=="444" || first_three_digits=="555" || first_three_digits=="666" 
        || first_three_digits=="777" || first_three_digits=="888" || first_three_digits=="999") {
            first_three_digits = (Math.floor((Math.random() * 999) + 0)).toString();
    }

    while(first_three_digits.length<3) {
        first_three_digits+="0";
    }

    var num_of_len_seven = (Math.floor((Math.random() * 9999999) + 0)).toString();
    var num_added_together = 0;

    for(i=0; i<num_of_len_seven.length; i++) {
        num_added_together+=parseInt(num_of_len_seven[i]);
    }

    while(num_added_together%7!=0) {
        num_of_len_seven = (Math.floor((Math.random() * 9999999) + 0)).toString();
        num_added_together = 0;

        for(i=0; i<num_of_len_seven.length; i++) {
            num_added_together+=parseInt(num_of_len_seven[i]);
        }
    }

    while(num_of_len_seven.length<7) {
        num_of_len_seven+="0";
    }

    var key = first_three_digits+"-"+num_of_len_seven;

    document.write(key+"<br>");

}
function gen_oem() {
    var first_three_digits = (Math.floor(Math.random() * (366-1) + 1)).toString();

    while(first_three_digits.length<3) {
        first_three_digits = "0"+first_three_digits;
    }

    var second_two_digits = (Math.floor(Math.random() * (102-95) + 95)).toString();

    if(second_two_digits.length==3) {
        second_two_digits = second_two_digits.substring(1);
    }

    var num_of_len_seven = (Math.floor((Math.random() * 9999999) + 0)).toString();
    var num_added_together = 0;

    for(i=0; i<num_of_len_seven.length; i++) {
        num_added_together+=parseInt(num_of_len_seven[i]);
    }

    while(num_added_together%7!=0) {
        num_of_len_seven = (Math.floor((Math.random() * 9999999) + 0)).toString();
        num_added_together = 0;

        for(i=0; i<num_of_len_seven.length; i++) {
            num_added_together+=parseInt(num_of_len_seven[i]);
        }
    }

    while(num_of_len_seven.length<7) {
        num_of_len_seven+="0";
    }

    var last_five_digits = (Math.floor((Math.random() * 99999) + 0)).toString();

    while(last_five_digits.length<5) {
        last_five_digits+="0"
    }

    var key = first_three_digits+second_two_digits+"-OEM-"+num_of_len_seven+"-"+last_five_digits;

    document.write(key+"<br>");

}
function main() {
    document.write("5 CD Keys:<br>");
    for(_=0; _<5; _++) {
        gen_key();
    }
    document.write("<br>5 CD Keys (OEM):<br>");
    for(_=0; _<5; _++) {
        gen_oem();
    }
}
main();
