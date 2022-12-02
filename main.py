import pymysql
import pandas as pd

cnx = pymysql.connect(user='root', password='password', host='localhost', database='OnlinePurchaseDB')
cr = cnx.cursor()

# Continually asks the user if they are a returning user until y or n is given
while True:
    returningUser = str(input("Are you a returning user? (y/n) "))

    if returningUser.lower() == 'y' or returningUser.lower() == 'n':
        break
    else:
        print("Please enter a valid response (y/n)")

# If it is a returning user 
if returningUser.lower() == 'y':

    # Keeps asking the user for a correct username and password 
    while True:
        userName = str(input("Username: "))
        password = str(input("Password: "))
        # Try except block to catch an error from no result from the select query
        try:
            query = f"SELECT username, password FROM credentials WHERE username = '{userName}' AND password = '{password}';"
            result = cr.execute(query)
            if result == 1:
                break
        except: 
            print("Invalid UserId or Password")

# If the user is not a returning user then create an account
elif returningUser.lower() == 'n':
    fname = str(input("First Name: "))
    lname = str(input("Last Name: "))
    DOB = str(input("Date of Birth (YYYY-MM-DD): "))
    userName = str(input("Username: "))
    password = str(input("Password: "))
    address = str(input("Home Street Address: "))
    customerID = 'Null'
    # Try except block to catch the error of 
    try:
        query1 = f"INSERT INTO customer VALUES ('{userName}', {customerID}, '{fname}', '{lname}', '{DOB}', '{address}');"
        query2 = f"INSERT INTO credentials VALUES ('{userName}', '{password}');"

        cr.execute(query1)
        cnx.commit()
        cr.execute(query2)
        cnx.commit()
    except: 
        print()

    print("User Successfully Created!")

print("--- Welcome to our store ---")

# Keeps asking the user for one of the options
while True:
    print("Type 1 if you want to buy some items")
    print("Type 2 if you want to see your 5 most recent purchases")

    choice = int(input("User: "))
    if choice == 1 or choice == 2:
        break
    else:
        print("Please Enter A Valid Choice!")

print("--- Customer Interface ---")

# If the user chooses 1 
if choice == 1:
    query = "SELECT itemId, itemName, price FROM items;"
    nbRes = cr.execute(query)
    itemInfo = {"Item ID" : [], "Item Name" : [], "Price" : []}
    
    # Keeps printing the first 5 items the user can buy
    while True:
        for itemId, itemName, price in cr.fetchall(): 
            itemInfo["Item ID"].append(itemId)
            itemInfo["Item Name"].append(itemName)
            itemInfo["Price"].append(price)

        # Uses a dataframe to print the info out cleaner
        df = pd.DataFrame.from_dict(itemInfo)
        print(df.to_string(index=False))

        # Keeps asking the user for what item they want to buy until they type -1
        while True:
            purchase = int(input("What would you like to purchase (Input Item ID, -1 to quit): "))
            print(purchase)
            # Close program if the user types -1
            if purchase == -1:
                break
            # Asks the user how many of the chosen item they would like to buy and prints a message of their choices
            else:
                try:
                    query = "SELECT itemName FROM items WHERE itemId = {};".format(purchase)
                    item = cr.execute(query)
                    itemName = cr.fetchone()

                    for item in itemName:
                        result = item

                    quantity = int(input("How many would you like to buy: "))
                    print(f"You just purchased {quantity} {result}")
                except:
                    print("Please enter a valid Item ID or -1 to quit")
        break
    print("Program Quitting...")

                
# Prints the 5 most recent bills for the user logged in
elif choice == 2:
    query = "SELECT * FROM bill b, customer c  WHERE b.customerId = c.customerId AND b.customerId = (SELECT customerId FROM customer WHERE username = '{userName}') LIMIT 5;"

    nbRes = cr.execute(query)

    billInfo = {"Customer ID" : [], "Account Number" : [], "Order Number" : [], "Item ID" : [], "Zipcode" : [], "Total" : [], "Date" : []}
    
    # Prints each of the fields from the bill table for the given user
    for customerId, acctNo, orderNo, itemId, zipcode, total, date, username, customerId, fname, lname, DOB, HomeAddr in cr.fetchall(): 
        billInfo["Customer ID"].append(customerId)
        billInfo["Account Number"].append(acctNo)
        billInfo["Order Number"].append(orderNo)
        billInfo["Item ID"].append(itemId)
        billInfo["Zipcode"].append(zipcode)
        billInfo["Total"].append(total)
        billInfo["Date"].append(date)

    # Uses a dataframe to print the info out cleaner
    df = pd.DataFrame.from_dict(billInfo)

    if df.empty == True:
        print("You have no recent bills")
    else:
        print(df.to_string(index=False))
