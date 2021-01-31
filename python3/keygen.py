import random

print("5 CD Keys: ")
for i in range(5):
    tripNum = random.randint(0, 999)
    while tripNum==333 or tripNum==444 or tripNum==555 or tripNum==666 or tripNum==777 or tripNum==888 or tripNum==999:
        tripNum = random.randint(0, 999)

    while len(str(tripNum))<3:
        tripNum = str(tripNum)+"0"

    multiple_of_seven = 7*random.randint(1,6)
    num_of_len_seven = str(random.randint(0, 9999999))
    num_added_together = 0

    for i in num_of_len_seven:
        num_added_together+=int(i)

    while (num_added_together!=7 and num_added_together!=14 and num_added_together!=21 and num_added_together!=28 and num_added_together!=35 
           and num_added_together!=42 and num_added_together!=49 and num_added_together!=56 and num_added_together!=63):

        num_of_len_seven = str(random.randint(0, 9999999))
        num_added_together = 0

        for i in num_of_len_seven:
            num_added_together+=int(i)

    while len(num_of_len_seven)<7:
        num_of_len_seven+="0"

    key = str(tripNum)+"-"+str(num_of_len_seven)
    print(key)