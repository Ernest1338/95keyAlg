using System;
class main {
    
  static Random rnd = new Random();
  
  static void gen_key() {
    string first_three_digits = rnd.Next(0, 999+1).ToString();
    
    while (first_three_digits=="333" || first_three_digits=="444" || first_three_digits=="555" || first_three_digits=="666" 
        || first_three_digits=="777" || first_three_digits=="888" || first_three_digits=="999") {
        first_three_digits = rnd.Next(0, 999+1).ToString();
    }
    
    while (first_three_digits.Length<3) {
        first_three_digits+="0";
    }
    
    string mul_of_seven = rnd.Next(0, 9999999+1).ToString();
    int num_added_together = 0;
    
    for (int i=0; i<mul_of_seven.Length; i++) {
        num_added_together+=int.Parse(mul_of_seven[i].ToString());
    }
    
    while (num_added_together%7!=0) {
        mul_of_seven = rnd.Next(0, 9999999+1).ToString();
        num_added_together = 0;
        
        for (int i=0; i<mul_of_seven.Length; i++) {
            num_added_together+=int.Parse(mul_of_seven[i].ToString());
        }
    }
    
    while (mul_of_seven.Length<7) {
        mul_of_seven+="0";
    }
    
    string key = first_three_digits+"-"+mul_of_seven;
    
    Console.WriteLine(key);
  }
  
  static void gen_oem() {
    string first_three_digits = rnd.Next(1, 366+1).ToString();
    
    while (first_three_digits.Length<3) {
        first_three_digits = "0"+first_three_digits;
    }
    
    string second_two_digits = rnd.Next(95, 102).ToString();
    
    if (second_two_digits.Length==3) {
        second_two_digits = second_two_digits.Remove(0, 1);
    }
    
    string mul_of_seven = rnd.Next(0, 999999+1).ToString();
    int num_added_together = 0;
    
    for (int i=0; i<mul_of_seven.Length; i++) {
        num_added_together+=int.Parse(mul_of_seven[i].ToString());
    }
    
    while (num_added_together%7!=0) {
        mul_of_seven = rnd.Next(0, 999999+1).ToString();
        num_added_together = 0;
        
        for (int i=0; i<mul_of_seven.Length; i++) {
            num_added_together+=int.Parse(mul_of_seven[i].ToString());
        }
    }
    
    while (mul_of_seven.Length<6) {
        mul_of_seven+="0";
    }
    
    string last_five_digits = rnd.Next(0, 99999+1).ToString();
    
    while (last_five_digits.Length<5) {
        last_five_digits+="0";
    }
    
    string key = first_three_digits+second_two_digits+"-OEM-0"+mul_of_seven+"-"+last_five_digits;
    
    Console.WriteLine(key);
  }
  
  static void Main() {
    Console.WriteLine("5 CD Keys:");
    for (int i=0; i<5; i++) {
        gen_key();    
    }
    Console.WriteLine("\n5 CD Keys: (OEM)");
    for (int i=0; i<5; i++) {
        gen_oem();    
    }
  }
}
