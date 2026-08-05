🛍️ Retail Sales Analytics using SQL
📌 Project Overview

This project demonstrates end-to-end retail sales analysis using MySQL to extract actionable business insights from transactional data. The analysis focuses on customer behavior, sales performance, product performance, revenue trends, and customer segmentation through advanced SQL techniques.

The objective is to showcase how SQL can support business decision-making by transforming raw retail data into meaningful insights that help improve customer retention, inventory planning, and sales strategy.

🎯 Business Objectives
Analyze overall sales performance.
Identify high-value customers using Customer Lifetime Value (CLV).
Evaluate product and category performance.
Understand customer purchasing behavior.
Segment customers based on purchasing value.
Generate insights to support data-driven business decisions.
🗂️ Database Schema

The project consists of four relational tables:

Table	Description
Customers	Customer demographic information
Products	Product details and categories
Orders	Order transactions and sales information
Payments	Payment method and transaction details

The database is designed using primary and foreign key relationships to maintain referential integrity.

🛠️ SQL Concepts Used
Joins (INNER JOIN)
Common Table Expressions (CTEs)
Window Functions
Aggregate Functions
CASE Statements
Views
GROUP BY & HAVING
ORDER BY
Date Functions
Subqueries
📊 Business Analysis Performed
📈 Sales Performance Analysis
Evaluated overall sales performance across products and categories.
Calculated revenue generated from customer purchases.
Identified top-performing and underperforming product categories.
👥 Customer Lifetime Value (CLV)
Calculated Customer Lifetime Value to identify high-value customers.
Ranked customers based on total revenue contribution.
Supported customer retention and loyalty analysis.
🏆 Product Performance Analysis
Ranked products using sales and revenue metrics.
Identified best-selling products.
Compared category-wise performance for inventory optimization.
🛒 Customer Purchase Behavior
Analyzed repeat purchase patterns.
Calculated time gaps between customer orders using window functions.
Tracked previous purchase amounts to understand buying behavior.
🎯 Customer Segmentation

Customers were classified into:

High Value
Medium Value
Low Value

using purchase history and revenue contribution to support targeted marketing strategies.

💳 Payment Analysis
Evaluated preferred customer payment methods.
Compared revenue generated through different payment channels.
🔍 Key Insights
Identified high-value customers contributing significantly to overall revenue.
Determined the best-performing product categories based on sales and revenue.
Analyzed customer purchasing frequency to understand repeat buying behavior.
Segmented customers into value-based groups for personalized marketing.
Evaluated payment trends to understand customer payment preferences.
Generated insights that can support sales optimization, customer retention, and inventory planning.
💼 Business Value

The analysis provides actionable insights that can help organizations:

Improve customer retention strategies.
Identify profitable customers for targeted campaigns.
Optimize product assortment and inventory planning.
Monitor sales performance across categories.
Support management with data-driven decision-making.
⚙️ Technologies Used
MySQL
SQL
MySQL Workbench
📁 Project Structure
Retail-Sales-Analytics-SQL/
│
├── Dataset/
│   ├── customers.csv
│   ├── products.csv
│   ├── orders.csv
│   └── payments.csv
│
├── SQL Scripts/
│   ├── Database_Schema.sql
│   ├── Data_Insertion.sql
│   ├── Business_Queries.sql
│   └── Views.sql
│
├── ER_Diagram/
│   └── Retail_ERD.png
│
└── README.md

👤 Author

Saee Kadam

B.Sc. Information Technology | Aspiring Data Analyst | SQL • Power BI • Python • Excel