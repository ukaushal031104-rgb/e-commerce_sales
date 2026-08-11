-- E-Commerce Sales Analysis Queries

-- ==========================================
-- 1. General Sales Insights
-- ==========================================

-- Total revenue generated over the entire period
SELECT SUM(p.Price * od.Quantity) AS TotalRevenue
FROM orders o
JOIN orderdetails od ON o.OrderId = od.OrderId
JOIN products p ON od.ProductId = p.ProductId;

-- Revenue excluding returned orders
SELECT SUM(p.Price * od.Quantity) AS NetRevenue
FROM orders o
JOIN orderdetails od ON o.OrderId = od.OrderId
JOIN products p ON od.ProductId = p.ProductId
WHERE o.IsReturned = 0;

-- Revenue by year and month
SELECT 
    YEAR(o.OrderDate) AS OrderYear, 
    MONTH(o.OrderDate) AS OrderMonth, 
    SUM(p.Price * od.Quantity) AS MonthlyRevenue
FROM orders o
JOIN orderdetails od ON o.OrderId = od.OrderId
JOIN products p ON od.ProductId = p.ProductId
WHERE o.IsReturned = 0
GROUP BY YEAR(o.OrderDate), MONTH(o.OrderDate)
ORDER BY OrderYear, OrderMonth;

-- Revenue by product and category
SELECT 
    p.Category, 
    p.ProductName, 
    SUM(p.Price * od.Quantity) AS Revenue
FROM orderdetails od
JOIN products p ON od.ProductId = p.ProductId
JOIN orders o ON od.OrderId = o.OrderId
WHERE o.IsReturned = 0
GROUP BY p.Category, p.ProductName
ORDER BY Revenue DESC;

-- Average Order Value (AOV) overall
SELECT 
    SUM(p.Price * od.Quantity) / COUNT(DISTINCT o.OrderId) AS AverageOrderValue
FROM orders o
JOIN orderdetails od ON o.OrderId = od.OrderId
JOIN products p ON od.ProductId = p.ProductId
WHERE o.IsReturned = 0;

-- Average order size by region
SELECT 
    r.RegionName, 
    AVG(od.Quantity) AS AvgOrderSize
FROM customers c
JOIN orders o ON c.CustomerId = o.CustomerId
JOIN orderdetails od ON o.OrderId = od.OrderId
JOIN region r ON c.Region = r.RegionID
GROUP BY r.RegionName
ORDER BY AvgOrderSize DESC;


-- ==========================================
-- 2. Customer Insights
-- ==========================================

-- Top 10 customers by total revenue
SELECT 
    c.CustomerId, 
    c.CustomerName, 
    SUM(p.Price * od.Quantity) AS TotalSpent
FROM customers c
JOIN orders o ON c.CustomerId = o.CustomerId
JOIN orderdetails od ON o.OrderId = od.OrderId
JOIN products p ON od.ProductId = p.ProductId
WHERE o.IsReturned = 0
GROUP BY c.CustomerId, c.CustomerName
ORDER BY TotalSpent DESC
LIMIT 10;

-- Customer segmentation based on total spend
WITH CustomerSpend AS (
    SELECT 
        c.CustomerId, 
        SUM(p.Price * od.Quantity) AS TotalSpend
    FROM customers c
    JOIN orders o ON c.CustomerId = o.CustomerId
    JOIN orderdetails od ON o.OrderId = od.OrderId
    JOIN products p ON od.ProductId = p.ProductId
    WHERE o.IsReturned = 0
    GROUP BY c.CustomerId
)
SELECT 
    CustomerId,
    TotalSpend,
    CASE 
        WHEN TotalSpend >= 1500 THEN 'Platinum'
        WHEN TotalSpend >= 1000 THEN 'Gold'
        WHEN TotalSpend >= 500 THEN 'Silver'
        ELSE 'Bronze'
    END AS CustomerSegment
FROM CustomerSpend;


-- ==========================================
-- 3. Product & Order Insights
-- ==========================================

-- Top 10 products by quantity sold
SELECT 
    p.ProductName, 
    SUM(od.Quantity) AS TotalQuantity
FROM orderdetails od
JOIN products p ON od.ProductId = p.ProductId
JOIN orders o ON od.OrderId = o.OrderId
WHERE o.IsReturned = 0
GROUP BY p.ProductName
ORDER BY TotalQuantity DESC
LIMIT 10;

-- Products with highest return rate
SELECT 
    p.ProductName, 
    COUNT(CASE WHEN o.IsReturned = 1 THEN 1 END) / COUNT(o.OrderId) AS ReturnRate
FROM orderdetails od
JOIN orders o ON od.OrderId = o.OrderId
JOIN products p ON od.ProductId = p.ProductId
GROUP BY p.ProductName
HAVING COUNT(o.OrderId) > 50 -- Filter for products with significant order volume
ORDER BY ReturnRate DESC
LIMIT 10;


-- ==========================================
-- 4. Regional Insights
-- ==========================================

-- Revenue comparison across regions
SELECT 
    r.RegionName, 
    SUM(p.Price * od.Quantity) AS RegionalRevenue
FROM customers c
JOIN region r ON c.Region = r.RegionID
JOIN orders o ON c.CustomerId = o.CustomerId
JOIN orderdetails od ON o.OrderId = od.OrderId
JOIN products p ON od.ProductId = p.ProductId
WHERE o.IsReturned = 0
GROUP BY r.RegionName
ORDER BY RegionalRevenue DESC;
