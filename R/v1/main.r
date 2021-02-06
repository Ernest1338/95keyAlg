gen_key <- function() {
    first_three_digits = sprintf("%d", floor(runif(1, 0, 999+1)))
    
    while(first_three_digits=="333" || first_three_digits=="444" || first_three_digits=="555" || first_three_digits=="666" 
        || first_three_digits=="777" || first_three_digits=="888" || first_three_digits=="999") {
        first_three_digits = sprintf("%d", floor(runif(1, 0, 999+1)))
    }
    
    while(nchar(first_three_digits)<3) {
        first_three_digits = paste(first_three_digits, "0", sep="")
    }
    
    mul_of_seven = sprintf("%d", floor(runif(1, 0, 9999999+1)))
    num_added_together = 0
    mul_of_seven_split = strsplit(mul_of_seven, "")[[1]]
    
    for(i in mul_of_seven_split) {
        num_added_together = num_added_together + strtoi(i, 10)
    }
    
    while(num_added_together%%7!=0) {
        mul_of_seven = sprintf("%d", floor(runif(1, 0, 9999999+1)))
        num_added_together = 0
        mul_of_seven_split = strsplit(mul_of_seven, "")[[1]]
        
        for(i in mul_of_seven_split) {
            num_added_together = num_added_together + strtoi(i, 10)
        }
    }
    
    while(nchar(mul_of_seven)<7) {
        mul_of_seven = paste(mul_of_seven, "0", sep="")
    }
    
    key = paste(first_three_digits, mul_of_seven, sep="-")
    
    print(key)
}

gen_oem <- function() {
    first_three_digits = sprintf("%d", floor(runif(1, 1, 366+1)))
    
    while(nchar(first_three_digits)<3) {
        temp = first_three_digits
        first_three_digits = paste("0", temp, sep="")
    }
    
    second_two_digits = sprintf("%d", floor(runif(1, 95, 102+1)))
    
    if(nchar(second_two_digits)==3) {
        second_two_digits = substr(second_two_digits, 2, 3)
    }
    
    mul_of_seven = sprintf("%d", floor(runif(1, 0, 999999+1)))
    num_added_together = 0
    mul_of_seven_split = strsplit(mul_of_seven, "")[[1]]
    
    for(i in mul_of_seven_split) {
        num_added_together = num_added_together + strtoi(i, 10)
    }
    
    while(num_added_together%%7!=0) {
        mul_of_seven = sprintf("%d", floor(runif(1, 0, 999999+1)))
        num_added_together = 0
        mul_of_seven_split = strsplit(mul_of_seven, "")[[1]]
        
        for(i in mul_of_seven_split) {
            num_added_together = num_added_together + strtoi(i, 10)
        }
    }
    
    while(nchar(mul_of_seven)<6) {
        mul_of_seven = paste(mul_of_seven, "0", sep="")
    }
    
    last_five_digits = sprintf("%d", floor(runif(1, 0, 99999+1)))
    
    while(nchar(last_five_digits)<5) {
        last_five_digits = paste(last_five_digits, "0", sep="")
    }
    
    key = paste(first_three_digits, second_two_digits, sep="")
    key = paste(key, mul_of_seven, sep="-OEM-0")
    key = paste(key, last_five_digits, sep="-")
    
    print(key)
}

main <- function() {
    print("5 CD Keys:")
    for(i in 1:5) {
        gen_key()
    }
    print("")
    print("5 CD Keys (OEM):")
    for(i in 1:5) {
        gen_oem()
    }
}

main()
