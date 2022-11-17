CREATE DATABASE OnlinePurchaseDB;

CREATE TABLE customer(
	customerId INT,
	userId INT,
	password VARCHAR(255),
    fname VARCHAR(255),
    lname VARCHAR(255),
    DOB DATE, 
	Address VARCHAR(255),
  	PRIMARY KEY(customerID)
);

CREATE TABLE items(
    itemID VARCHAR(255),
    itemName VARCHAR(255),
    price FLOAT(7, 2), 
    numberInStock INT,
    PRIMARY KEY(itemID)
);

CREATE TABLE discount(
	itemID INT, 
	percentOff INT,
	PRIMARY KEY(itemID)
);

CREATE TABLE Cart(
	customerID INT,
	itemID VARCHAR(255), 
    price FLOAT(7, 2),
    quantity INT,
    total FLOAT(10, 2),
  	PRIMARY KEY(customerID)
);

CREATE TABLE bill(
	acctNo INT, 
	orderNo INT, 
	itemId INT, 
	total FLOAT(20, 2),
  	PRIMARY KEY(acctNo)
);

CREATE TABLE suppliers(
	orderNo INT, 
	location VARCHAR(255),
  	PRIMARY KEY(orderNo)
);