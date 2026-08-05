CREATE PROCEDURE GetRevenueBySeason()
BEGIN
    SELECT
        Season,
        COUNT(*) AS Total_Orders,
        SUM(`Purchase Amount (USD)`) AS Revenue,
        ROUND(AVG(`Purchase Amount (USD)`),2) AS Avg_Order_Value
    FROM orders
    GROUP BY Season
    ORDER BY Revenue DESC;
END //
DELIMITER ;
CALL GetRevenueBySeason();
DELIMITER //

CREATE PROCEDURE GetCustomerOrders(IN customer INT)
BEGIN
    SELECT
        o.Order_ID,
        p.`Item Purchased`,
        o.`Purchase Amount (USD)`,
        o.Season,
        pay.`Payment Method`
    FROM orders o
    JOIN products p
        ON o.Product_ID = p.Product_ID
    JOIN payments pay
        ON o.Order_ID = pay.Order_ID
    WHERE o.`Customer ID` = customer;
END //

DELIMITER ;
CALL GetCustomerOrders(10);
DELIMITER //

CREATE PROCEDURE GetCategoryRevenue()
BEGIN
    SELECT
        p.Category,
        SUM(o.`Purchase Amount (USD)`) AS Revenue,
        COUNT(*) AS Orders
    FROM orders o
    JOIN products p
        ON o.Product_ID = p.Product_ID
    GROUP BY p.Category
    ORDER BY Revenue DESC;
END //

DELIMITER ;
CALL GetCategoryRevenue();
SELECT
    p.Category,
    SUM(o.`Purchase Amount (USD)`) AS Total_Revenue
FROM orders o
JOIN products p
ON o.Product_ID = p.Product_ID
GROUP BY p.Category
ORDER BY Total_Revenue DESC;
SELECT
    p.`Item Purchased`,
    COUNT(*) AS Total_Orders
FROM orders o
JOIN products p
ON o.Product_ID = p.Product_ID
GROUP BY p.`Item Purchased`
ORDER BY Total_Orders DESC
LIMIT 10;
SELECT
    c.Location,
    SUM(o.`Purchase Amount (USD)`) AS Revenue
FROM customers c
JOIN orders o
ON c.`Customer ID` = o.`Customer ID`
GROUP BY c.Location
ORDER BY Revenue DESC;
SELECT
    Season,
    COUNT(*) AS Orders,
    SUM(`Purchase Amount (USD)`) AS Revenue
FROM orders
GROUP BY Season
ORDER BY Revenue DESC;
SELECT
    p.Category,
    ROUND(AVG(o.`Purchase Amount (USD)`),2) AS Avg_Order_Value
FROM orders o
JOIN products p
ON o.Product_ID=p.Product_ID
GROUP BY p.Category
ORDER BY Avg_Order_Value DESC;
SELECT
    c.`Customer ID`,
    c.Location,
    SUM(o.`Purchase Amount (USD)`) AS Total_Spent
FROM customers c
JOIN orders o
ON c.`Customer ID`=o.`Customer ID`
GROUP BY c.`Customer ID`,c.Location
ORDER BY Total_Spent DESC
LIMIT 10;
SELECT
    `Payment Method`,
    COUNT(*) AS Usage_Count
FROM payments
GROUP BY `Payment Method`
ORDER BY Usage_Count DESC;
SELECT
    o.Order_ID,
    c.Location,
    p.`Item Purchased`,
    p.Category,
    o.`Purchase Amount (USD)`
FROM orders o
JOIN customers c
ON o.`Customer ID`=c.`Customer ID`
JOIN products p
ON o.Product_ID=p.Product_ID
LIMIT 20;
SELECT
    p.Category,
    SUM(o.`Purchase Amount (USD)`) AS Revenue
FROM products p
JOIN orders o
ON p.Product_ID=o.Product_ID
GROUP BY p.Category;
SELECT
    c.Gender,
    SUM(o.`Purchase Amount (USD)`) AS Revenue
FROM customers c
JOIN orders o
ON c.`Customer ID`=o.`Customer ID`
GROUP BY c.Gender;
SELECT
    p.Category,
    pay.`Payment Method`,
    COUNT(*) AS Orders
FROM orders o
JOIN products p
ON o.Product_ID=p.Product_ID
JOIN payments pay
ON o.Order_ID=pay.Order_ID
GROUP BY p.Category,pay.`Payment Method`;
SELECT
    s.`Shipping Type`,
    COUNT(*) AS Total_Orders
FROM shipping s
GROUP BY s.`Shipping Type`
ORDER BY Total_Orders DESC;
SELECT
    `Customer ID`,
    SUM(`Purchase Amount (USD)`) AS Total_Spent
FROM orders
GROUP BY `Customer ID`
HAVING Total_Spent >
(
SELECT AVG(`Purchase Amount (USD)`)
FROM orders
);
SELECT
    p.`Item Purchased`,
    SUM(o.`Purchase Amount (USD)`) Revenue
FROM products p
JOIN orders o
ON p.Product_ID=o.Product_ID
GROUP BY p.`Item Purchased`
HAVING Revenue >
(
SELECT AVG(`Purchase Amount (USD)`)
FROM orders
);
SELECT
    p.Category,
    ROUND(AVG(o.`Review Rating`),2) Rating
FROM orders o
JOIN products p
ON o.Product_ID=p.Product_ID
GROUP BY p.Category
ORDER BY Rating DESC;
WITH CustomerRevenue AS
(
SELECT
`Customer ID`,
SUM(`Purchase Amount (USD)`) Revenue
FROM orders
GROUP BY `Customer ID`
)
SELECT *
FROM CustomerRevenue
ORDER BY Revenue DESC
LIMIT 10;
WITH CategoryRevenue AS
(
SELECT
p.Category,
SUM(o.`Purchase Amount (USD)`) Revenue
FROM orders o
JOIN products p
ON o.Product_ID=p.Product_ID
GROUP BY p.Category
)
SELECT
Category,
Revenue
FROM CategoryRevenue;
WITH CLV AS
(
SELECT
`Customer ID`,
SUM(`Purchase Amount (USD)`) Lifetime_Value
FROM orders
GROUP BY `Customer ID`
)
SELECT *
FROM CLV
ORDER BY Lifetime_Value DESC;
SELECT
Order_ID,
`Customer ID`,
`Purchase Amount (USD)`,
ROW_NUMBER() OVER
(
ORDER BY `Purchase Amount (USD)` DESC
) Row_Num
FROM orders;
SELECT
p.Category,
SUM(o.`Purchase Amount (USD)`) Revenue,
RANK() OVER
(
ORDER BY SUM(o.`Purchase Amount (USD)`) DESC
) Revenue_Rank
FROM orders o
JOIN products p
ON o.Product_ID=p.Product_ID
GROUP BY p.Category;
SELECT
c.Location,
SUM(o.`Purchase Amount (USD)`) Revenue,
DENSE_RANK() OVER
(
ORDER BY SUM(o.`Purchase Amount (USD)`) DESC
) Location_Rank
FROM customers c
JOIN orders o
ON c.`Customer ID`=o.`Customer ID`
GROUP BY c.Location;
SELECT
Order_ID,
`Customer ID`,
`Purchase Amount (USD)`,
LAG(`Purchase Amount (USD)`)
OVER(
PARTITION BY `Customer ID`
ORDER BY Order_ID
) Previous_Order
FROM orders;
SELECT
`Customer ID`,
SUM(`Purchase Amount (USD)`) Total_Spent,
CASE
WHEN SUM(`Purchase Amount (USD)`)>=500 THEN 'High Value'
WHEN SUM(`Purchase Amount (USD)`)>=250 THEN 'Medium Value'
ELSE 'Low Value'
END Customer_Type
FROM orders
GROUP BY `Customer ID`;
SELECT
o.Season,
p.Category,
SUM(o.`Purchase Amount (USD)`) Revenue
FROM orders o
JOIN products p
ON o.Product_ID=p.Product_ID
GROUP BY
o.Season,
p.Category
ORDER BY Revenue DESC;
SHOW DATABASES;
SELECT VERSION();
