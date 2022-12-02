DROP DATABASE OnlinePurchaseDB;
CREATE DATABASE OnlinePurchaseDB;
USE OnlinePurchaseDB;

-- Create Tables
CREATE TABLE credentials(
	username  VARCHAR(255),
	password VARCHAR(255),
  	PRIMARY KEY(username)
);

CREATE TABLE customer(
	username  VARCHAR(255),
	customerId INT AUTO_INCREMENT,
    fname VARCHAR(255),
    lname VARCHAR(255),
    DOB DATE,
	HomeAddr VARCHAR(255), 
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
	HomeAddr VARCHAR(255),
	zipcode INT,
	city VARCHAR(255),
  	PRIMARY KEY(HomeAddr)
);

CREATE TABLE bankAccount( 
	accNo INT, 
	customerId INT, 
	bankName VARCHAR(255),
	PRIMARY KEY(customerId)
);

CREATE TABLE suppliers(
	itemId INT, 
	location VARCHAR(255),
  	PRIMARY KEY(itemId)
);

CREATE TABLE items(
    itemID VARCHAR(255),
    itemName VARCHAR(255),
	numberInStock INT,
    price FLOAT(7, 2), 
    PRIMARY KEY(itemID)
);

CREATE TABLE bill(
	customerId INT,
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
	percentOff FLOAT(3, 2),
	PRIMARY KEY(itemID)
);

-- Insert values into tables
INSERT INTO credentials VALUES ("JohnD123", "Password");
INSERT INTO credentials VALUES ("JackL456", "IceCream");
INSERT INTO credentials VALUES ("Matt789", "PaSsWoRd");
INSERT INTO credentials VALUES ("LizA987", "ThisPassword");
INSERT INTO credentials VALUES ("LaurenP654", "HelloWorld");

INSERT INTO customer VALUES ("JohnD123", 00001, "John", "Doe", "1993-04-21", "497 Lakewood St");
INSERT INTO customer VALUES ("JackL456", 00002, "Jack", "Lloyd", "2000-05-15", "381 College St");
INSERT INTO customer VALUES ("Matt789", 00003, "Matt", "Dunn", "1985-01-05", "9101 Main St");
INSERT INTO customer VALUES ("LizA987", 00004, "Liz", "Alford", "1993-06-29", "1174 Clearly Ln");
INSERT INTO customer VALUES ("LaurenP654", 00005, "Lauren", "Peach", "1991-12-19", "876 Dreary Ln");

INSERT INTO Cart VALUES (00001, 121212, CURDATE(), 1);
INSERT INTO Cart VALUES (00002, 232323, CURDATE(), 1);
INSERT INTO Cart VALUES (00003, 343434, CURDATE(), 1);
INSERT INTO Cart VALUES (00004, 454545, CURDATE(), 1);
INSERT INTO Cart VALUES (00005, 565656, CURDATE(), 1);

INSERT INTO address VALUES ("4927 Perch Dr", 34681, "Charlottesville");
INSERT INTO address VALUES ("9047 Slip Rd", 97651, "Washington");
INSERT INTO address VALUES ("529 Gravy Ln", 49294, "San Diego");
INSERT INTO address VALUES ("235 Sniper Dr", 59371, "Los Angelos");
INSERT INTO address VALUES ("854 Lady Slipper Ln", 29743, "Miami");

INSERT INTO bankAccount VALUES (01010, 00001, "Bank Of America");
INSERT INTO bankAccount VALUES (02020, 00002, "Citi Bank");
INSERT INTO bankAccount VALUES (03030, 00003, "Chase Bank");
INSERT INTO bankAccount VALUES (04040, 00004, "Credit Union");
INSERT INTO bankAccount VALUES (05050, 00005, "Bank of the James");

INSERT INTO suppliers VALUES (121212, "9234 Wards Rd");
INSERT INTO suppliers VALUES (232323, "148 Forest Rd");
INSERT INTO suppliers VALUES (343434, "4028 Link Rd");
INSERT INTO suppliers VALUES (454545, "9183 Wade Rd");
INSERT INTO suppliers VALUES (565656, "924 Carrington Rd");

INSERT INTO items VALUES (121212, "Pen", 1000, 0.75);
INSERT INTO items VALUES (232323, "Pencil", 1000, 0.50);
INSERT INTO items VALUES (343434, "Notebook", 1000, 2.00);
INSERT INTO items VALUES (454545, "Backpack", 200, 20.00);
INSERT INTO items VALUES (565656, "Laptop", 100, 500.00);

INSERT INTO bill VALUES (00001, 01010, 09876, 121212, 34681, 1.25, CURDATE());
INSERT INTO bill VALUES (00002, 02020, 12345, 232323, 97651, 5.00, CURDATE());
INSERT INTO bill VALUES (00003, 03030, 13579, 343434, 49294, 20.00, CURDATE());
INSERT INTO bill VALUES (00004, 04040, 24680, 454545, 59371, 20.00, CURDATE());
INSERT INTO bill VALUES (00005, 05050, 36912, 565656, 29743, 20.00, CURDATE());

INSERT INTO discount VALUES (121212, .20);
INSERT INTO discount VALUES (232323, .50);
INSERT INTO discount VALUES (343434, .50);
INSERT INTO discount VALUES (454545, .10);
INSERT INTO discount VALUES (565656, .05);

-- index for #6--
CREATE INDEX last_name on customer(lname);

-- select statement for #7--
SELECT * FROM bill WHERE customerId = '00001' ;
SELECT * FROM bill WHERE customerId = (SELECT customerId FROM customer c WHERE lname = 'Lloyd');

-- select functions for #8--
create view avgPurchases as select zipcode, sum(total)/count(total) as average from bill group by zipcode order by zipcode asc;
select * from avgPurchases;