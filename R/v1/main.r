gen_key <- function() {
    # generating random number in range from 0 to 999 (max 3 digit number)
    first_three_digits = sprintf("%d", floor(runif(1, 0, 999+1)))

    while(first_three_digits=="333" || first_three_digits=="444" || first_three_digits=="555" || first_three_digits=="666" 
        || first_three_digits=="777" || first_three_digits=="888" || first_three_digits=="999") {
        # regenerating random number to the point when they are not repeating (excluding 111 and 222)
        first_three_digits = sprintf("%d", floor(runif(1, 0, 999+1)))
    }

    while(nchar(first_three_digits)<3) {
        # adding trailing zeros if necessary (to match length of 3)
        first_three_digits = paste(first_three_digits, "0", sep="")
    }

    # generating random number in range from 0 to 9999999 (max 7 digit number)
    mul_of_seven = sprintf("%d", floor(runif(1, 0, 9999999+1)))

    # creating variable which will be use to count sum of all digits generated in the previous step
    num_added_together = 0

    # creating list of digits from number contained in mul_of_seven variable
    mul_of_seven_split = strsplit(mul_of_seven, "")[[1]]

    # iterating over each digit in list mul_of_seven_split
    for(i in mul_of_seven_split) {
        # adding digit to variable num_added_together
        num_added_together = num_added_together + strtoi(i, 10)
    }

    # repeating previous steps until generated number will be divisible by 7
    while(num_added_together%%7!=0) {
        # regenerating random number in range from 0 to 9999999 (max 7 digit number)
        mul_of_seven = sprintf("%d", floor(runif(1, 0, 9999999+1)))

        # assigning 0 to variable used to sum digits from variable mul_of_seven
        num_added_together = 0

        # recreating list of digits from number contained in mul_of_seven variable
        mul_of_seven_split = strsplit(mul_of_seven, "")[[1]]

        # summing digits from list mul_of_seven_split to variable num_added_together
        for(i in mul_of_seven_split) {
            num_added_together = num_added_together + strtoi(i, 10)
        }
    }

    while(nchar(mul_of_seven)<7) {
        # adding trailing zeros if necessary (to match length of 7)
        mul_of_seven = paste(mul_of_seven, "0", sep="")
    }

    # combining all needed variables with dashes and other constants into variable named key
    key = paste(first_three_digits, mul_of_seven, sep="-")

    # displaying generated key to user
    print(key)
}

gen_oem <- function() {
    # generating random number in range from 1 to 366
    first_three_digits = sprintf("%d", floor(runif(1, 1, 366+1)))

    while(nchar(first_three_digits)<3) {
        # adding zeros at the beginning if necessary (to match length of 3)
        temp = first_three_digits
        first_three_digits = paste("0", temp, sep="")
    }

    # generating random number in range from 95 to 102
    second_two_digits = sprintf("%d", floor(runif(1, 95, 102+1)))

    if(nchar(second_two_digits)==3) {
        # if generated number is 3 digits long then remove first digit
        second_two_digits = substr(second_two_digits, 2, 3)
    }

    # generating random number in range from 0 to 999999 (max 6 digit number) and adding zero at the beginning
    mul_of_seven = sprintf("%d", floor(runif(1, 0, 999999+1)))

    # creating variable which will be use to count sum of all digits generated in the previous step
    num_added_together = 0

    # creating list of digits from number contained in mul_of_seven variable
    mul_of_seven_split = strsplit(mul_of_seven, "")[[1]]

    # iterating over each digit in list mul_of_seven_split
    for(i in mul_of_seven_split) {
        # adding digit to variable num_added_together
        num_added_together = num_added_together + strtoi(i, 10)
    }

    # repeating previous steps until generated number will be divisible by 7
    while(num_added_together%%7!=0) {
        # regenerating random number in range from 0 to 999999 (max 6 digit number)
        mul_of_seven = sprintf("%d", floor(runif(1, 0, 999999+1)))

        # assigning 0 to variable used to sum digits from variable mul_of_seven
        num_added_together = 0

        # recreating list of digits from number contained in mul_of_seven variable
        mul_of_seven_split = strsplit(mul_of_seven, "")[[1]]

        # summing digits from list mul_of_seven_split to variable num_added_together
        for(i in mul_of_seven_split) {
            num_added_together = num_added_together + strtoi(i, 10)
        }
    }

    while(nchar(mul_of_seven)<6) {
        # adding trailing zeros if necessary (to match length of 6)
        mul_of_seven = paste(mul_of_seven, "0", sep="")
    }

    # generating random number in range from 0 to 99999 (max 5 digit number)
    last_five_digits = sprintf("%d", floor(runif(1, 0, 99999+1)))

    while(nchar(last_five_digits)<5) {
        # adding trailing zeros if necessary (to match length of 5)
        last_five_digits = paste(last_five_digits, "0", sep="")
    }

    # combining all needed variables with dashes and other constants into variable named key
    key = paste(first_three_digits, second_two_digits, sep="")
    key = paste(key, mul_of_seven, sep="-OEM-0")
    key = paste(key, last_five_digits, sep="-")

    # displaying generated key to user
    print(key)
}

main <- function() {

    print("5 CD Keys:")

    # generating 5 keys (and displaying them)
    for(i in 1:5) {
        gen_key()
    }

    print("")
    print("5 CD Keys (OEM):")

    # generating 5 OEM keys (and displaying them)
    for(i in 1:5) {
        gen_oem()
    }
}

# executing main function
main()
