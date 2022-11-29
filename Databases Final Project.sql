-- DROP DATABASE OnlinePurchaseDB;
CREATE DATABASE OnlinePurchaseDB;
USE OnlinePurchaseDB;

CREATE TABLE credentials(
	userId INT,
	password VARCHAR(255),
  	PRIMARY KEY(userId)
);

CREATE TABLE customer(
	userId INT,
	customerId INT,
    fname VARCHAR(255),
    lname VARCHAR(255),
    DOB DATE,
	Home Addr VARCHAR(255), 
  	PRIMARY KEY(customerID)
);

CREATE TABLE Cart(
	customerID INT,
	itemID VARCHAR(255), 
    date DATE,
    quantity INT,
  	PRIMARY KEY(customerID)
);

CREATE TABLE address(
	Home Addr VARCHAR(255),
	zipcode INT,
	city VARCHAR(255),
  	PRIMARY KEY(Home Addr)
);

CREATE TABLE bank account( 
	accNo INT, 
	customerId INT, 
	bankName VARCHAR(255),
	PRIMARY KEY(customerId)
);

CREATE TABLE suppliers(
	itemId INT, 
	location VARCHAR(255),
  	PRIMARY KEY(orderNo)
);

CREATE TABLE items(
    itemID VARCHAR(255),
    itemName VARCHAR(255),
	numberInStock INT,
    price FLOAT(7, 2), 
    PRIMARY KEY(itemID)
);

CREATE TABLE bill(
	customerID INT,
	acctNo INT, 
	orderNo INT, 
	itemId INT, 
	zipcode INT,
	total FLOAT(20, 2),
	date DATE,
  	PRIMARY KEY(customerID)
);

CREATE TABLE discount(
	itemID INT, 
	percentOff FLOAT(1, ),
	PRIMARY KEY(itemID)
);

INSERT INTO credentials VALUES (12345, "Password");
INSERT INTO credentials VALUES (54321, "IceCream");
INSERT INTO credentials VALUES (13542, "PaSsWoRd");

INSERT INTO customer VALUES (12345, 984654, "John", "Doe", "1993-04-21", "497 Lakewood St");
INSERT INTO customer VALUES (54321, 349165, "Jack", "Lloyd", "2000-05-15", "381 College St");
INSERT INTO customer VALUES (13542, 765154, "Matt", "Dunn", "1985-01-05", "9101 Main St");

INSERT INTO Cart VALUES (984654, 4567, CURDATE(), 1);
INSERT INTO Cart VALUES (349165, 2345, CURDATE(), 1);
INSERT INTO Cart VALUES (765154, 8765, CURDATE(), 1);

INSERT INTO address VALUES ("4927 Perch Dr", 34681, "Charlottesville");
INSERT INTO address VALUES ("9047 Slip Rd", 97651, "Washington");
INSERT INTO address VALUES ("529 Gravy Lane", 98462, "San Diego");

INSERT INTO bank account VALUES (94618, 984654, "Bank Of America")
INSERT INTO bank account VALUES (34981, 349165, "Citi Bank")
INSERT INTO bank account VALUES (76412, 765154, "Chase Bank")

INSERT INTO suppliers VALUES (4567, "9234 Wards Rd");
INSERT INTO suppliers VALUES (2345, "1948 Forest Rd");
INSERT INTO suppliers VALUES (8765, "4028 Link Rd");

INSERT INTO items VALUES (4567, "Pen", 100, 0.75);
INSERT INTO items VALUES (2345, "Pencil", 100, 0.50);
INSERT INTO items VALUES (8765, "Notebook", 100, 5.00);

INSERT INTO bill VALUES (984654, 09345, 4567, 34681, CURDATE(), 1.25);
INSERT INTO bill VALUES (349165, 46831, 2345, 97651, CURDATE(), 5.00);
INSERT INTO bill VALUES (765154, 07602, 8765, 98462, CURDATE(), 20.00);

INSERT INTO discount VALUES (4567, .20);
INSERT INTO discount VALUES (2345, .5);
INSERT INTO discount VALUES (8765, .10);






