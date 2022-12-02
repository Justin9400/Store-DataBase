import pymysql
import pandas as pd

cnx = pymysql.connect(user='root', password='password', host='localhost', database='OnlinePurchaseDB')
cr = cnx.cursor()

while True:
    returningUser = str(input("Are you a returning user? (y/n) "))

    if returningUser == 'y' or returningUser == 'n':
        break
    else:
        print("Please enter a valid response (y/n)")


if returningUser.lower() == 'y':
    while True:
        userName = str(input("UserId: "))
        password = str(input("Password: "))

        try:
            query = "SELECT userId, password FROM credentials WHERE userId = {} AND password = {};".format(userName, password)
            result = cr.execute(query)
            if result == 1:
                break
        except: 
            print("Invalid UserId or Password")

elif returningUser.lower() == 'n':
    fname = str(input("First Name: "))
    lname = str(input("Last Name: "))
    DOB = str(input("Date of Birth: "))
    userName = str(input("Username: "))
    password = str(input("Password: "))
    address = str(input("Home Street Address: "))
    try:
        query = "INSERT INTO customer VALUES ({}, {}, {}, {}, {}, {})".format(userName, None, fname, lname, DOB, address)
        result = cr.execute(query)
    except: 
        print("Invalid UserId or Password")

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
if choice == 1:
    query = "SELECT itemId, itemName, price FROM items;"
    nbRes = cr.execute(query)
    itemInfo = {"Item ID" : [], "Item Name" : [], "Price" : []}
    
    while True:
        for itemId, itemName, price in cr.fetchall(): 
            itemInfo["Item ID"].append(itemId)
            itemInfo["Item Name"].append(itemName)
            itemInfo["Price"].append(price)

        df = pd.DataFrame.from_dict(itemInfo)
        print(df.to_string(index=False))

        while True:
            purchase = int(input("What would you like to purchase (Input Item ID, -1 to quit): "))
            
            if purchase == -1:
                break
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

                

elif choice == 2:
    query = "SELECT * FROM bill LIMIT 5;"
    nbRes = cr.execute(query)

    billInfo = {"Customer ID" : [], "Account Number" : [], "Order Number" : [], "Item ID" : [], "Zipcode" : [], "Total" : [], "Date" : []}
    
    for customerId, acctNo, orderNo, itemId, zipcode, total, date in cr.fetchall(): 
        billInfo["Customer ID"].append(customerId)
        billInfo["Account Number"].append(acctNo)
        billInfo["Order Number"].append(orderNo)
        billInfo["Item ID"].append(itemId)
        billInfo["Zipcode"].append(zipcode)
        billInfo["Total"].append(total)
        billInfo["Date"].append(date)

    df = pd.DataFrame.from_dict(billInfo)
    print(df.to_string(index=False))
