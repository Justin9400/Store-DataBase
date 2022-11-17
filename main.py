returningUser = str(input("Are you a returning user? "))

if returningUser == 'Yes' or returningUser == 'yes':
    userName = str(input("User Name: "))
    password = str(input("Password: "))

elif returningUser == 'No' or returningUser == 'no':
    fname = str(input("First Name: "))
    lname = str(input("Last Name: "))
    DOB = str(input("Date of Birth: "))
    userName = str(input("User Name: "))
    password = str(input("Password: "))

print("Welcome to our store")

print("Type 1 if you want to buy some items")
print("Type 2 if you want to see your purchase history")
choice = int(input("User: "))

if choice == 1:
    
elif choice == 2: