#!/bin/bash

gen_key() {
    # generating random number in range from 0 to 999 (max 3 digit number)
    first_three_digits=$[ 1 + $RANDOM % 999 ]

    while [ $first_three_digits -eq 333 ] || [ $first_three_digits -eq 444 ] || [ $first_three_digits -eq 555 ] || [ $first_three_digits -eq 666 ] || 
            [ $first_three_digits -eq 777 ] || [ $first_three_digits -eq 888 ] || [ $first_three_digits -eq 999 ]
    do
        # regenerating random number to the point when they are not repeating (excluding 111 and 222)
        first_three_digits=$[ $RANDOM % 999 ]
    done

    # creating variable containing length of first_three_digits variable
    first_three_digits_len=$(echo $first_three_digits | wc -c)

    while [ $first_three_digits_len -lt 4 ]
    do
        # adding trailing zeros if necessary (to match length of 3)
        first_three_digits=$(echo $first_three_digits\0)
        first_three_digits_len=$(echo $first_three_digits | wc -c)
    done

    # generating random number in range from 0 to 9999999 (max 7 digit number)
    mul_of_seven=$[ 1 + $RANDOM * 999 % 9999999 ]

    # creating variable which will be use to count sum of all digits generated in the previous step
    num_added_together=0

    # iterating over each digit in variable mul_of_seven
    for i in $(echo $mul_of_seven | sed -e 's/\(.\)/\1\n/g')
    do
        # adding digit to variable num_added_together
        num_added_together=$(( $num_added_together + $i ))
    done

    # repeating previous steps until generated number will be divisible by 7
    while [ $(( $num_added_together % 7 )) -ne 0 ]
    do
        # regenerating random number in range from 0 to 9999999 (max 7 digit number)
        mul_of_seven=$[ 1 + $RANDOM * 999 % 9999999 ]

        # assigning 0 to variable used to sum digits from variable mul_of_seven
        num_added_together=0

        # summing digits in variable mul_of_seven to variable num_added_together
        for i in $(echo $mul_of_seven | sed -e 's/\(.\)/\1\n/g')
        do
            num_added_together=$(( $num_added_together + $i ))
        done
    done

    # creating variable containing length of mul_of_seven variable
    mul_of_seven_len=$(echo $mul_of_seven | wc -c)

    while [ $mul_of_seven_len -lt 8 ]
    do
        # adding trailing zeros if necessary (to match length of 7)
        mul_of_seven=$(echo $mul_of_seven\0)
        mul_of_seven_len=$(echo $mul_of_seven | wc -c)
    done

    # combining all needed variables with dashes and other constants into variable named key
    key=$(echo $first_three_digits\-$mul_of_seven)

    # displaying generated key to user
    echo $key
}

gen_oem() {
    # generating random number in range from 1 to 366
    first_three_digits=$[ 1 + $RANDOM % 366 ]

    # creating variable containing length of first_three_digits variable
    first_three_digits_len=$(echo $first_three_digits | wc -c)

    while [ $first_three_digits_len -lt 4 ]
    do
        # adding zeros at the beginning if necessary (to match length of 3)
        first_three_digits=$(echo 0$first_three_digits)
        first_three_digits_len=$(echo $first_three_digits | wc -c)
    done

    # generating random number in range from 95 to 102
    second_two_digits=$[ 95 + $RANDOM % 8 ]

    # creating variable containing length of second_two_digits variable
    second_two_digits_len=$(echo $second_two_digits | wc -c)

    if [ $second_two_digits_len -eq 4 ]
    then
        # if generated number is 3 digits long then remove first digit
        second_two_digits=${second_two_digits:1}
    fi

    # generating random number in range from 0 to 999999 (max 6 digit number)
    mul_of_seven=$[ 1 + $RANDOM * 999 % 999999 ]

    # creating variable which will be use to count sum of all digits generated in the previous step
    num_added_together=0

    # iterating over each digit in variable mul_of_seven
    for i in $(echo $mul_of_seven | sed -e 's/\(.\)/\1\n/g')
    do
        # adding digit to variable num_added_together
        num_added_together=$(( $num_added_together + $i ))
    done

    # repeating previous steps until generated number will be divisible by 7
    while [ $(( $num_added_together % 7 )) -ne 0 ]
    do
        # regenerating random number in range from 0 to 999999 (max 6 digit number)
        mul_of_seven=$[ 1 + $RANDOM * 999 % 999999 ]

        # assigning 0 to variable used to sum digits from variable mul_of_seven
        num_added_together=0

        # summing digits in variable mul_of_seven to variable num_added_together
        for i in $(echo $mul_of_seven | sed -e 's/\(.\)/\1\n/g')
        do
            num_added_together=$(( $num_added_together + $i ))
        done
    done

    # creating variable containing length of mul_of_seven variable
    mul_of_seven_len=$(echo $mul_of_seven | wc -c)

    while [ $mul_of_seven_len -lt 7 ]
    do
        # adding trailing zeros if necessary (to match length of 7)
        mul_of_seven=$(echo $mul_of_seven\0)
        mul_of_seven_len=$(echo $mul_of_seven | wc -c)
    done

    # generating random number in range from 0 to 99999 (max 5 digit number)
    last_five_digits=$[ 1 + $RANDOM * 99 % 99999 ]

    # creating variable containing length of last_five_digits variable
    last_five_digits_len=$(echo $last_five_digits | wc -c)

    while [ $last_five_digits_len -lt 6 ]
    do
        # adding trailing zeros if necessary (to match length of 5)
        last_five_digits=$(echo $last_five_digits\0)
        last_five_digits_len=$(echo $last_five_digits | wc -c)
    done

    # combining all needed variables with dashes and other constants into variable named key
    key=$(echo $first_three_digits$second_two_digits\-OEM-0$mul_of_seven\-$last_five_digits)

    # displaying generated key to user
    echo $key
}

main() {

    echo "5 CD Keys:"

    # generating 5 keys (and displaying them)
    for i in {1..5}
    do
        gen_key
    done

    echo ""
    echo "5 CD Keys (OEM):"

    # generating 5 OEM keys (and displaying them)
    for i in {1..5}
    do
        gen_oem
    done
}

# executing main function
main
