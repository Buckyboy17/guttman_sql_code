DROP TABLE IF EXISTS
  `products`;
DROP TABLE IF EXISTS
  `categories`;
DROP TABLE IF EXISTS
  `vendors`;

CREATE TABLE categories(
  `categoryId` INT AUTO_INCREMENT PRIMARY KEY,
  `categoryName` VARCHAR(100) UNIQUE NOT NULL
);

SHOW CREATE TABLE categories \G

CREATE TABLE vendors(
  `vendorId` INT AUTO_INCREMENT PRIMARY KEY,
  `vendorname` VARCHAR(25) UNIQUE NOT NULL
);
SHOW CREATE TABLE vendors \G

CREATE TABLE products(
  `productId` INT AUTO_INCREMENT PRIMARY KEY,
  `prodctName` VARCHAR(100) UNIQUE NOT NULL,
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

DROP TABLE IF EXISTS departments;
CREATE TABLE departments (
  `deptId` INT AUTO_INCREMENT PRIMARY KEY,
  `deptname` VARCHAR(50) UNIQUE
);
SHOW CREATE TABLE departments \G
