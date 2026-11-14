CREATE DATABASE Retail_Sales;
USE Retail_Sales;
CREATE TABLE Sales (
    Order_ID INT PRIMARY KEY,
    Order_Date DATE,
    Customer_Name VARCHAR(50),
    Product_Name VARCHAR(50),
    Category VARCHAR(30),
    Quantity INT,
    Unit_Price DECIMAL(10,2),
    Region VARCHAR(30)
);
INSERT INTO Sales VALUES
(1,'2025-01-05','Aman','Laptop','Electronics',2,45000,'North'),
(2,'2025-01-10','Riya','Mobile','Electronics',3,15000,'South'),
(3,'2025-02-02','Aman','Chair','Furniture',4,2500,'North'),
(4,'2025-02-15','Neha','Table','Furniture',2,5000,'East'),
(5,'2025-03-05','Riya','Laptop','Electronics',1,45000,'South'),
(6,'2025-03-12','Rahul','Mobile','Electronics',2,15000,'West'),
(7,'2025-04-01','Neha','Chair','Furniture',5,2500,'East'),
(8,'2025-04-10','Aman','Mobile','Electronics',1,15000,'North'),
(9,'2025-05-05','Rahul','Table','Furniture',3,5000,'West'),
(10,'2025-05-15','Riya','Chair','Furniture',2,2500,'South');
SELECT *FROM SALES;

SELECT SUM(Quantity * Unit_Price) AS Total_Revenue
FROM Sales;

-- Category-wise Total Revenue
SELECT 
    Category,
    SUM(Quantity * Unit_Price) AS Total_Revenue
FROM Sales
GROUP BY Category;

-- Region-wise Sales
SELECT Region,
       SUM(Quantity * Unit_Price) AS Total_Sales
FROM Sales
GROUP BY Region;

-- Top Selling Products
SELECT Product_Name,
       SUM(Quantity) AS Total_Quantity
FROM Sales
GROUP BY Product_Name
ORDER BY Total_Quantity DESC;

-- Customer-wise Total Spending
SELECT Customer_Name,
       SUM(Quantity * Unit_Price) AS Total_Spending
FROM Sales
GROUP BY Customer_Name
ORDER BY Total_Spending DESC;

-- Highest Revenue Product
SELECT Product_Name,
       SUM(Quantity * Unit_Price) AS Revenue
FROM Sales
GROUP BY Product_Name
ORDER BY Revenue DESC
LIMIT 1;

-- Monthly Sales Analysis
SELECT MONTH(Order_Date) AS Sales_Month,
       SUM(Quantity * Unit_Price) AS Monthly_Revenue
FROM Sales
GROUP BY MONTH(Order_Date)
ORDER BY Sales_Month;

-- Complete Sales Report
SELECT
    COUNT(Order_ID) AS Total_Orders,
    SUM(Quantity) AS Total_Quantity,
    SUM(Quantity * Unit_Price) AS Total_Revenue,
    AVG(Unit_Price) AS Average_Price
FROM Sales;