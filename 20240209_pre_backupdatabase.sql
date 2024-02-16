DROP DATABASE IF EXISTS
	`guttman_202dbassign_7`;
CREATE DATABASE IF NOT EXISTS
 	`guttman_202dbassign_7` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `guttman_202dbassign_7`;

DROP TABLE IF EXISTS
	`categories`;
CREATE TABLE categories(
	`categoryId` INT AUTO_INCREMENT PRIMARY KEY,
    	`categoryName` VARCHAR(100) UNIQUE NOT NULL
);
SHOW CREATE TABLE categories \G
INSERT INTO categories(categoryName)
VALUES
	('Deli'),
	('Produce'),
	('Bakery'),
	('General Merchandise'),
	('Technology');
DROP TABLE IF EXISTS
	`vendors`;
CREATE TABLE vendors(
	`vendorId`	INT	AUTO_INCREMENT	PRIMARY KEY,
	`vendorname`	varchar(25)	UNIQUE NOT NULL
);
SHOW CREATE TABLE vendors \G
INSERT INTO vendors(vendorname)
VALUES
	('Sam''s Bakery'),
	('Farmer in the Deli'),
	('99cents Discount Store');


DROP TABLE IF EXISTS
	`products`;


CREATE TABLE `products`(
	`productId` INT	AUTO_INCREMENT PRIMARY KEY,
	`productName` VARCHAR(100) UNIQUE NOT NULL,
	`categoryId` INT,
	`vendorId` INT,

	CONSTRAINT `fk_category`
		FOREIGN KEY(categoryId)
		REFERENCES categories(categoryId),
	CONSTRAINT `fk_vendors`
		FOREIGN KEY(vendorId)
		REFERENCES vendors(vendorId)
);

SHOW CREATE TABLE products \G

INSERT INTO products(productName, categoryId, vendorId)
VALUES
    	('Pear', (select categoryId from categories where categoryName = 'Produce'),(select vendorId from vendors where vendorname = 'Farmer in the Deli')),
    	('Banana',(select categoryId from categories where categoryName = 'Produce'),(select vendorId from vendors where vendorname = 'Farmer in the Deli')),
    	('Apple',(select categoryId from categories where categoryName = 'Produce'),(select vendorId from vendors where vendorname = 'Farmer in the Deli')),
    	('Bread',(select categoryId from categories where categoryName = 'Bakery'),(select vendorId from vendors where vendorname = 'Sam''s Bakery')),
	('Sliced Ham',(select categoryId from categories where categoryName = 'Deli'),(select vendorId from vendors where vendorname = 'Farmer in the Deli')),
	('Kleenex',(select categoryId from categories where categoryName = ''),(select vendorId from vendors where vendorname = '99cents Discount Store'));

DROP TABLE IF EXISTS `departments`;
CREATE TABLE departments (
	`deptId`	INT	AUTO_INCREMENT PRIMARY KEY,
	`deptname`	VARCHAR(50) UNIQUE
);

SHOW CREATE TABLE categories \G
INSERT INTO departments(deptname)
VALUES
	('Accounting'),
	('Sales');

DROP TABLE IF EXISTS `employees`;
CREATE TABLE `employees` (
	`employeenumber`	INT 	AUTO_INCREMENT PRIMARY KEY,
	`last_name`		VARCHAR(50)	NOT NULL,
	`first_name`		VARCHAR(50)	NOT NULL,
	`salary`		INT		NOT NULL,
	`deptId`		INT		NOT NULL,

	CONSTRAINT `fk_departments`
		FOREIGN KEY(deptId)
		REFERENCES departments(deptId)
);
SHOW CREATE TABLE categories \G
INSERT INTO employees(last_name, first_name, salary, deptId)
VALUES
	('Smith', 'John', 62000, (select deptId from departments where deptname = 'Accounting')),
	('Anderson', 'Jane', 57500, (select deptId from departments where deptname = 'Accounting')),
	('Everest', 'Brad',  71000, (select deptId from departments where deptname = 'Sales') ),
	('Horvath', 'Jack', 42000, (select deptId from departments where deptname = 'Sales'));

DROP TABLE IF EXISTS `customers`;
CREATE TABLE `customers` (
	`customerId` 	INT	AUTO_INCREMENT	PRIMARY KEY,
  	`contactLastName` VARCHAR(50) NOT NULL,
  	`contactFirstName` VARCHAR(50) NOT NULL,
  	`favoriteWebsite` VARCHAR(50) NULL


);

INSERT INTO customers(contactLastName, contactFirstName, favoriteWebsite)
VALUES
	('Jackson', 'Joe', 'techonthenet.com'),
	('Smith', 'Jane', 'digminecraft.com'),
	('Ferguson', 'Samantha', 'bigactivities.com'),
	('Reynolds', 'Allen', 'checkyourmath.com'),
	('Anderson', 'Paige', ''),
	('Johnson', 'Derek', 'techonthenet.com');
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders` (
	`order_id`	INT	AUTO_INCREMENT	PRIMARY KEY,
	`customer_id`	INT	NULL,
	`order_date`	datetime,

	CONSTRAINT `fk_customers`
		FOREIGN KEY (customer_id)
		REFERENCES customers(customerId)
);

INSERT INTO orders(customer_id, order_date)
VALUES
	((select customerId from customers where contactLastName = 'Reynolds' and contactFirstName = 'Allen'), '2016/04/18'),
	((select customerId from customers where contactLastName = 'Smith' and contactFirstName = 'Jane'), '2016/04/18'),
	((select customerId from customers where contactLastName = 'Anderson' and contactFirstName = 'Page'), '2016/04/19'),
	((select customerId from customers where contactLastName = 'Johnson' and contactFirstName = 'Derek'), '2016/04/20'),
	((select customerId from customers where contactLastName = '' and contactFirstName = ''), '2016/05/01');
