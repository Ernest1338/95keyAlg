import random

def gen_key():
    # generating random number in range from 0 to 999 (max 3 digit number)
    first_three_digits = random.randint(0, 999)

    while first_three_digits==333 or first_three_digits==444 or first_three_digits==555 or first_three_digits==666 or first_three_digits==777 or first_three_digits==888 or first_three_digits==999:
        # regenerating random number to the point when they are not repeating (excluding 111 and 222)
        first_three_digits = random.randint(0, 999)

    while len(str(first_three_digits))<3:
        # adding trailing zeros if necessary (to match length of 3)
        first_three_digits = str(first_three_digits)+"0"

    # generating random number in range from 0 to 999999 (max 6 digit number)
    mul_of_seven = str(random.randint(0, 999999))

    # creating variable which will be use to count sum of all digits generated in the previous step
    num_added_together = 0

    # iterating over each digit in variable mul_of_seven
    for a in mul_of_seven:

        # adding digit to variable num_added_together
        num_added_together+=int(a)

    while len(mul_of_seven)<6:
        # adding trailing zeros if necessary (to match length of 6)
        mul_of_seven+="0"

    # searching for remainder value to make mul_of_seven divisible by 7
    for a in range(7):
        if (num_added_together+(a+1))%7==0:
            # adding this value to the end of mul_of_seven variable
            mul_of_seven+=str(a+1)
            break

    # combining all needed variables with dashes and other constants into variable named key
    key = str(first_three_digits)+"-"+str(mul_of_seven)

    # displaying generated key to user
    print key

def gen_oem():
    # generating random number in range from 1 to 366
    first_three_digits = str(random.randint(1,366))

    while len(first_three_digits)<3:
        # adding zeros at the beginning if necessary (to match length of 3)
        first_three_digits = "0"+first_three_digits

    # generating random number in range from 95 to 102
    second_two_digits = str(random.randint(95, 102))

    if len(second_two_digits)==3:
        # if generated number is 3 digits long then remove first digit
        second_two_digits = second_two_digits[1:]

    # generating random number in range from 0 to 99999 (max 5 digit number) and adding zero at the beginning
    mul_of_seven = "0"+str(random.randint(0, 99999))

    # creating variable which will be use to count sum of all digits generated in the previous step
    num_added_together = 0

    # iterating over each digit in variable mul_of_seven
    for a in mul_of_seven:

        # adding digit to variable num_added_together
        num_added_together+=int(a)

    while len(mul_of_seven)<6:
        # adding trailing zeros if necessary (to match length of 6)
        mul_of_seven+="0"

    # searching for remainder value to make mul_of_seven divisible by 7
    for a in range(7):
        if (num_added_together+(a+1))%7==0:
            # adding this value to the end of mul_of_seven variable
            mul_of_seven+=str(a+1)
            break

    # generating random number in range from 0 to 99999 (max 5 digit number)
    last_five_digits = str(random.randint(0,99999))

    while len(last_five_digits)<5:
        # adding trailing zeros if necessary (to match length of 5)
        last_five_digits+="0"

    # combining all needed variables with dashes and other constants into variable named key
    key = str(first_three_digits)+str(second_two_digits)+"-OEM-"+str(mul_of_seven)+"-"+str(last_five_digits)

    # displaying generated key to user
    print key

def main():

    print "5 CD Keys:"

    # generating 5 keys (and displaying them)
    for _ in range(5):
        gen_key()

    print "\n5 CD Keys (OEM):"

    # generating 5 OEM keys (and displaying them)
    for _ in range(5):
        gen_oem()

# executing main function
main()
