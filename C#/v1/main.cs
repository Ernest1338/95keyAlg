using System;
class main {

    // creating new random number generator
    static Random rnd = new Random();
  
    static void gen_key() {
        // generating random number in range from 0 to 999 (max 3 digit number)
        string first_three_digits = rnd.Next(0, 999+1).ToString();
        
        while (first_three_digits=="333" || first_three_digits=="444" || first_three_digits=="555" || first_three_digits=="666" 
            || first_three_digits=="777" || first_three_digits=="888" || first_three_digits=="999") {
            // regenerating random number to the point when they are not repeating (excluding 111 and 222)
            first_three_digits = rnd.Next(0, 999+1).ToString();
        }
        
        while (first_three_digits.Length<3) {
            // adding trailing zeros if necessary (to match length of 3)
            first_three_digits+="0";
        }
        
        // generating random number in range from 0 to 9999999 (max 7 digit number)
        string mul_of_seven = rnd.Next(0, 9999999+1).ToString();

        // creating variable which will be use to count sum of all digits generated in the previous step
        int num_added_together = 0;
        
        // iterating over each digit in variable mul_of_seven
        for (int i=0; i<mul_of_seven.Length; i++) {
            // converting (digit) character to (digit) string and then to (digit) int and adding it to variable num_added_together
            num_added_together+=int.Parse(mul_of_seven[i].ToString());
        }
        
        // repeating previous steps until generated number will be divisible by 7
        while (num_added_together%7!=0) {
            // regenerating random number in range from 0 to 9999999 (max 7 digit number)
            mul_of_seven = rnd.Next(0, 9999999+1).ToString();

            // assigning 0 to variable used to sum digits from variable mul_of_seven
            num_added_together = 0;
            
            // summing digits in variable mul_of_seven to variable num_added_together
            for (int i=0; i<mul_of_seven.Length; i++) {
                num_added_together+=int.Parse(mul_of_seven[i].ToString());
            }
        }
        
        while (mul_of_seven.Length<7) {
            // adding trailing zeros if necessary (to match length of 7)
            mul_of_seven+="0";
        }
        
        // combining all needed variables with dashes and other constants into variable named key
        string key = first_three_digits+"-"+mul_of_seven;
        
        // displaying generated key to user
        Console.WriteLine(key);
    }
  
    static void gen_oem() {
        // generating random number in range from 1 to 366 (max 3 digit number)
        string first_three_digits = rnd.Next(1, 366+1).ToString();
        
        while (first_three_digits.Length<3) {
            // adding zeros at the beginning if necessary (to match length of 3)
            first_three_digits = "0"+first_three_digits;
        }
        
        // generating random number in range from 95 to 102
        string second_two_digits = rnd.Next(95, 102).ToString();
        
        if (second_two_digits.Length==3) {
            // if generated number is 3 digits long then remove first digit
            second_two_digits = second_two_digits.Remove(0, 1);
        }
        
        // generating random number in range from 0 to 999999 (max 6 digit number)
        string mul_of_seven = rnd.Next(0, 999999+1).ToString();

        // creating variable which will be use to count sum of all digits generated in the previous step
        int num_added_together = 0;
        
        // iterating over each digit in variable mul_of_seven
        for (int i=0; i<mul_of_seven.Length; i++) {
            // converting (digit) character to (digit) string and then to (digit) int and adding it to variable num_added_together
            num_added_together+=int.Parse(mul_of_seven[i].ToString());
        }
        
        // repeating previous steps until generated number will be divisible by 7
        while (num_added_together%7!=0) {
            // regenerating random number in range from 0 to 999999 (max 6 digit number)
            mul_of_seven = rnd.Next(0, 999999+1).ToString();

            // assigning 0 to variable used to sum digits from variable mul_of_seven
            num_added_together = 0;
            
            // summing digits in variable mul_of_seven to variable num_added_together
            for (int i=0; i<mul_of_seven.Length; i++) {
                num_added_together+=int.Parse(mul_of_seven[i].ToString());
            }
        }
        
        while (mul_of_seven.Length<6) {
            // adding trailing zeros if necessary (to match length of 6)
            mul_of_seven+="0";
        }
        
        // generating random number in range from 0 to 99999 (max 5 digit number)
        string last_five_digits = rnd.Next(0, 99999+1).ToString();
        
        while (last_five_digits.Length<5) {
            // adding trailing zeros if necessary (to match length of 5)
            last_five_digits+="0";
        }
        
        // combining all needed variables with dashes and other constants into variable named key
        string key = first_three_digits+second_two_digits+"-OEM-0"+mul_of_seven+"-"+last_five_digits;
        
        // displaying generated key to user
        Console.WriteLine(key);
    }
  
    static void Main() {

        Console.WriteLine("5 CD Keys:");

        // generating 5 keys (and displaying them)
        for (int i=0; i<5; i++) {
            gen_key();    
        }

        Console.WriteLine("\n5 CD Keys: (OEM)");

        // generating 5 OEM keys (and displaying them)
        for (int i=0; i<5; i++) {
            gen_oem();    
        }
    }
}
