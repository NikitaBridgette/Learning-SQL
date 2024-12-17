--DDL-> Data Definition Language --
-- Creating a Table--
CREATE TABLE Amazon_orders
(
order_id integer,
order_date date,
product_name varchar(100),
total_price decimal(5,2),
payment_method varchar(20)
);

--Delete a table--
--DROP TABLE Amazon_orders;--

-- Inserting Data-- -- DML -> Data Manipulation Language
INSERT into Amazon_orders
    VALUES(1,'2022-01-01','Baby Milk',30.5,'UPI')
INSERT into Amazon_orders
    VALUES(2,'2022-01-02','Baby Powder',130,'Credit Card')
insert into Amazon_orders
    Values(3,'2024-10-23','Mars Lip Gloss',299,'Google Pay')
INSERT into Amazon_orders
    VALUES(1,'2022-01-01','Baby Soap',50.00,'UPI')
    --delete data--
    DELETE from amazon_orders;

UPDATE Amazon_orders
SET order_id = 4
WHERE product_name = 'Baby Soap';

-- View the table/data --
-- DQL -> Data Querying Language
SELECT * FROM Amazon_orders; 
--limiting columns or selecting specific columns-- 
SELECT order_date FROM Amazon_orders;
SELECT product_name,order_date,total_price from Amazon_orders;
SELECT top 2 * from Amazon_orders;
-- data sorting-- -- by default always sorted in ascending order--
SELECT * FROM Amazon_orders
ORDER by order_date DESC

SELECT * FROM Amazon_orders
ORDER by order_id DESC

SELECT * FROM Amazon_orders
ORDER by product_name ASC

SELECT order_id,product_name from Amazon_orders
ORDER by order_id desc

SELECT product_name from Amazon_orders
ORDER by order_id desc

SELECT * from Amazon_orders
order by order_date DESC,total_price DESC

SELECT * from Amazon_orders
order by order_date DESC,product_name desc, payment_method

-- Creating a new schema--
CREATE TABLE hr.test 
(
    id INTEGER,
    NAME VARCHAR(10)

)

CREATE SCHEMA hr
AUTHORIZATION dbo;

INSERT into hr.test
VALUES(1,'Nikita');

SELECT * from hr.test;

CREATE SCHEMA sales
AUTHORIZATION dbo;

CREATE TABLE sales.test
(
    id INTEGER,
    name VARCHAR(10)
)
SELECT * from sales.test;

INSERT into sales.test
SELECT * from hr.test;

-- ALTER commands, Constraints,Delete and Update --
-- Second lecture--
select * from Amazon_orders

-- change data type of a column--
ALTER TABLE amazon_orders alter COLUMN order_date DATETIME
INSERT into Amazon_orders VALUES (5,'2022-11-23 12:05:12','Shoes',132.5,'UPI');
INSERT into Amazon_orders VALUES (6,'2022-11-23 12:05:12',NULL,132.5,'UPI','Ankit');
--Alter table is a DDL command--
-- Data type should be compatible--
--if table is empty we can change from any data type to any other data type--

--Add a column in an existing table--
alter table amazon_orders add username varchar(20);
alter table amazon_orders add category varchar(20);

--delete a column from an existing table--
ALTER TABLE amazon_orders DROP COLUMN category

--CONSTRATINTS--
CREATE TABLE A_orders
(
order_id integer NOT NULL UNIQUE, -- NOT NULL CONSTRAINT , UNIQUE CONSTRAINT
order_date date,
product_name varchar(100),
total_price decimal(5,2),
payment_method VARCHAR(20) check (payment_method IN ('UPI', 'Credit Card')), -- CHECK CONSTRAINT
DISCOUNT INTEGER CHECK (DISCOUNT<=20), --check constraint
category VARCHAR(20) DEFAULT 'Mens Wear' --default constraint
);

DROP TABLE A_orders;

INSERT INTO A_orders VALUES(null,'2022-10-01','Shoes',132.5,null); -- incorrect statement as order id cannot be null
INSERT INTO A_orders VALUES(1,'2022-10-01','Shoes',132.5,'UPI');
select * FROM A_orders

INSERT into A_orders VALUES(1,'2022-10-01','Shirts',132.5,'UPI',20,'KIDS WEAR');
INSERT into A_orders VALUES(2,'2022-10-01','Shirts',132.5,'UPI',20,'');

INSERT INTO A_orders (order_date,order_id,product_name,total_price,payment_method)
VALUES('2022-10-01',5,'Socks',132.5,'UPI');