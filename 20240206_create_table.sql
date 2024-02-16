-- DROP DATABASE

SELECT '' AS 'INSTALLATION STARTING'\G

DROP DATABASE IF EXISTS guttman_202db_assign5;
-- CREATE DATABASE
CREATE DATABASE IF NOT EXISTS guttman_202db_assign5
CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;

SHOW DATABASES \G

-- USE DATABASE
USE guttman_202db_assign5;

-- CREATE TABLES
DROP TABLE
IF EXISTS
`vendor`;

CREATE TABLE
IF NOT EXISTS vendor ( vendorId     CHAR(2) NOT NULL,
                      vendorname    VARCHAR(25) NOT NULL,
                                    PRIMARY KEY (vendorId)
);
SHOW CREATE TABLE vendor \G

DROP TABLE
IF EXISTS
`category`;

CREATE TABLE
IF NOT EXISTS category (    categoryId      CHAR (2) NOT NULL,
                            categoryName  VARCHAR (25) NOT NULL,
                                          PRIMARY KEY (categoryId)
);
SHOW CREATE TABLE category \G

DROP TABLE
IF EXISTS
`product`;

CREATE TABLE
IF NOT EXISTS product (     productId    CHAR (3) NOT NULL,
                            productName    VARCHAR (25) NOT NULL,
                            productprice  NUMERIC (7,2) NOT NULL,
                            vendorId      CHAR (2) NOT NULL,
                            categoryId    CHAR (2) NOT NULL,
                                          PRIMARY KEY   (productId),
                                          FOREIGN KEY   (vendorId)
                                          REFERENCES vendor(vendorId),
                                          FOREIGN KEY (categoryId)
                                          REFERENCES category(categoryId)
);
SHOW CREATE TABLE product \G

DROP TABLE
IF EXISTS
`region`;

CREATE TABLE
IF NOT EXISTS region (    regionId    CHAR NOT NULL,
                          regionname  VARCHAR(25) NOT NULL,
                                      PRIMARY KEY (regionId)
);

SHOW CREATE TABLE region \G

DROP TABLE
IF EXISTS
`store`;

CREATE TABLE
IF NOT EXISTS store (     storeId     VARCHAR(3) NOT NULL,
                        storezip    CHAR(5) NOT NULL,
                        regionId    CHAR NOT NULL,
                                    PRIMARY KEY (storeId),
                                    FOREIGN KEY (regionId)
                                    REFERENCES region(regionId)
);
SHOW CREATE TABLE store \G

DROP TABLE
IF EXISTS
`customers`;


CREATE TABLE
IF NOT EXISTS customers (   customerId    CHAR(7) NOT NULL,
                            customerName  VARCHAR(15) NOT NULL,
                            customerZip   CHAR(5) NOT NULL,
                                          PRIMARY KEY (customerId)
);
SHOW CREATE TABLE customers \G

DROP TABLE
IF EXISTS
`salestransaction`;
CREATE TABLE
IF NOT EXISTS salestransaction (    tid         VARCHAR(8) NOT NULL,
                                  customerId  CHAR(7) NOT NULL,
                                  storeId     VARCHAR(3) NOT NULL,
                                  tdate       DATE NOT NULL,
                                              PRIMARY KEY (tid),
                                              FOREIGN KEY (customerId)
                                              REFERENCES  customers(customerId),
                                              FOREIGN KEY (storeId)
                                              REFERENCES  store(storeId)
);
SHOW CREATE TABLE salestransaction \G

DROP TABLE
IF EXISTS
`soldvia`;

CREATE TABLE
IF NOT EXISTS soldvia  (              productId   CHAR(3) NOT NULL,
                                    tid         VARCHAR(8) NOT NULL,
                                    noofitmes   INT NOT NULL,
                                                PRIMARY KEY (productId, tid),
                                                FOREIGN KEY (productId)
                                                REFERENCES product(productId),
                                                FOREIGN KEY (tid)
                                                REFERENCES salestransaction(tid)
);
SHOW CREATE TABLE soldvia \G

SELECT '' AS 'INSERTING VALUES INTO TABLE' \G

INSERT INTO vendor VALUES ('PG','Pacific Gear');
INSERT INTO vendor VALUES ('MK','Mountain King');

INSERT INTO category VALUES ('CP','Camping');
INSERT INTO category VALUES ('FW','Footwear');

INSERT INTO product VALUES ('1X1','Zzz Bag',100,'pg','cp');
INSERT INTO product VALUES ('2X2','Easy Boot',70,'MK','FW');
INSERT INTO product VALUES ('3x3','Cosy Sock',15,'MK','FW');
INSERT INTO product VALUES ('4x4','Dura Boot',90,'PG','FW');
INSERT INTO product VALUES ('5x5','Tiny Tent',150,'MK','CP');
INSERT INTO product VALUES ('6x6','Biggy Tent',250,'MK','CP');

INSERT INTO region VALUES ('C','Chicagoland');
INSERT INTO region VALUES ('T','Tristate');

INSERT INTO store VALUES ('S1','60600','C');
INSERT INTO store VALUES ('S2','60605','C');
INSERT INTO store VALUES ('S3','35400','T');

INSERT INTO customers VALUES ('1-2-333','Tina','60137');
INSERT INTO customers VALUES ('2-3-444','Tony','60611');
INSERT INTO customers VALUES ('3-4-555','Pam','35401');

INSERT INTO salestransaction VALUES ('T111','1-2-333','S1','2013-01-01');
INSERT INTO salestransaction VALUES ('T222','2-3-444','S2','2013-01-01');
INSERT INTO salestransaction VALUES ('T333','1-2-333','S3','2013-01-02');
INSERT INTO salestransaction VALUES ('T444','3-4-555','S3','2013-01-02');
INSERT INTO salestransaction VALUES ('T555','2-3-444','S3','2013-01-02');

INSERT INTO soldvia VALUES  ('1X1','T111',1);
INSERT INTO soldvia VALUES  ('2X2','T222',1);
INSERT INTO soldvia VALUES  ('3X3','T333',5);
INSERT INTO soldvia VALUES  ('1X1','T333',1);
INSERT INTO soldvia VALUES  ('4X4','T444',1);
INSERT INTO soldvia VALUES  ('2X2','T444',2);
INSERT INTO soldvia VALUES  ('4X4','T555',2);
INSERT INTO soldvia VALUES  ('5X5','T555',2);
INSERT INTO soldvia VALUES  ('6X6','T555',1);

SELECT '' AS 'INSTALLATION COMPLETED' \G
