import java.lang.Math;

public class Main {

    public static void gen_key() {
        // generating random number in range from 0 to 999 (max 3 digit number)
        String first_three_digits = Integer.toString((int)Math.floor(Math.random() * (999 + 1)));

        while(first_three_digits=="333" || first_three_digits=="444" || first_three_digits=="555" || first_three_digits=="666"
            || first_three_digits=="777" || first_three_digits=="888"| first_three_digits=="999") {
            // regenerating random number to the point when they are not repeating (excluding 111 and 222)
            first_three_digits = Integer.toString((int)Math.floor(Math.random() * (999 + 1)));
        }

        while(first_three_digits.length()<3) {
            // adding trailing zeros if necessary (to match length of 3)
            first_three_digits += "0";
        }

        // generating random number in range from 0 to 9999999 (max 7 digit number)
        String mul_of_seven = Integer.toString((int)Math.floor(Math.random() * (9999999 + 1)));

        // creating variable which will be use to count sum of all digits generated in the previous step
        int num_added_together = 0;

        // iterating over each digit in variable mul_of_seven
        for(int i=0; i<mul_of_seven.length(); i++) {
            // converting (digit) char to (digit) integer and adding it to variable num_added_together
            num_added_together += (int)mul_of_seven.charAt(i)-'0';
        }

        // repeating previous steps until generated number will be divisible by 7
        while(num_added_together%7!=0) {
            // regenerating random number in range from 0 to 9999999 (max 7 digit number)
            mul_of_seven = Integer.toString((int)Math.floor(Math.random() * (9999999 + 1)));

            // assigning 0 to variable used to sum digits from variable mul_of_seven
            num_added_together = 0;

            // summing digits in variable mul_of_seven to variable num_added_together
            for(int i=0; i<mul_of_seven.length(); i++) {
                num_added_together += (int)mul_of_seven.charAt(i)-'0';
            }
        }

        while(mul_of_seven.length()<7) {
            // adding trailing zeros if necessary (to match length of 7)
            mul_of_seven += "0";
        }

        // combining all needed variables with dashes and other constants into variable named key
        String key = first_three_digits+"-"+mul_of_seven;

        // displaying generated key to user
        System.out.println(key);
    }

    public static void gen_oem() {
        // generating random number in range from 1 to 366 (max 3 digit number)
        String first_three_digits = Integer.toString((int)Math.floor(Math.random() * 366 + 1));

        while(first_three_digits.length()<3) {
            // adding zeros at the beginning if necessary (to match length of 3)
            first_three_digits = "0"+first_three_digits;
        }

        // generating random number in range from 95 to 102
        String second_two_digits = Integer.toString((int)Math.floor(Math.random() * (102 - 95 + 1) + 95));

        if(second_two_digits.length()==3) {
            // if generated number is 3 digits long then remove first digit
            second_two_digits = second_two_digits.substring(1);
        }

        // generating random number in range from 0 to 999999 (max 6 digit number)
        String mul_of_seven = Integer.toString((int)Math.floor(Math.random() * (999999 + 1)));

        // creating variable which will be use to count sum of all digits generated in the previous step
        int num_added_together = 0;

        // iterating over each digit in variable mul_of_seven
        for(int i=0; i<mul_of_seven.length(); i++) {
            // converting (digit) char to (digit) integer and adding it to variable num_added_together
            num_added_together += (int)mul_of_seven.charAt(i)-'0';
        }

        // repeating previous steps until generated number will be divisible by 7
        while(num_added_together%7!=0) {
            // regenerating random number in range from 0 to 999999 (max 6 digit number)
            mul_of_seven = Integer.toString((int)Math.floor(Math.random() * (999999 + 1)));

            // assigning 0 to variable used to sum digits from variable mul_of_seven
            num_added_together = 0;

            // summing digits in variable mul_of_seven to variable num_added_together
            for(int i=0; i<mul_of_seven.length(); i++) {
                num_added_together += (int)mul_of_seven.charAt(i)-'0';
            }
        }

        while(mul_of_seven.length()<6) {
            // adding trailing zeros if necessary (to match length of 6)
            mul_of_seven += "0";
        }

        // generating random number in range from 0 to 99999 (max 5 digit number)
        String last_five_digits = Integer.toString((int)Math.floor(Math.random() * (99999 + 1)));

        while(last_five_digits.length()<5) {
            // adding trailing zeros if necessary (to match length of 5)
            last_five_digits += "0";
        }

        // combining all needed variables with dashes and other constants into variable named key
        String key = first_three_digits+second_two_digits+"-OEM-0"+mul_of_seven+"-"+last_five_digits;

        // displaying generated key to user
        System.out.println(key);
    }

	public static void main(String[] args) {

	    System.out.println("5 CD Keys:");

        // generating 5 keys (and displaying them)
	    for (int i = 0; i < 5; i++) {
            gen_key();
        }

        System.out.println("\n5 CD Keys:");

        // generating 5 OEM keys (and displaying them)
		for (int i = 0; i < 5; i++) {
            gen_oem();
        }
	}
}
