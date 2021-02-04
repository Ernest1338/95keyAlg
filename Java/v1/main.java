import java.lang.Math;

public class Main
{
    public static void gen_key() {
        String first_three_digits = Integer.toString((int)Math.floor(Math.random() * (999 + 1)));
        
        while(first_three_digits=="333" || first_three_digits=="444" || first_three_digits=="555" || first_three_digits=="666"
            || first_three_digits=="777" || first_three_digits=="888"| first_three_digits=="999") {
            first_three_digits = Integer.toString((int)Math.floor(Math.random() * (999 + 1)));
        }
        
        while(first_three_digits.length()<3) {
            first_three_digits += "0";
        }
        
        String num_of_len_seven = Integer.toString((int)Math.floor(Math.random() * (9999999 + 1)));
        int num_added_together = 0;
        
        for(int i=0; i<num_of_len_seven.length(); i++) {
            num_added_together += (int)num_of_len_seven.charAt(i)-'0';
        }
        
        while(num_added_together%7!=0) {
            num_of_len_seven = Integer.toString((int)Math.floor(Math.random() * (9999999 + 1)));
            num_added_together = 0;
            
            for(int i=0; i<num_of_len_seven.length(); i++) {
                num_added_together += (int)num_of_len_seven.charAt(i)-'0';
            }
        }
        
        while(num_of_len_seven.length()<7) {
            num_of_len_seven += "0";
        }
        
        String key = first_three_digits+"-"+num_of_len_seven;
        
        System.out.println(key);
    }
    public static void gen_oem() {
        String first_three_digits = Integer.toString((int)Math.floor(Math.random() * 366 + 1));
        
        while(first_three_digits.length()<3) {
            first_three_digits = "0"+first_three_digits;
        }
        
        String second_two_digits = Integer.toString((int)Math.floor(Math.random() * (102 - 95 + 1) + 95));
        
        if(second_two_digits.length()==3) {
            second_two_digits = second_two_digits.substring(1);
        }
        
        String num_of_len_seven = Integer.toString((int)Math.floor(Math.random() * (999999 + 1)));
        int num_added_together = 0;
        
        for(int i=0; i<num_of_len_seven.length(); i++) {
            num_added_together += (int)num_of_len_seven.charAt(i)-'0';
        }
        
        while(num_added_together%7!=0) {
            num_of_len_seven = Integer.toString((int)Math.floor(Math.random() * (999999 + 1)));
            num_added_together = 0;
            
            for(int i=0; i<num_of_len_seven.length(); i++) {
                num_added_together += (int)num_of_len_seven.charAt(i)-'0';
            }
        }
        
        while(num_of_len_seven.length()<6) {
            num_of_len_seven += "0";
        }
        
        String last_five_digits = Integer.toString((int)Math.floor(Math.random() * (99999 + 1)));
        
        while(last_five_digits.length()<5) {
            last_five_digits += "0";
        }
        
        String key = first_three_digits+second_two_digits+"-OEM-0"+num_of_len_seven+"-"+last_five_digits;
        
        System.out.println(key);
    }
	public static void main(String[] args) {
	    System.out.println("5 CD Keys:");
	    for (int i = 0; i < 5; i++) {
            gen_key();
        }
        System.out.println("\n5 CD Keys:");
		for (int i = 0; i < 5; i++) {
            gen_oem();
        }
	}
}
