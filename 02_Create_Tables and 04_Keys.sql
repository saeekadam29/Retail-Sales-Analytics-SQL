SELECT *
FROM customers_raw
LIMIT 5;
CREATE TABLE customers AS
SELECT DISTINCT
    `Customer ID`,
    Age,
    Gender,
    Location,
    `Subscription Status`,
    `Previous Purchases`
FROM customers_raw;
CREATE TABLE products AS
SELECT DISTINCT
    `Item Purchased`,
    Category,
    Size,
    Color
FROM customers_raw;
SHOW TABLES;
CREATE TABLE products AS
SELECT DISTINCT
    `Item Purchased`,
    Category,
    Size,
    Color
FROM customers_raw;
SELECT * FROM products LIMIT 5;
SELECT DATABASE();
SHOW TABLES;
CREATE TABLE products AS
SELECT DISTINCT
    `Item Purchased`,
    Category,
    Size,
    Color
FROM customers_raw;
SHOW TABLES;
ALTER TABLE products
ADD COLUMN Product_ID INT AUTO_INCREMENT PRIMARY KEY;
CREATE TABLE orders AS
SELECT
    `Customer ID`,
    `Item Purchased`,
    `Purchase Amount (USD)`,
    Season,
    `Review Rating`,
    `Previous Purchases`
FROM customers_raw;
ALTER TABLE orders
ADD COLUMN Order_ID INT AUTO_INCREMENT PRIMARY KEY;
SELECT * FROM orders LIMIT 5;
CREATE TABLE payments AS
SELECT
    `Customer ID`,
    `Payment Method`,
    `Promo Code Used`,
    `Discount Applied`
FROM customers_raw;
ALTER TABLE payments
ADD COLUMN Payment_ID INT AUTO_INCREMENT PRIMARY KEY;
SELECT * FROM payments LIMIT 5;
CREATE TABLE shipping AS
SELECT
    `Customer ID`,
    `Shipping Type`,
    `Frequency of Purchases`
FROM customers_raw;
ALTER TABLE shipping
ADD COLUMN Shipping_ID INT AUTO_INCREMENT PRIMARY KEY;
SELECT * FROM shipping LIMIT 5;
SHOW TABLES;
DESCRIBE customers;
DESCRIBE products;
DESCRIBE orders;
DESCRIBE payments;
DESCRIBE shipping;
SELECT `Customer ID`, COUNT(*) AS cnt
FROM customers
GROUP BY `Customer ID`
HAVING COUNT(*) > 1;
SELECT COUNT(*) AS null_ids
FROM customers
WHERE `Customer ID` IS NULL;
ALTER TABLE customers
ADD PRIMARY KEY (`Customer ID`);
DESCRIBE customers;
DESCRIBE products;
DESCRIBE orders;
DROP TABLE orders;
CREATE TABLE orders AS
SELECT
    `Customer ID`,
    `Item Purchased`,
    Category,
    Size,
    Color,
    `Purchase Amount (USD)`,
    Season,
    `Review Rating`,
    `Previous Purchases`
FROM customers_raw;
ALTER TABLE orders
ADD COLUMN Order_ID INT AUTO_INCREMENT PRIMARY KEY;
DESCRIBE orders;
DESCRIBE products;
ALTER TABLE orders
ADD COLUMN Product_ID INT;
SET SQL_SAFE_UPDATES = 0;
UPDATE orders o
JOIN products p
ON o.`Item Purchased` = p.`Item Purchased`
AND o.Category = p.Category
AND o.Size = p.Size
AND o.Color = p.Color
SET o.Product_ID = p.Product_ID;
SET SQL_SAFE_UPDATES = 1;
SELECT COUNT(*) FROM products;
SELECT COUNT(*) FROM orders;
SELECT COUNT(DISTINCT `Item Purchased`)
FROM customers_raw;
DROP TABLE products;
CREATE TABLE products AS
SELECT DISTINCT
    `Item Purchased`,
    Category
FROM customers_raw;
ALTER TABLE products
ADD COLUMN Product_ID INT AUTO_INCREMENT PRIMARY KEY;
SELECT * FROM products;
DROP TABLE orders;
CREATE TABLE orders AS
SELECT
    `Customer ID`,
    `Item Purchased`,
    `Purchase Amount (USD)`,
    Season,
    `Review Rating`,
    `Previous Purchases`
FROM customers_raw;
ALTER TABLE orders
ADD COLUMN Order_ID INT AUTO_INCREMENT PRIMARY KEY;
ALTER TABLE orders
ADD COLUMN Product_ID INT;
SET SQL_SAFE_UPDATES = 0;
UPDATE orders o
JOIN products p
ON o.`Item Purchased` = p.`Item Purchased`
SET o.Product_ID = p.Product_ID;
SET SQL_SAFE_UPDATES = 1;
SELECT
    Order_ID,
    `Item Purchased`,
    Product_ID
FROM orders
LIMIT 10;
ALTER TABLE orders
ADD CONSTRAINT fk_customer
FOREIGN KEY (`Customer ID`)
REFERENCES customers(`Customer ID`);
ALTER TABLE orders
ADD CONSTRAINT fk_product
FOREIGN KEY (Product_ID)
REFERENCES products(Product_ID);
ALTER TABLE orders
ADD CONSTRAINT fk_customer
FOREIGN KEY (`Customer ID`)
REFERENCES customers(`Customer ID`);
SHOW CREATE TABLE orders;
SELECT
    o.Order_ID,
    c.Location,
    p.`Item Purchased`,
    p.Category,
    o.`Purchase Amount (USD)`
FROM orders o
JOIN customers c
ON o.`Customer ID` = c.`Customer ID`
JOIN products p
ON o.Product_ID = p.Product_ID
LIMIT 10;
SHOW CREATE TABLE orders;
SELECT
    COUNT(*) AS missing_products
FROM orders
WHERE Product_ID IS NULL;
USE shopping_analysis_pro;
DESCRIBE payments;
ALTER TABLE payments
ADD COLUMN Order_ID INT;
UPDATE payments p
JOIN orders o
ON p.Payment_ID = o.Order_ID
SET p.Order_ID = o.Order_ID;
SELECT *
FROM payments
LIMIT 10;
ALTER TABLE payments
ADD CONSTRAINT fk_order_payment
FOREIGN KEY (Order_ID)
REFERENCES orders(Order_ID);
SHOW CREATE TABLE payments;
ALTER TABLE payments
ADD COLUMN Order_ID INT;
SET SQL_SAFE_UPDATES = 0;
UPDATE payments p
JOIN orders o
ON p.Payment_ID = o.Order_ID
SET p.Order_ID = o.Order_ID;
SET SQL_SAFE_UPDATES = 1;
SHOW CREATE TABLE payments;
ALTER TABLE shipping
ADD COLUMN Order_ID INT;
SET SQL_SAFE_UPDATES = 0;
UPDATE shipping s
JOIN orders o
ON s.Shipping_ID = o.Order_ID
SET s.Order_ID = o.Order_ID;
SET SQL_SAFE_UPDATES = 1;
ALTER TABLE shipping
ADD CONSTRAINT fk_shipping_order
FOREIGN KEY (Order_ID)
REFERENCES orders(Order_ID);
SHOW CREATE TABLE shipping;