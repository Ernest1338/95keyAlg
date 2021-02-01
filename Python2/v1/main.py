import random

print "5 CD Keys:"
for i in range(5):
    tripNum = random.randint(0, 999)
    while tripNum==333 or tripNum==444 or tripNum==555 or tripNum==666 or tripNum==777 or tripNum==888 or tripNum==999:
        tripNum = random.randint(0, 999)

    while len(str(tripNum))<3:
        tripNum = str(tripNum)+"0"

    num_of_len_seven = str(random.randint(0, 9999999))
    num_added_together = 0

    for a in num_of_len_seven:
        num_added_together+=int(a)

    while num_added_together%7!=0:

        num_of_len_seven = str(random.randint(0, 9999999))
        num_added_together = 0

        for a in num_of_len_seven:
            num_added_together+=int(a)

    while len(num_of_len_seven)<7:
        num_of_len_seven+="0"

    key = str(tripNum)+"-"+str(num_of_len_seven)
    print key

print "\n5 CD Keys (OEM):"
for i in range(5):
    first_three_digits = str(random.randint(1,366))
    while len(first_three_digits)<3:
        first_three_digits = "0"+first_three_digits

    second_two_digits = str(random.randint(95, 102))
    if len(second_two_digits)==3:
        second_two_digits = second_two_digits[1:]

    num_of_len_seven = "0"+str(random.randint(0, 999999))
    num_added_together = 0

    for a in num_of_len_seven:
        num_added_together+=int(a)

    while num_added_together%7!=0:

        num_of_len_seven = "0"+str(random.randint(0, 999999))
        num_added_together = 0

        for a in num_of_len_seven:
            num_added_together+=int(a)

    while len(num_of_len_seven)<7:
        num_of_len_seven+="0"

    last_five_digits = str(random.randint(0,99999))

    while len(last_five_digits)<5:
        last_five_digits+="0"

    key = str(first_three_digits)+str(second_two_digits)+"-OEM-"+str(num_of_len_seven)+"-"+str(last_five_digits)

    print key
