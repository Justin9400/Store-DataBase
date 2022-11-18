-- DROP DATABASE OnlinePurchaseDB;
CREATE DATABASE OnlinePurchaseDB;
USE OnlinePurchaseDB;

CREATE TABLE customer(
	customerId INT,
	username VARCHAR(255),
	passwrd VARCHAR(255),
    fname VARCHAR(255),
    lname VARCHAR(255),
    DOB DATE, 
	Address VARCHAR(255),
  	PRIMARY KEY(customerID)
);
INSERT INTO customer VALUES (12345, "user1", "user1", "John", "Doe", "1993-04-21", "497 Lakewood St");
INSERT INTO customer VALUES (54321, "user2", "user2", "Jack", "Lloyd", "2000-05-15", "381 College St");
INSERT INTO customer VALUES (13542, "user3", "user3", "Matt", "Dunn", "1985-01-05", "9101 Main St");

CREATE TABLE items(
    itemID VARCHAR(255),
    itemName VARCHAR(255),
    price FLOAT(7, 2), 
    numberInStock INT,
    PRIMARY KEY(itemID)
);
INSERT INTO items VALUES (4567, "Pen", 0.75, 100);
INSERT INTO items VALUES (2345, "Pencil", 0.50, 100);
INSERT INTO items VALUES (8765, "Notebook", 5.00, 100);

CREATE TABLE discount(
	itemID INT, 
	percentOff INT,
	PRIMARY KEY(itemID)
);
INSERT INTO discount VALUES (4567, 20);
INSERT INTO discount VALUES (2345, 5);
INSERT INTO discount VALUES (8765, 10);

CREATE TABLE Cart(
	customerID INT,
	itemID VARCHAR(255), 
    price FLOAT(7, 2),
    quantity INT,
  	PRIMARY KEY(customerID)
);
INSERT INTO Cart VALUES (12345, 4567, 0.75, 1);
INSERT INTO Cart VALUES (54321, 2345, 0.50, 1);
INSERT INTO Cart VALUES (13542, 8765, 5.00, 1);

CREATE TABLE bill(
	acctNo INT, 
	orderNo INT, 
	itemId INT, 
	total FLOAT(20, 2),
  	PRIMARY KEY(acctNo)
);
INSERT INTO bill VALUES (84567, 09345, 4567, 1.25);
INSERT INTO bill VALUES (23689, 46831, 2345, 5.00);
INSERT INTO bill VALUES (09364, 07602, 8765, 20.00);

CREATE TABLE suppliers(
	orderNo INT, 
	location VARCHAR(255),
  	PRIMARY KEY(orderNo)
);
INSERT INTO suppliers VALUES (09345, 1.25);
INSERT INTO suppliers VALUES (46831, 5.00);
INSERT INTO suppliers VALUES (07602, 20.00);