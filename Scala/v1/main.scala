object Main {
    def gen_key(): Unit = {
        var r = scala.util.Random
        var first_three_digits = r.nextInt(999).toString
      
        while(first_three_digits=="333" || first_three_digits=="444" || first_three_digits=="555" || first_three_digits=="666" 
            || first_three_digits=="777" || first_three_digits=="888" || first_three_digits=="999") {
            first_three_digits = r.nextInt(999).toString
        }
      
        while(first_three_digits.length<3) {
            first_three_digits += "0"
        }
      
        var mul_of_seven = r.nextInt(9999999).toString
        var num_added_together = 0
      
        for(i <- mul_of_seven) {
            num_added_together += i.toString.toInt
        }
      
        while(num_added_together%7!=0) {
            mul_of_seven = r.nextInt(9999999).toString
            num_added_together = 0
  
            for(i <- mul_of_seven) {
                num_added_together += i.toString.toInt
            }
        }
      
        while(mul_of_seven.length<7) {
            mul_of_seven += "0"
        }
      
        var key = first_three_digits+"-"+mul_of_seven
      
        println(key)
    }
  
    def gen_oem(): Unit = {
        var r = scala.util.Random
        var first_three_digits = (r.nextInt(365)+1).toString
      
        while(first_three_digits.length<3) {
            first_three_digits = "0"+first_three_digits
        }
      
        var second_two_digits = (r.nextInt(8)+95).toString
      
        if(second_two_digits.length==3) {
            second_two_digits = second_two_digits.substring(1)
        }
      
        var mul_of_seven = r.nextInt(999999).toString
        var num_added_together = 0
      
        for(i <- mul_of_seven) {
            num_added_together += i.toString.toInt
        }
      
        while(num_added_together%7!=0) {
            mul_of_seven = r.nextInt(999999).toString
            num_added_together = 0
  
            for(i <- mul_of_seven) {
                num_added_together += i.toString.toInt
            }
        }
      
        while(mul_of_seven.length<6) {
            mul_of_seven += "0"
        }
      
        var last_five_digits = r.nextInt(99999).toString
      
        while(last_five_digits.length<5) {
            last_five_digits += "0"
        }
      
        var key = first_three_digits+second_two_digits+"-OEM-0"+mul_of_seven+"-"+last_five_digits
      
        println(key)
    }
  
    def main(): Unit = {
        println("5 CD Keys:")
        for(x <- 1 to 5) {
            gen_key()
        }
        println(" ")
        println("5 CD Keys (OEM):")
        for(x <- 1 to 5) {
            gen_oem()
        }
    }
}

Main.main()
  