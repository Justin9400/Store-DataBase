
while True:
    returningUser = str(input("Are you a returning user? (y/n) "))

    if returningUser == 'y' or returningUser == 'n':
        break
    else:
        print("Please enter a valid response (y/n)")


if returningUser.lower() == 'y':
    userName = str(input("Username: "))
    password = str(input("Password: "))

elif returningUser.lower() == 'n':
    fname = str(input("First Name: "))
    lname = str(input("Last Name: "))
    DOB = str(input("Date of Birth: "))
    userName = str(input("User Name: "))
    password = str(input("Password: "))
    print("User Successfully Created!")

print("--- Welcome to our store ---")


while True:
    print("Type 1 if you want to buy some items")
    print("Type 2 if you want to see your 5 most recent purchases")

    choice = int(input("User: "))
    if choice == 1 or choice == 2:
        break
    else:
        print("Please Enter A Valid Choice!")


print("--- Customer Interface ---")
# if choice == 1:
    # Print each item and the price from the users cart
# elif choice == 2:
    # Print the 5 most recent bills 