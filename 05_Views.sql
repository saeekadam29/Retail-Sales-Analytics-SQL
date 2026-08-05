CREATE VIEW vw_sales_summary AS
SELECT
    p.Category,
    COUNT(*) AS Total_Orders,
    SUM(o.`Purchase Amount (USD)`) AS Revenue,
    ROUND(AVG(o.`Purchase Amount (USD)`),2) AS Avg_Order_Value
FROM orders o
JOIN products p
ON o.Product_ID = p.Product_ID
GROUP BY p.Category;
SELECT * FROM vw_sales_summary;
CREATE VIEW vw_customer_summary AS
SELECT
    c.`Customer ID`,
    c.Gender,
    c.Location,
    COUNT(o.Order_ID) AS Total_Orders,
    SUM(o.`Purchase Amount (USD)`) AS Total_Spent,
    ROUND(AVG(o.`Purchase Amount (USD)`),2) AS Avg_Order_Value
FROM customers c
JOIN orders o
ON c.`Customer ID` = o.`Customer ID`
GROUP BY
    c.`Customer ID`,
    c.Gender,
    c.Location;
SELECT *
FROM vw_customer_summary
LIMIT 20;
CREATE VIEW vw_product_performance AS
SELECT
    p.Product_ID,
    p.`Item Purchased`,
    p.Category,
    COUNT(o.Order_ID) AS Total_Sales,
    SUM(o.`Purchase Amount (USD)`) AS Revenue,
    ROUND(AVG(o.`Review Rating`),2) AS Avg_Rating
FROM products p
JOIN orders o
ON p.Product_ID=o.Product_ID
GROUP BY
    p.Product_ID,
    p.`Item Purchased`,
    p.Category;
SELECT *
FROM vw_product_performance
LIMIT 20;
SHOW FULL TABLES
WHERE Table_type='VIEW';
DELIMITER //