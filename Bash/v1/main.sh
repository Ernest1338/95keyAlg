#!/bin/bash

gen_key() {
    first_three_digits=$[ 1 + $RANDOM % 999 ]

    while [ $first_three_digits -eq 333 ] || [ $first_three_digits -eq 444 ] || [ $first_three_digits -eq 555 ] || [ $first_three_digits -eq 666 ] || 
            [ $first_three_digits -eq 777 ] || [ $first_three_digits -eq 888 ] || [ $first_three_digits -eq 999 ]
    do
        first_three_digits=$[ $RANDOM % 999 ]
    done

    first_three_digits_len=$(echo $first_three_digits | wc -c)

    while [ $first_three_digits_len -lt 4 ]
    do
        first_three_digits=$(echo $first_three_digits\0)
        first_three_digits_len=$(echo $first_three_digits | wc -c)
    done

    mul_of_seven=$[ 1 + $RANDOM * 999 % 9999999 ]
    num_added_together=0

    for i in $(echo $mul_of_seven | sed -e 's/\(.\)/\1\n/g')
    do
        num_added_together=$(( $num_added_together + $i ))
    done

    while [ $(( $num_added_together % 7 )) -ne 0 ]
    do
        mul_of_seven=$[ 1 + $RANDOM * 999 % 9999999 ]
        num_added_together=0

        for i in $(echo $mul_of_seven | sed -e 's/\(.\)/\1\n/g')
        do
            num_added_together=$(( $num_added_together + $i ))
        done
    done

    mul_of_seven_len=$(echo $mul_of_seven | wc -c)

    while [ $mul_of_seven_len -lt 8 ]
    do
        mul_of_seven=$(echo $mul_of_seven\0)
        mul_of_seven_len=$(echo $mul_of_seven | wc -c)
    done

    key=$(echo $first_three_digits\-$mul_of_seven)

    echo $key
}

gen_oem() {
    first_three_digits=$[ 1 + $RANDOM % 366 ]

    first_three_digits_len=$(echo $first_three_digits | wc -c)

    while [ $first_three_digits_len -lt 4 ]
    do
        first_three_digits=$(echo 0$first_three_digits)
        first_three_digits_len=$(echo $first_three_digits | wc -c)
    done

    second_two_digits=$[ 95 + $RANDOM % 8 ]
    second_two_digits_len=$(echo $second_two_digits | wc -c)

    if [ $second_two_digits_len -eq 4 ]
    then
        second_two_digits=${second_two_digits:1}
    fi

    mul_of_seven=$[ 1 + $RANDOM * 999 % 999999 ]
    num_added_together=0

    for i in $(echo $mul_of_seven | sed -e 's/\(.\)/\1\n/g')
    do
        num_added_together=$(( $num_added_together + $i ))
    done

    while [ $(( $num_added_together % 7 )) -ne 0 ]
    do
        mul_of_seven=$[ 1 + $RANDOM * 999 % 999999 ]
        num_added_together=0

        for i in $(echo $mul_of_seven | sed -e 's/\(.\)/\1\n/g')
        do
            num_added_together=$(( $num_added_together + $i ))
        done
    done

    mul_of_seven_len=$(echo $mul_of_seven | wc -c)

    while [ $mul_of_seven_len -lt 7 ]
    do
        mul_of_seven=$(echo $mul_of_seven\0)
        mul_of_seven_len=$(echo $mul_of_seven | wc -c)
    done

    last_five_digits=$[ 1 + $RANDOM * 99 % 99999 ]
    last_five_digits_len=$(echo $last_five_digits | wc -c)

    while [ $last_five_digits_len -lt 6 ]
    do
        last_five_digits=$(echo $last_five_digits\0)
        last_five_digits_len=$(echo $last_five_digits | wc -c)
    done

    key=$(echo $first_three_digits$second_two_digits\-OEM-0$mul_of_seven\-$last_five_digits)

    echo $key
}

main() {
    echo "5 CD Keys:"
    for i in {1..5}
    do
        gen_key
    done
    echo ""
    echo "5 CD Keys (OEM):"
    for i in {1..5}
    do
        gen_oem
    done
}

main
