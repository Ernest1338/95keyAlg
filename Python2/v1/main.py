import random

def gen_key():
    first_three_digits = random.randint(0, 999)
    while first_three_digits==333 or first_three_digits==444 or first_three_digits==555 or first_three_digits==666 or first_three_digits==777 or first_three_digits==888 or first_three_digits==999:
        first_three_digits = random.randint(0, 999)

    while len(str(first_three_digits))<3:
        first_three_digits = str(first_three_digits)+"0"

    mul_of_seven = str(random.randint(0, 9999999))
    num_added_together = 0

    for a in mul_of_seven:
        num_added_together+=int(a)

    while num_added_together%7!=0:

        mul_of_seven = str(random.randint(0, 9999999))
        num_added_together = 0

        for a in mul_of_seven:
            num_added_together+=int(a)

    while len(mul_of_seven)<7:
        mul_of_seven+="0"

    key = str(first_three_digits)+"-"+str(mul_of_seven)
    print key

def gen_oem():
    first_three_digits = str(random.randint(1,366))
    while len(first_three_digits)<3:
        first_three_digits = "0"+first_three_digits

    second_two_digits = str(random.randint(95, 102))
    if len(second_two_digits)==3:
        second_two_digits = second_two_digits[1:]

    mul_of_seven = "0"+str(random.randint(0, 999999))
    num_added_together = 0

    for a in mul_of_seven:
        num_added_together+=int(a)

    while num_added_together%7!=0:

        mul_of_seven = "0"+str(random.randint(0, 999999))
        num_added_together = 0

        for a in mul_of_seven:
            num_added_together+=int(a)

    while len(mul_of_seven)<7:
        mul_of_seven+="0"

    last_five_digits = str(random.randint(0,99999))

    while len(last_five_digits)<5:
        last_five_digits+="0"

    key = str(first_three_digits)+str(second_two_digits)+"-OEM-"+str(mul_of_seven)+"-"+str(last_five_digits)
    print key

def main():
    print "5 CD Keys:"
    for _ in range(5):
        gen_key()

    print "\n5 CD Keys (OEM):"
    for _ in range(5):
        gen_oem()

main()
